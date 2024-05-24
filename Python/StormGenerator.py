# CREATE TABLE Storms (  
#     Storm_ID NUMBER(11) DEFAULT seq_Storms.NEXTVAL,  
#     Mars_Year NUMBER(10) NOT NULL,  
#     Sol VARCHAR2(3) NOT NULL,  
#     Mission_subphase VARCHAR2(255) NOT NULL,  
#     Solar_longitude_Ls NUMBER(14,6) NOT NULL,  
#     LatitudeRange SDO_GEOMETRY NOT NULL
#     Centroid_latitude NUMBER(14,6) NOT NULL,  
#     Area NUMBER(14,6) NOT NULL,  
#     Member_ID VARCHAR2(255) NOT NULL,  
#     Sequence_ID VARCHAR2(20),
#     Confidence_interval NUMBER(10) NOT NULL,  
#     Missing_data NUMBER(1) NOT NULL,  
#     CONSTRAINT pk_Storms PRIMARY KEY (Storm_ID)  
# )

# SDO_GEOMETRY(
#     2002, -- line string geometry
#     NULL, -- SRID
#     NULL,
#     SDO_ELEM_INFO_ARRAY(1, 2, 1), -- Offset, Line string whose vertices are connected by straight line segments.
#     SDO_ORDINATE_ARRAY(Centroid_longitude, Min_latitude, Centroid_longitude, Max_latitude) -- Coordinates for the line string
# );

from typing import Tuple
from Common import SDO_GEOMETRY


class Storm:
    def __init__(self, Mars_Year: int, Sol: str, Mission_subphase: str, Solar_longitude_Ls: float,
                 Centroid_longitude: float, Centroid_latitude: float, Area: float,
                 Member_ID: str, Sequence_ID: str, Max_latitude: float, Min_latitude: float, 
                 Confidence_interval: float, Missing_data: int, LatitudeRange: SDO_GEOMETRY=None):
        self.Storm_ID = None  # Will be assigned automatically by the database
        self.Mars_Year = Mars_Year
        self.Sol = Sol
        self.Mission_subphase = Mission_subphase
        self.Solar_longitude_Ls = Solar_longitude_Ls
        self.LatitudeRange = LatitudeRange if LatitudeRange != None else SDO_GEOMETRY(ordinates=(Centroid_longitude, Min_latitude, Centroid_longitude, Max_latitude))
        self.Centroid_longitude = Centroid_longitude
        self.Max_latitude = Max_latitude
        self.Min_latitude = Min_latitude
        self.Centroid_latitude = Centroid_latitude
        self.Area = Area
        self.Member_ID = Member_ID
        self.Sequence_ID = Sequence_ID
        self.Confidence_interval = Confidence_interval
        self.Missing_data = Missing_data
        
    def to_SQL(self) -> str:
        return f"""INSERT INTO Storms VALUES (DEFAULT, {self.Mars_Year}, '{self.Sol}', '{self.Mission_subphase}', {self.Solar_longitude_Ls}, {self.LatitudeRange}, {self.Centroid_latitude}, {self.Area}, '{self.Member_ID}', '{self.Sequence_ID}', {self.Confidence_interval}, {self.Missing_data});"""

inserts = [
    (29, 'B01', 1, 120.900, 28.8500, 76.9500, 90356.984, 'B01_001', '', 83.2500, 71.3500, 75, 0),
    (29, 'B01', 2, 121.400, 29.6500, 74.2500, 156925.09, 'B01_001', '', 81.9500, 66.8500, 50, 0),
    (29, 'B01', 2, 121.400, -117.050, -7.64999, 35037.652, 'B01_004', '', -5.45000, -9.95000, 100, 0),
    (29, 'B01', 3, 121.800, 36.0500, 71.7500, 209257.09, 'B01_001', '', 77.4500, 64.7500, 50, 0),
    (29, 'B01', 3, 121.800, -146.550, 77.6500, 186898.53, 'B01_006', '', 84.2500, 70.0500, 50, 0),
    (29, 'B01', 4, 122.300, -142.250, 78.5500, 342425.94, 'B01_006', '', 84.8500, 70.3500, 50, 0),
    (29, 'B01', 4, 122.300, -60.1500, 71.6500, 46494.668, 'B01_003', '', 74.6500, 68.1500, 100, 0),
    (29, 'B01', 5, 122.700, -49.3500, 70.8500, 877364.00, 'B01_003', '', 82.7500, 55.1500, 50, 0),
    (29, 'B01', 5, 122.700, -167.550, 78.1500, 194328.81, 'B01_005', '', 82.9500, 73.3500, 75, 0),
    (29, 'B01', 6, 123.100, -50.5500, 68.9500, 1388181.6, 'B01_003', '', 83.7500, 53.2500, 50, 0),
    (29, 'B01', 6, 123.100, -169.250, 78.5500, 240904.91, 'B01_005', '', 84.8500, 72.2500, 75, 0),
    (29, 'B01', 7, 123.600, -47.1500, 67.1500, 1267101.5, 'B01_003', '', 81.2500, 44.5500, 50, 0),
    (29, 'B01', 7, 123.600, -161.750, 76.7500, 223409.77, 'B01_005', '', 83.3500, 70.6500, 75, 0),
    (29, 'B01', 8, 124.000, -55.1500, 70.8500, 979544.44, 'B01_003', '', 81.2500, 58.6500, 50, 0),
    (29, 'B01', 8, 124.000, -153.850, 76.2500, 278184.16, 'B01_005', '', 81.3500, 71.6500, 50, 0),
    (29, 'B01', 9, 124.500, -49.0500, 66.2500, 1139548.9, 'B01_003', '', 79.8500, 53.2500, 50, 0),
    (29, 'B01', 10, 125.000, -42.8500, 64.1500, 617903.00, 'B01_003', '', 72.5500, 54.3500, 50, 0),
    (29, 'B01', 11, 125.400, -36.5500, 64.5500, 646943.69, 'B01_003', '', 75.0500, 52.6500, 50, 0),
    (29, 'B01', 12, 125.800, -103.250, -15.2500, 188883.70, 'B01_009', '', -10.9500, -19.7500, 100, 0),
    (29, 'B01', 14, 126.700, 128.850, 75.9500, 256090.42, 'B01_008', '', 81.4500, 69.9500, 50, 0),
    (29, 'B01', 14, 126.700, 25.2500, -39.7500, 205953.44, 'B01_002', '', -35.8500, -42.9500, 75, 0),
    (29, 'B01', 15, 127.200, 147.650, 72.5500, 428395.44, 'B01_008', '', 78.7500, 67.8500, 50, 0),
    (29, 'B01', 18, 128.400, -44.0500, 61.7500, 509083.56, 'B01_010', '', 71.5500, 51.2500, 50, 1),
    (29, 'B01', 18, 128.400, 21.0500, -39.8500, 157491.11, 'B01_017', '', -36.4500, -43.1500, 75, 1),
    (29, 'B01', 19, 128.900, 29.5500, -37.7500, 35856.617, 'B01_017', '', -36.2500, -39.1500, 75, 0),
    (29, 'B01', 20, 129.400, -91.9500, -20.6500, 1343.6617, 'B01_011', '', -20.1500, -20.9500, 100, 0),
    (29, 'B01', 24, 131.200, 37.5500, -41.1500, 228938.06, 'B01_007', '', -34.6500, -45.1500, 50, 1),
    (29, 'B01', 28, 133.000, -22.4500, -33.6500, 28879.043, 'B01_012', '', -31.9500, -35.8500, 75, 0),
    (29, 'B01', 28, 133.000, 6.85001, -42.7500, 54687.711, 'B01_013', '', -40.8500, -44.5500, 75, 0),
    (29, 'B01', 29, 133.400, 30.9500, -38.3500, 206503.39, 'B01_014', '', -32.5500, -43.0500, 50, 1),
    (29, 'B01', 31, 134.400, -99.8500, -10.5500, 88252.352, 'B01_015', '', -7.14999, -13.9500, 75, 0),
    (29, 'B01', 31, 134.400, 21.8500, -44.2500, 141555.06, 'B01_016', '', -41.3500, -46.1500, 50, 1),
    (29, 'B01', 32, 134.800, 27.5500, -43.7500, 107235.59, 'B01_016', '', -41.9500, -45.5500, 50, 1),
    (29, 'B02', 1, 135.300, 32.1500, -42.4500, 133621.84, 'B01_016', '', -39.8500, -45.3500, 50, 1),
    (29, 'B02', 1, 135.300, -79.9500, -23.9500, 291360.47, 'B02_002', 'B02_01', -19.6500, -28.4500, 75, 0),
    (29, 'B02', 1, 135.300, -25.9500, -39.2500, 306463.44, 'B02_012', 'B02_01', -33.6500, -43.7500, 75, 0),
    (29, 'B02', 1, 135.300, -72.9500, -14.4500, 441562.22, 'B02_003', 'B02_01', -7.05000, -21.4500, 100, 0),
    (29, 'B02', 1, 135.300, -55.2500, -14.9500, 276998.16, 'B02_008', 'B02_01', -8.45000, -20.0500, 100, 0),
    (29, 'B02', 1, 135.300, -39.3500, -28.9500, 477812.00, 'B02_010', 'B02_01', -19.3500, -37.3500, 75, 0),
    (29, 'B02', 2, 135.800, 35.2500, -39.8500, 230865.30, 'B01_016', '', -34.6500, -44.9500, 50, 1),
    (29, 'B02', 2, 135.800, 66.5500, -34.8500, 142513.47, 'B02_004', '', -31.3500, -38.5500, 75, 0),
]

for i in inserts:
    tmpStorm = Storm(*i)
    print(tmpStorm.to_SQL())
    
    