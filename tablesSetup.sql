--DROP TABLE PartsUsage CASCADE CONSTRAINTS;
--DROP TABLE ConservationSchedule CASCADE CONSTRAINTS;
--DROP TABLE DamagedParts CASCADE CONSTRAINTS;
--DROP TABLE Specialities CASCADE CONSTRAINTS;
--DROP TABLE Staff CASCADE CONSTRAINTS;
--DROP TABLE PartsInternalCodes CASCADE CONSTRAINTS;
--DROP TABLE PartExternalCodes CASCADE CONSTRAINTS;
--DROP TABLE Installations CASCADE CONSTRAINTS;
--DROP TABLE InstallationTypes CASCADE CONSTRAINTS;
--DROP TABLE Sectors CASCADE CONSTRAINTS;
--DROP TABLE Storms CASCADE CONSTRAINTS;

CREATE SEQUENCE seq_Storms START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_PartExternalCodes START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_Specialities START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_Staff START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_PartsUsage START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_ConservationSchedule START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_DamagedParts START WITH 1 INCREMENT BY 1;

CREATE TABLE Storms (
    Storm_ID NUMBER(11) DEFAULT seq_Storms.NEXTVAL,
    Mars_Year NUMBER(10) NOT NULL,
    Sol VARCHAR2(3) NOT NULL,
    Mission_subphase VARCHAR2(255) NOT NULL,
    Solar_longitude_Ls NUMBER(14,6) NOT NULL,
    Centroid_longitude NUMBER(14,6) NOT NULL,
    Centroid_latitude NUMBER(14,6) NOT NULL,
    Area NUMBER(14,6) NOT NULL,
    Member_ID VARCHAR2(255) NOT NULL,
    Sequence_ID VARCHAR2(20),
    Max_latitude NUMBER(14,6) NOT NULL,
    Min_latitude NUMBER(14,6) NOT NULL,
    Confidence_interval NUMBER(10) NOT NULL,
    Missing_data NUMBER(1) NOT NULL,
    CONSTRAINT pk_Storms PRIMARY KEY (Storm_ID)
);

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

CREATE TABLE PartsInternalCodes (
    Part_ID NUMBER(10), --DEFAULT seq_PartsInternalCodes.NEXTVAL,
    Internal_ID NUMBER(10), --DEFAULT seq_PartsInternalCodes.NEXTVAL,
    CONSTRAINT pk_PartsInternalCodes PRIMARY KEY (Part_ID, Internal_ID)
);

CREATE TABLE PartExternalCodes (
    PartID NUMBER(10) DEFAULT seq_PartExternalCodes.NEXTVAL,
    Name VARCHAR2(255) NOT NULL,
    CONSTRAINT pk_PartExternalCodes PRIMARY KEY (PartID)
);

CREATE TABLE Specialities (
    Speciality_ID NUMBER(10) DEFAULT seq_Specialities.NEXTVAL,
    Name VARCHAR2(255) NOT NULL,
    CONSTRAINT pk_Specialities PRIMARY KEY (Speciality_ID)
);

CREATE TABLE Staff (
    Staff_ID NUMBER(11) DEFAULT seq_Staff.NEXTVAL,
    Name VARCHAR2(255) NOT NULL,
    Surname VARCHAR2(255) NOT NULL,
    Speciality_ID NUMBER(10) NOT NULL,
    Traits VARCHAR2(255) NOT NULL,
    CONSTRAINT pk_Staff PRIMARY KEY (Staff_ID),
    CONSTRAINT fk_Staff_Specialities FOREIGN KEY (Speciality_ID) REFERENCES Specialities(Speciality_ID)
);

CREATE TABLE PartsUsage (
    Installation_ID NUMBER(10) DEFAULT seq_PartsUsage.NEXTVAL,
    Part_ID NUMBER(10) DEFAULT seq_PartsUsage.NEXTVAL,
    Internal_ID NUMBER(10) DEFAULT seq_PartsUsage.NEXTVAL,
    CONSTRAINT pk_PartsUsage PRIMARY KEY (Installation_ID, Part_ID, Internal_ID),
    --CONSTRAINT fk_PartsUsage_Installations FOREIGN KEY (Installation_ID) REFERENCES Installations(Installation_ID),
    CONSTRAINT fk_PartsUsage_PartsInternalCodes FOREIGN KEY (Part_ID, Internal_ID) REFERENCES PartsInternalCodes(Part_ID, Internal_ID)
);

CREATE TABLE ConservationSchedule (
    Task_ID NUMBER(10) DEFAULT seq_ConservationSchedule.NEXTVAL,
    Staff_ID NUMBER(10) NOT NULL,
    StartTime TIMESTAMP NOT NULL,
    EndTime TIMESTAMP NOT NULL,
    CONSTRAINT pk_ConservationSchedule PRIMARY KEY (Task_ID),
    CONSTRAINT fk_ConservationSchedule_Staff FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
);

CREATE TABLE DamagedParts (
    Part_ID NUMBER(10) DEFAULT seq_DamagedParts.NEXTVAL,
    Internal_ID NUMBER(10) DEFAULT seq_DamagedParts.NEXTVAL,
    PresumptedOrReported NUMBER(1) NOT NULL,
    QueuedTask NUMBER(10),
    Cause_ID VARCHAR(7),
    Severity NUMBER(10) NOT NULL,
    CONSTRAINT pk_DamagedParts PRIMARY KEY (Part_ID, Internal_ID),
    CONSTRAINT fk_DamagedParts_PartsInternalCodes FOREIGN KEY (Part_ID, Internal_ID) REFERENCES PartsInternalCodes(Part_ID, Internal_ID),
    CONSTRAINT fk_DamagedParts_ConservationSchedule FOREIGN KEY (QueuedTask) REFERENCES ConservationSchedule(Task_ID)
    --CONSTRAINT fk_DamagedParts_Storms FOREIGN KEY (Cause_ID) REFERENCES Storms(Sequence_ID)
    --CONSTRAINT fk_DamagedParts_Staff FOREIGN KEY (Cause_ID) REFERENCES Staff(Staff_ID)
) ORGANIZATION INDEX;


-- select Treat(Treat(installation as Installation_Obj).Type as InstallationType_Obj).Name from Installations;
-- select Treat(Treat(installation as Installation_Obj).Type as InstallationType_Obj).Type_ID from Installations;

-- select Treat(installation as Installation_Obj).Installation_ID, 
--     Treat(Treat(installation as Installation_Obj).type as InstallationType_Obj).Name, 
--     Treat(installation as Installation_Obj).Name
-- from Installations;

-- select Count(*) from Installations;

-- select t.*
-- from   Installations p,
-- table (p.SECTOR_TABLE_VARNAME) t;