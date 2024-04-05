CREATE VIEW DamagingStaff AS
SELECT DISTINCT s.*
FROM Staff s
JOIN DamagedParts dp ON s.Staff_ID = dp.Cause_ID;

CREATE VIEW InstallationTypeCounts AS
SELECT s.Sector_ID,
       s.MaxLatitude,
       s.MinLatitude,
       s.MaxLongitude,
       s.MinLongitude,
       it.Name AS InstallationType,
       COUNT(*) AS Count
FROM Installations i
JOIN InstallationTypes it ON i.Type_ID = it.Type_ID
JOIN Sectors s ON i.Sector_ID = s.Sector_ID
GROUP BY s.Sector_ID, s.MaxLatitude, s.MinLatitude, s.MaxLongitude, s.MinLongitude, it.Name;