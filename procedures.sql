CREATE OR REPLACE PROCEDURE Get_sol_report (v_sol_id IN VARCHAR2, v_mars_year IN NUMBER)
IS
    CURSOR c_sol_rep(par_sol VARCHAR2, par_year NUMBER) IS 
        SELECT Mars_Year, Sol, Storms.Storm_ID, COUNT(DamagedParts.Cause_ID) as Casualties_amount
        FROM Storms 
        LEFT JOIN DamagedParts ON 'S' || Storms.Storm_ID = DamagedParts.Cause_ID
        WHERE Storms.Sol = par_sol
            AND Storms.Mars_Year = par_year
        GROUP BY Mars_Year, Sol, Storms.Storm_ID;
    v_mars_year_param storms.mars_year%TYPE;
    v_sol_param storms.sol%TYPE;
    v_storm_id storms.storm_id%TYPE;
    v_casualties_amount NUMBER;
BEGIN
    OPEN c_sol_rep(v_sol_id, v_mars_year);
    LOOP
        FETCH c_sol_rep INTO v_mars_year_param, v_sol_param, v_storm_id, v_casualties_amount;
        EXIT WHEN c_sol_rep%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Mars Year: ' || v_mars_year_param || ', Sol: ' || v_sol_param || ', Storm ID: ' || v_storm_id || ', Casualties Amount: ' || v_casualties_amount);
    END LOOP;
    CLOSE c_sol_rep;
EXCEPTION
    WHEN OTHERS THEN
        IF c_sol_rep%ISOPEN THEN
            CLOSE c_sol_rep;
        END IF;
END Get_sol_report;
/
