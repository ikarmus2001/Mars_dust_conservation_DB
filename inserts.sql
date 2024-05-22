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

	-- INSERT INTO Installations VALUES (
 --            installation_table_var(1),
 --        	sector_table_var
 --        );

    FOR i IN 1..installation_table_var.last 
    LOOP
        INSERT INTO Installations VALUES (
            installation_table_var(i),
        	sector_table_var
        );
    end loop;
END;
/

INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 1, 120.900, 28.8500, 76.9500, 90356.984, 'B01_001', NULL, 83.2500, 71.3500, 75, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 2, 121.400, 29.6500, 74.2500, 156925.09, 'B01_001', NULL, 81.9500, 66.8500, 50, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 2, 121.400, -117.050, -7.64999, 35037.652, 'B01_004', NULL, -5.45000, -9.95000, 100, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 3, 121.800, 36.0500, 71.7500, 209257.09, 'B01_001', NULL, 77.4500, 64.7500, 50, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 3, 121.800, -146.550, 77.6500, 186898.53, 'B01_006', NULL, 84.2500, 70.0500, 50, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 4, 122.300, -142.250, 78.5500, 342425.94, 'B01_006', NULL, 84.8500, 70.3500, 50, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 4, 122.300, -60.1500, 71.6500, 46494.668, 'B01_003', NULL, 74.6500, 68.1500, 100, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 5, 122.700, -49.3500, 70.8500, 877364.00, 'B01_003', NULL, 82.7500, 55.1500, 50, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 5, 122.700, -167.550, 78.1500, 194328.81, 'B01_005', NULL, 82.9500, 73.3500, 75, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 6, 123.100, -50.5500, 68.9500, 1388181.6, 'B01_003', NULL, 83.7500, 53.2500, 50, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 6, 123.100, -169.250, 78.5500, 240904.91, 'B01_005', NULL, 84.8500, 72.2500, 75, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 7, 123.600, -47.1500, 67.1500, 1267101.5, 'B01_003', NULL, 81.2500, 44.5500, 50, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 7, 123.600, -161.750, 76.7500, 223409.77, 'B01_005', NULL, 83.3500, 70.6500, 75, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 8, 124.000, -55.1500, 70.8500, 979544.44, 'B01_003', NULL, 81.2500, 58.6500, 50, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 8, 124.000, -153.850, 76.2500, 278184.16, 'B01_005', NULL, 81.3500, 71.6500, 50, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 9, 124.500, -49.0500, 66.2500, 1139548.9, 'B01_003', NULL, 79.8500, 53.2500, 50, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 10, 125.000, -42.8500, 64.1500, 617903.00, 'B01_003', NULL, 72.5500, 54.3500, 50, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 11, 125.400, -36.5500, 64.5500, 646943.69, 'B01_003', NULL, 75.0500, 52.6500, 50, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 12, 125.800, -103.250, -15.2500, 188883.70, 'B01_009', NULL, -10.9500, -19.7500, 100, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 14, 126.700, 128.850, 75.9500, 256090.42, 'B01_008', NULL, 81.4500, 69.9500, 50, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 14, 126.700, 25.2500, -39.7500, 205953.44, 'B01_002', NULL, -35.8500, -42.9500, 75, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 15, 127.200, 147.650, 72.5500, 428395.44, 'B01_008', NULL, 78.7500, 67.8500, 50, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 18, 128.400, -44.0500, 61.7500, 509083.56, 'B01_010', NULL, 71.5500, 51.2500, 50, 1);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 18, 128.400, 21.0500, -39.8500, 157491.11, 'B01_017', NULL, -36.4500, -43.1500, 75, 1);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 19, 128.900, 29.5500, -37.7500, 35856.617, 'B01_017', NULL, -36.2500, -39.1500, 75, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 20, 129.400, -91.9500, -20.6500, 1343.6617, 'B01_011', NULL, -20.1500, -20.9500, 100, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 24, 131.200, 37.5500, -41.1500, 228938.06, 'B01_007', NULL, -34.6500, -45.1500, 50, 1);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 28, 133.000, -22.4500, -33.6500, 28879.043, 'B01_012', NULL, -31.9500, -35.8500, 75, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 28, 133.000, 6.85001, -42.7500, 54687.711, 'B01_013', NULL, -40.8500, -44.5500, 75, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 29, 133.400, 30.9500, -38.3500, 206503.39, 'B01_014', NULL, -32.5500, -43.0500, 50, 1);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 31, 134.400, -99.8500, -10.5500, 88252.352, 'B01_015', NULL, -7.14999, -13.9500, 75, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 31, 134.400, 21.8500, -44.2500, 141555.06, 'B01_016', NULL, -41.3500, -46.1500, 50, 1);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B01', 32, 134.800, 27.5500, -43.7500, 107235.59, 'B01_016', NULL, -41.9500, -45.5500, 50, 1);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B02', 1, 135.300, 32.1500, -42.4500, 133621.84, 'B01_016', NULL, -39.8500, -45.3500, 50, 1);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B02', 1, 135.300, -79.9500, -23.9500, 291360.47, 'B02_002', 'B02_01', -19.6500, -28.4500, 75, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B02', 1, 135.300, -25.9500, -39.2500, 306463.44, 'B02_012', 'B02_01', -33.6500, -43.7500, 75, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B02', 1, 135.300, -72.9500, -14.4500, 441562.22, 'B02_003', 'B02_01', -7.05000, -21.4500, 100, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B02', 1, 135.300, -55.2500, -14.9500, 276998.16, 'B02_008', 'B02_01', -8.45000, -20.0500, 100, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B02', 1, 135.300, -39.3500, -28.9500, 477812.00, 'B02_010', 'B02_01', -19.3500, -37.3500, 75, 0);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B02', 2, 135.800, 35.2500, -39.8500, 230865.30, 'B01_016', NULL, -34.6500, -44.9500, 50, 1);
INSERT INTO Storms VALUES (DEFAULT, 29, 'B02', 2, 135.800, 66.5500, -34.8500, 142513.47, 'B02_004', NULL, -31.3500, -38.5500, 75, 0);

INSERT INTO PartsInternalCodes (Part_ID, Internal_ID) VALUES (1, 1001);
INSERT INTO PartsInternalCodes (Part_ID, Internal_ID) VALUES (2, 1002);
INSERT INTO PartsInternalCodes (Part_ID, Internal_ID) VALUES (3, 1003);
INSERT INTO PartsInternalCodes (Part_ID, Internal_ID) VALUES (4, 1004);
INSERT INTO PartsInternalCodes (Part_ID, Internal_ID) VALUES (5, 1005);
INSERT INTO PartsInternalCodes (Part_ID, Internal_ID) VALUES (6, 1006);
INSERT INTO PartsInternalCodes (Part_ID, Internal_ID) VALUES (7, 1007);
INSERT INTO PartsInternalCodes (Part_ID, Internal_ID) VALUES (8, 1008);
INSERT INTO PartsInternalCodes (Part_ID, Internal_ID) VALUES (9, 1009);
INSERT INTO PartsInternalCodes (Part_ID, Internal_ID) VALUES (10, 1010);
INSERT INTO PartsInternalCodes (Part_ID, Internal_ID) VALUES (11, 1011);
INSERT INTO PartsInternalCodes (Part_ID, Internal_ID) VALUES (12, 1012);
INSERT INTO PartsInternalCodes (Part_ID, Internal_ID) VALUES (13, 1013);
INSERT INTO PartsInternalCodes (Part_ID, Internal_ID) VALUES (14, 1014);
INSERT INTO PartsInternalCodes (Part_ID, Internal_ID) VALUES (15, 1015);
INSERT INTO PartsInternalCodes (Part_ID, Internal_ID) VALUES (16, 1016);
INSERT INTO PartsInternalCodes (Part_ID, Internal_ID) VALUES (17, 1017);
INSERT INTO PartsInternalCodes (Part_ID, Internal_ID) VALUES (18, 1018);
INSERT INTO PartsInternalCodes (Part_ID, Internal_ID) VALUES (19, 1019);
INSERT INTO PartsInternalCodes (Part_ID, Internal_ID) VALUES (20, 1020);


INSERT INTO PartExternalCodes (Name) VALUES ('ABC123');
INSERT INTO PartExternalCodes (Name) VALUES ('DEF456');
INSERT INTO PartExternalCodes (Name) VALUES ('GHI789');
INSERT INTO PartExternalCodes (Name) VALUES ('JKL012');
INSERT INTO PartExternalCodes (Name) VALUES ('MNO345');
INSERT INTO PartExternalCodes (Name) VALUES ('PQR678');
INSERT INTO PartExternalCodes (Name) VALUES ('STU901');
INSERT INTO PartExternalCodes (Name) VALUES ('VWX234');
INSERT INTO PartExternalCodes (Name) VALUES ('YZA567');
INSERT INTO PartExternalCodes (Name) VALUES ('BCD890');
INSERT INTO PartExternalCodes (Name) VALUES ('EFG123');
INSERT INTO PartExternalCodes (Name) VALUES ('HIJ456');
INSERT INTO PartExternalCodes (Name) VALUES ('KLM789');
INSERT INTO PartExternalCodes (Name) VALUES ('NOP012');
INSERT INTO PartExternalCodes (Name) VALUES ('QRS345');
INSERT INTO PartExternalCodes (Name) VALUES ('TUV678');
INSERT INTO PartExternalCodes (Name) VALUES ('WXY901');
INSERT INTO PartExternalCodes (Name) VALUES ('ZAB234');
INSERT INTO PartExternalCodes (Name) VALUES ('CDE567');
INSERT INTO PartExternalCodes (Name) VALUES ('FGH890');

INSERT INTO Specialities (Name) VALUES ('Astrobiology');
INSERT INTO Specialities (Name) VALUES ('Astronautics');
INSERT INTO Specialities (Name) VALUES ('Geology');
INSERT INTO Specialities (Name) VALUES ('Space Medicine');
INSERT INTO Specialities (Name) VALUES ('Botany');
INSERT INTO Specialities (Name) VALUES ('Engineering');
INSERT INTO Specialities (Name) VALUES ('Exobiology');
INSERT INTO Specialities (Name) VALUES ('Planetary Science');
INSERT INTO Specialities (Name) VALUES ('Mars Colonization');
INSERT INTO Specialities (Name) VALUES ('Remote Sensing');

INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('John', 'Smith', 1, 'Analytical, Detail-oriented');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Emma', 'Johnson', 2, 'Team Player, Problem Solver');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Michael', 'Williams', 3, 'Adaptable, Field Experience');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Jessica', 'Brown', 4, 'Empathetic, Crisis Management');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('David', 'Jones', 5, 'Organized, Green Thumb');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Sarah', 'Davis', 6, 'Innovative, Problem Solver');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Christopher', 'Miller', 7, 'Detail-oriented, Analytical');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Ashley', 'Wilson', 8, 'Creative, Detail-oriented');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Matthew', 'Taylor', 9, 'Adaptable, Field Experience');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Emily', 'Anderson', 10, 'Organized, Crisis Management');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Daniel', 'Martinez', 1, 'Curious, Problem Solver');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Olivia', 'Garcia', 2, 'Detail-oriented, Analytical');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Alexander', 'Rodriguez', 3, 'Innovative, Team Player');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Sophia', 'Hernandez', 4, 'Empathetic, Quick Thinker');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Ethan', 'Lopez', 5, 'Adaptable, Problem Solver');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Isabella', 'Martinez', 6, 'Detail-oriented, Field Experience');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Mason', 'Gonzalez', 7, 'Analytical, Green Thumb');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Ava', 'Wilson', 8, 'Creative, Team Player');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Jacob', 'Perez', 9, 'Adaptable, Crisis Management');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Mia', 'Sanchez', 10, 'Organized, Problem Solver');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('William', 'Smith', 1, 'Detail-oriented, Analytical');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Sophia', 'Johnson', 2, 'Innovative, Quick Thinker');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('James', 'Brown', 3, 'Adaptable, Team Player');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Emily', 'Jones', 4, 'Empathetic, Crisis Management');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Benjamin', 'Davis', 5, 'Detail-oriented, Analytical');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Avery', 'Miller', 6, 'Curious, Problem Solver');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Daniel', 'Wilson', 7, 'Innovative, Field Experience');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Madison', 'Taylor', 8, 'Organized, Team Player');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Alexander', 'Anderson', 9, 'Adaptable, Green Thumb');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Chloe', 'Martinez', 10, 'Detail-oriented, Quick Thinker');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Ryan', 'Garcia', 1, 'Creative, Crisis Management');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Lily', 'Rodriguez', 2, 'Analytical, Team Player');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Jack', 'Hernandez', 3, 'Innovative, Problem Solver');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Charlotte', 'Lopez', 4, 'Empathetic, Quick Thinker');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Michael', 'Martinez', 5, 'Detail-oriented, Analytical');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Grace', 'Gonzalez', 6, 'Innovative, Field Experience');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Jacob', 'Wilson', 7, 'Adaptable, Team Player');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Amelia', 'Perez', 8, 'Detail-oriented, Problem Solver');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Daniel', 'Sanchez', 9, 'Innovative, Crisis Management');
INSERT INTO Staff (Name, Surname, Speciality_ID, Traits) VALUES ('Elizabeth', 'Smith', 10, 'Organized, Analytical');

INSERT INTO PartsUsage (Installation_ID, Part_ID, Internal_ID) VALUES (1, 1, 1001);
INSERT INTO PartsUsage (Installation_ID, Part_ID, Internal_ID) VALUES (2, 2, 1002);
INSERT INTO PartsUsage (Installation_ID, Part_ID, Internal_ID) VALUES (3, 3, 1003);
INSERT INTO PartsUsage (Installation_ID, Part_ID, Internal_ID) VALUES (4, 4, 1004);
INSERT INTO PartsUsage (Installation_ID, Part_ID, Internal_ID) VALUES (5, 5, 1005);
INSERT INTO PartsUsage (Installation_ID, Part_ID, Internal_ID) VALUES (6, 6, 1006);
INSERT INTO PartsUsage (Installation_ID, Part_ID, Internal_ID) VALUES (7, 7, 1007);
INSERT INTO PartsUsage (Installation_ID, Part_ID, Internal_ID) VALUES (8, 8, 1008);
INSERT INTO PartsUsage (Installation_ID, Part_ID, Internal_ID) VALUES (9, 9, 1009);
INSERT INTO PartsUsage (Installation_ID, Part_ID, Internal_ID) VALUES (10, 10, 1010);
INSERT INTO PartsUsage (Installation_ID, Part_ID, Internal_ID) VALUES (11, 11, 1011);
INSERT INTO PartsUsage (Installation_ID, Part_ID, Internal_ID) VALUES (12, 12, 1012);
INSERT INTO PartsUsage (Installation_ID, Part_ID, Internal_ID) VALUES (13, 13, 1013);
INSERT INTO PartsUsage (Installation_ID, Part_ID, Internal_ID) VALUES (14, 14, 1014);
INSERT INTO PartsUsage (Installation_ID, Part_ID, Internal_ID) VALUES (15, 15, 1015);
INSERT INTO PartsUsage (Installation_ID, Part_ID, Internal_ID) VALUES (16, 16, 1016);
INSERT INTO PartsUsage (Installation_ID, Part_ID, Internal_ID) VALUES (17, 17, 1017);
INSERT INTO PartsUsage (Installation_ID, Part_ID, Internal_ID) VALUES (18, 18, 1018);
INSERT INTO PartsUsage (Installation_ID, Part_ID, Internal_ID) VALUES (19, 19, 1019);


INSERT INTO ConservationSchedule (Staff_ID, StartTime, EndTime)
VALUES (1, TO_DATE('2023-09-15 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-09-15 12:45:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO ConservationSchedule (Staff_ID, StartTime, EndTime) 
VALUES (2, TO_DATE('2023-09-20 10:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-09-20 15:30:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO ConservationSchedule (Staff_ID, StartTime, EndTime) 
VALUES (3, TO_DATE('2023-11-05 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-11-05 11:45:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO ConservationSchedule (Staff_ID, StartTime, EndTime) 
VALUES (4, TO_DATE('2023-08-25 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-08-25 14:45:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO ConservationSchedule (Staff_ID, StartTime, EndTime) 
VALUES (5, TO_DATE('2023-12-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-12-01 12:15:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO ConservationSchedule (Staff_ID, StartTime, EndTime) 
VALUES (6, TO_DATE('2023-07-17 07:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-07-17 11:30:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO ConservationSchedule (Staff_ID, StartTime, EndTime) 
VALUES (7, TO_DATE('2023-05-30 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-05-30 13:45:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO ConservationSchedule (Staff_ID, StartTime, EndTime) 
VALUES (8, TO_DATE('2023-04-22 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-04-22 16:15:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO ConservationSchedule (Staff_ID, StartTime, EndTime) 
VALUES (9, TO_DATE('2023-06-10 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-06-10 15:30:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO ConservationSchedule (Staff_ID, StartTime, EndTime) 
VALUES (10, TO_DATE('2023-03-05 08:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-03-05 13:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO DamagedParts (Part_ID, Internal_ID, PresumptedOrReported, QueuedTask, Cause_ID, Severity) VALUES (1, 1001, 1, NULL, 'B01_001', 3);
INSERT INTO DamagedParts (Part_ID, Internal_ID, PresumptedOrReported, QueuedTask, Cause_ID, Severity) VALUES (2, 1002, 1, NULL, 'B01_002', 2);
INSERT INTO DamagedParts (Part_ID, Internal_ID, PresumptedOrReported, QueuedTask, Cause_ID, Severity) VALUES (3, 1003, 1, NULL, 'B01_003', 4);
INSERT INTO DamagedParts (Part_ID, Internal_ID, PresumptedOrReported, QueuedTask, Cause_ID, Severity) VALUES (4, 1004, 1, NULL, 'B01_004', 1);
INSERT INTO DamagedParts (Part_ID, Internal_ID, PresumptedOrReported, QueuedTask, Cause_ID, Severity) VALUES (5, 1005, 1, NULL, 'B01_005', 2);
INSERT INTO DamagedParts (Part_ID, Internal_ID, PresumptedOrReported, QueuedTask, Cause_ID, Severity) VALUES (6, 1006, 1, NULL, 'B01_006', 3);
INSERT INTO DamagedParts (Part_ID, Internal_ID, PresumptedOrReported, QueuedTask, Cause_ID, Severity) VALUES (7, 1007, 1, NULL, 'B01_007', 4);
INSERT INTO DamagedParts (Part_ID, Internal_ID, PresumptedOrReported, QueuedTask, Cause_ID, Severity) VALUES (8, 1008, 1, NULL, 'B01_008', 1);
INSERT INTO DamagedParts (Part_ID, Internal_ID, PresumptedOrReported, QueuedTask, Cause_ID, Severity) VALUES (9, 1009, 1, NULL, 'B01_009', 2);
INSERT INTO DamagedParts (Part_ID, Internal_ID, PresumptedOrReported, QueuedTask, Cause_ID, Severity) VALUES (10, 1010, 1, NULL, 'B01_010', 3);
INSERT INTO DamagedParts (Part_ID, Internal_ID, PresumptedOrReported, QueuedTask, Cause_ID, Severity) VALUES (11, 1011, 1, NULL, 'B01_011', 4);
INSERT INTO DamagedParts (Part_ID, Internal_ID, PresumptedOrReported, QueuedTask, Cause_ID, Severity) VALUES (12, 1012, 1, NULL, 'B01_012', 1);
INSERT INTO DamagedParts (Part_ID, Internal_ID, PresumptedOrReported, QueuedTask, Cause_ID, Severity) VALUES (13, 1013, 1, NULL, 'B01_013', 2);
INSERT INTO DamagedParts (Part_ID, Internal_ID, PresumptedOrReported, QueuedTask, Cause_ID, Severity) VALUES (14, 1014, 1, NULL, 'B01_014', 3);
INSERT INTO DamagedParts (Part_ID, Internal_ID, PresumptedOrReported, QueuedTask, Cause_ID, Severity) VALUES (15, 1015, 1, NULL, 'B01_015', 4);
INSERT INTO DamagedParts (Part_ID, Internal_ID, PresumptedOrReported, QueuedTask, Cause_ID, Severity) VALUES (16, 1016, 1, NULL, 'B01_016', 1);
INSERT INTO DamagedParts (Part_ID, Internal_ID, PresumptedOrReported, QueuedTask, Cause_ID, Severity) VALUES (17, 1017, 1, NULL, 'B01_017', 2);
INSERT INTO DamagedParts (Part_ID, Internal_ID, PresumptedOrReported, QueuedTask, Cause_ID, Severity) VALUES (18, 1018, 1, NULL, 'B01_018', 3);
INSERT INTO DamagedParts (Part_ID, Internal_ID, PresumptedOrReported, QueuedTask, Cause_ID, Severity) VALUES (19, 1019, 1, NULL, 'B01_019', 4);
INSERT INTO DamagedParts (Part_ID, Internal_ID, PresumptedOrReported, QueuedTask, Cause_ID, Severity) VALUES (20, 1020, 1, NULL, 'B01_020', 1);
