--Maciej Kuczynski i Kacper Halaczkiewicz
--projekt: baza burz piaskowych na Marsie i zniszczen przez nie wywolanych

--nazwa pakietu: storms_package
CREATE OR REPLACE PACKAGE storms_package AS
	--procedura: dodanie nowej instalacji
    PROCEDURE add_new_installation(
    p_installation_id IN NUMBER,
    p_sector_id IN NUMBER,
    p_type_id IN NUMBER,
    p_name IN VARCHAR2
  );

  PROCEDURE ShowDamagedPartsInfo;

	--wyjatek rzucany przy nieudanym dodawaniu instalacji
	INSTALLATION_ADD_ERROR EXCEPTION;

	--funkcja: zwraca liczbe burz w roku podanym jako parametr
	FUNCTION get_storm_in_year_count(
        p_mars_year IN NUMBER
    ) RETURN NUMBER;

	--funkcja: zwraca liste burz w solu podanym jako parametr
	FUNCTION get_storms_in_sol_list(
    p_sol IN VARCHAR2
  ) RETURN SYS_REFCURSOR;

END storms_package;

/
CREATE OR REPLACE PACKAGE BODY storms_package AS

  PROCEDURE ShowDamagedPartsInfo
  AS
      CURSOR damaged_parts_cursor IS (
          SELECT pec.Name as PartName, i.Name AS InstallationName
          FROM DamagedParts dp
              LEFT JOIN PartsInternalCodes pic ON dp.Part_ID = pic.Part_ID AND dp.Internal_ID = pic.Internal_ID
              LEFT JOIN PartExternalCodes pec ON pic.Part_ID = pec.PartID
              LEFT JOIN PartsUsage pu ON pic.Part_ID = pu.Part_ID AND pic.Internal_ID = pu.Internal_ID
              LEFT JOIN Installations i ON pu.Installation_ID = i.Installation_ID
      );
    PartName PartExternalCodes.Name%TYPE;
    InstallationName Installations.Name%TYPE;
  BEGIN
      OPEN damaged_parts_cursor;
      LOOP
          FETCH damaged_parts_cursor INTO PartName, InstallationName;
          EXIT WHEN damaged_parts_cursor%NOTFOUND;
          DBMS_OUTPUT.PUT_LINE('Damaged Part: ' || PartName || ', Installation: ' || InstallationName);
      END LOOP;
      CLOSE damaged_parts_cursor;
  END;

  -- Procedura dodająca nowy wiatr do tabeli wiatrów
  PROCEDURE add_new_installation(
    p_installation_id IN NUMBER,
    p_sector_id IN NUMBER,
    p_type_id IN NUMBER,
    p_name IN VARCHAR2
  ) IS
  BEGIN
    INSERT INTO installations (installation_id, sector_id, type_id, name)
    VALUES (p_installation_id, p_sector_id, p_type_id, p_name);
    
    COMMIT;

EXCEPTION
    WHEN OTHERS THEN RAISE INSTALLATION_ADD_ERROR;

END add_new_installation;

FUNCTION get_storm_in_year_count(
    p_mars_year IN NUMBER
  ) RETURN NUMBER IS
    v_storm_count NUMBER;
  BEGIN
    SELECT COUNT(*) INTO v_storm_count
    FROM storms
    WHERE mars_year = p_mars_year;
    
    RETURN v_storm_count;
  END get_storm_in_year_count;

FUNCTION get_storms_in_sol_list(
    p_sol IN VARCHAR2
  ) RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
  BEGIN
    OPEN v_cursor FOR
    SELECT *
    FROM storms
    WHERE sol = p_sol;
    
    RETURN v_cursor;
  END get_storms_in_sol_list;

END storms_package;
/

BEGIN storms_package.add_new_installation(20, 5, 5, 'Mars Water Bank');
COMMIT;
EXCEPTION WHEN storms_package.INSTALLATION_ADD_ERROR THEN DBMS_OUTPUT.PUT_LINE('Wystapil blad przy dodawaniu instalacji.');
END;
/

DECLARE v_storms_in_year_29 NUMBER;
BEGIN v_storms_in_year_29 := storms_package.get_storm_in_year_count(29);
DBMS_OUTPUT.PUT_LINE('Liczba burz w roku 29: ' || v_storms_in_year_29);
END;
/

DECLARE v_storms_in_year_30 NUMBER;
BEGIN v_storms_in_year_30 := storms_package.get_storm_in_year_count(30);
DBMS_OUTPUT.PUT_LINE('Liczba burz w roku 30: ' || v_storms_in_year_30);
END;
/

DECLARE
  v_sol_cursor SYS_REFCURSOR;
  v_storm_rec storms%ROWTYPE;
BEGIN
  v_sol_cursor := storms_package.get_storms_in_sol_list('B02');
  LOOP
    FETCH v_sol_cursor INTO v_storm_rec;
    EXIT WHEN v_sol_cursor%NOTFOUND;
	DBMS_OUTPUT.PUT_LINE('Mars year: ' || v_storm_rec.mars_year);
    DBMS_OUTPUT.PUT_LINE('Mission subphase: ' || v_storm_rec.mission_subphase);
	DBMS_OUTPUT.PUT_LINE('Solar longitude: ' || v_storm_rec.solar_longitude_ls);
	DBMS_OUTPUT.PUT_LINE('Centroid longitude: ' || v_storm_rec.centroid_longitude);
	DBMS_OUTPUT.PUT_LINE('Centroid latitude: ' || v_storm_rec.centroid_latitude);
	DBMS_OUTPUT.PUT_LINE('Area: ' || v_storm_rec.area);
	DBMS_OUTPUT.PUT_LINE('Member ID: ' || v_storm_rec.member_id);
	DBMS_OUTPUT.PUT_LINE('Sequence ID: ' || v_storm_rec.sequence_id);
	DBMS_OUTPUT.PUT_LINE('Max latitude: ' || v_storm_rec.max_latitude);
	DBMS_OUTPUT.PUT_LINE('Min latitude: ' || v_storm_rec.min_latitude);
	DBMS_OUTPUT.PUT_LINE('Confidence interval: ' || v_storm_rec.confidence_interval);
	DBMS_OUTPUT.PUT_LINE('Missing data: ' || v_storm_rec.missing_data);
	DBMS_OUTPUT.PUT_LINE('---');
  END LOOP;
  CLOSE v_sol_cursor;
END;



--Trigger pozwalajacy na sprawdzenie, czy imie i nazwisko personelu jest pisane z duzej litery.
--Umozliwia pobieranie nowego ID z sekwencji seq_Staff.
CREATE OR REPLACE TRIGGER unify_data_trigger
BEFORE INSERT ON Staff
FOR EACH ROW
BEGIN
    :NEW.name := INITCAP(:NEW.name);
    
    :NEW.surname := INITCAP(:NEW.surname);
    
    :NEW.staff_id := seq_Staff.NEXTVAL;
END;
/

--Trigger umozliwiajacy uaktualnienie pola Cause_ID w tabeli DamagedParts,
--jezeli zmienia sie Sequence_ID w tabeli Storms
CREATE OR REPLACE TRIGGER update_cause_id_trigger
AFTER UPDATE OF Sequence_ID ON Storms
FOR EACH ROW
BEGIN
    UPDATE DamagedParts
    SET Cause_ID = :NEW.Sequence_ID
    WHERE Cause_ID = :OLD.Sequence_ID;
END;
/

--Trigger umozliwiajacy edycje pola Type_ID tabeli InstallationTypes
--poprzez perspektywe InstallatioTypeCounts
CREATE OR REPLACE TRIGGER instead_of_modify_InstallationTypeCounts
INSTEAD OF UPDATE ON InstallationTypeCounts
FOR EACH ROW
BEGIN
    UPDATE InstallationTypes
    SET Name = (
        SELECT :NEW.InstallationType
        FROM dual
    )
    WHERE Type_ID = (
        SELECT Type_ID
        FROM InstallationTypes
        WHERE Name = :OLD.InstallationType
    );
END;
/

begin
  ShowDamagedPartsInfo();
end;