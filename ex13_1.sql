CREATE OR REPLACE TYPE InstallationType_Obj AS OBJECT (
    Type_ID NUMBER(10),
    Name VARCHAR2(255)
);
/
    
CREATE OR REPLACE TYPE Sector_Obj AS OBJECT(
    Sector_ID NUMBER(10),
    MaxLatitude NUMBER(10),
    MinLatitude NUMBER(10),
    MaxLongitude NUMBER(10),
    MinLongitude NUMBER(10)
);
/

CREATE OR REPLACE TYPE InstallationType_VARRAY AS VARRAY(5) OF (InstallationType_Obj);
/
CREATE OR REPLACE TYPE Sector_Table AS TABLE OF Sector_Obj;
/

CREATE OR REPLACE TYPE Installation_Obj AS OBJECT (
    Installation_ID NUMBER(10),
    Type InstallationType_Obj,
    Name VARCHAR2(255)
);
/
CREATE OR REPLACE TYPE installation_table AS TABLE OF installation_obj;
/

CREATE TABLE Installations (
    Installation Installation_Obj,
    Sector_Table_varname Sector_Table
) NESTED TABLE Sector_Table_varname STORE AS Sector_NT_Store;
/


DECLARE
    sector_table_var Sector_Table := Sector_Table();
	tmp_sector sector_obj;

    type_1 InstallationType_Obj := InstallationType_Obj(1, 'Research');
    type_2 InstallationType_Obj := InstallationType_Obj(2, 'Habitat');
    type_3 InstallationType_Obj := InstallationType_Obj(3, 'Power Station');
    type_4 InstallationType_Obj := InstallationType_Obj(4, 'Greenhouse');
    type_5 InstallationType_Obj := InstallationType_Obj(5, 'Life Support');
    type_6 InstallationType_Obj := InstallationType_Obj(6, 'Communications');
    type_7 InstallationType_Obj := InstallationType_Obj(7, 'Storage Facility');
    type_8 InstallationType_Obj := InstallationType_Obj(8, 'Medical Center');
    type_9 InstallationType_Obj := InstallationType_Obj(9, 'Laboratory');
    type_10 InstallationType_Obj := InstallationType_Obj(10, 'Maintenance Facility');


    installation_table_var installation_table := installation_table();
BEGIN
    sector_table_var.EXTEND(19);
    sector_table_var(1) := Sector_Obj(1, 45.75, 30.50, 120.25, 100.00);
    sector_table_var(2) := Sector_Obj(2, 35.00, 20.25, 95.75, 80.50);
    sector_table_var(3) := Sector_Obj(3, 25.50, 10.00, 85.25, 70.00);
    sector_table_var(4) := Sector_Obj(4, 15.75, 5.50, 75.00, 60.25);
    sector_table_var(5) := Sector_Obj(5, 5.00, -5.25, 65.75, 50.50);
    sector_table_var(6) := Sector_Obj(6, -5.50, -15.75, 55.25, 40.00);
    sector_table_var(7) := Sector_Obj(7, -15.75, -25.50, 45.00, 30.25);
    sector_table_var(8) := Sector_Obj(8, -25.50, -35.00, 35.25, 20.00);
    sector_table_var(9) := Sector_Obj(9, -35.25, -45.75, 25.00, 10.25);
    sector_table_var(10) := Sector_Obj(10, -45.75, -55.25, 15.25, 0.00);
    sector_table_var(11) := Sector_Obj(11, -55.50, -65.75, 5.00, -10.25);
    sector_table_var(12) := Sector_Obj(12, -65.75, -75.50, -5.25, -20.00);
    sector_table_var(13) := Sector_Obj(13, -75.50, -85.00, -15.00, -30.25);
    sector_table_var(14) := Sector_Obj(14, -85.25, -90.00, -25.25, -40.00);
    sector_table_var(15) := Sector_Obj(15, -90.00, -95.50, -35.00, -50.25);
    sector_table_var(16) := Sector_Obj(16, -95.50, -100.00, -45.25, -60.00);
    sector_table_var(17) := Sector_Obj(17, -100.25, -105.75, -55.00, -70.25);
    sector_table_var(18) := Sector_Obj(18, -105.75, -110.50, -65.25, -80.00);
    sector_table_var(19) := Sector_Obj(19, -110.50, -115.00, -75.00, -90.25);

    installation_table_var.EXTEND(19);
    installation_table_var(1) := Installation_Obj(1, type_1, 'Mars Research Outpost 1');
    installation_table_var(2) := Installation_Obj(2, type_2, 'Mars Habitat Dome 1');
    installation_table_var(3) := Installation_Obj(3, type_3, 'Mars Power Station Alpha');
    installation_table_var(4) := Installation_Obj(4, type_4, 'Mars Greenhouse Complex');
    installation_table_var(5) := Installation_Obj(5, type_5, 'Mars Life Support Facility');
    installation_table_var(6) := Installation_Obj(6, type_6, 'Mars Communications Hub');
    installation_table_var(7) := Installation_Obj(7, type_7, 'Mars Storage Depot');
    installation_table_var(8) := Installation_Obj(8, type_8, 'Mars Medical Center');
    installation_table_var(9) := Installation_Obj(9, type_9, 'Mars Laboratory Complex');
    installation_table_var(10) := Installation_Obj(10, type_10, 'Mars Maintenance Base');
    installation_table_var(11) := Installation_Obj(11, type_1, 'Mars Research Outpost 2');
    installation_table_var(12) := Installation_Obj(12, type_2, 'Mars Habitat Dome 2');
    installation_table_var(13) := Installation_Obj(13, type_3, 'Mars Power Station Beta');
    installation_table_var(14) := Installation_Obj(14, type_4, 'Mars Greenhouse Complex B');
    installation_table_var(15) := Installation_Obj(15, type_5, 'Mars Life Support Facility 2');
    installation_table_var(16) := Installation_Obj(16, type_6, 'Mars Communications Relay');
    installation_table_var(17) := Installation_Obj(17, type_7, 'Mars Storage Depot 2');
    installation_table_var(18) := Installation_Obj(18, type_8, 'Mars Medical Center B');
    installation_table_var(19) := Installation_Obj(19, type_9, 'Mars Laboratory Complex 2');

    FOR i IN 1..installation_table_var.last 
    LOOP
        INSERT INTO Installations VALUES (
            installation_table_var(i),
        	sector_table_var
        );
    end loop;
END;
/



select Treat(Treat(installation as Installation_Obj).Type as InstallationType_Obj).Name from Installations;
select Treat(Treat(installation as Installation_Obj).Type as InstallationType_Obj).Type_ID from Installations;

select Treat(installation as Installation_Obj).Installation_ID, 
    Treat(Treat(installation as Installation_Obj).type as InstallationType_Obj).Name, 
    Treat(installation as Installation_Obj).Name
from Installations;

select Count(*) from Installations;

select t.*
from   Installations p,
table (p.SECTOR_TABLE_VARNAME) t;