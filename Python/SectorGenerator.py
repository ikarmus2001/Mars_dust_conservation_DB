from Common import SDO_GEOMETRY


class Sector:
    def __init__(self, Sector_ID: int, Min_longitude=None, Min_latitude=None, Max_longitude=None, Max_latitude=None, Sector_Rectangle: SDO_GEOMETRY = None):
        self.Sector_ID = Sector_ID
        self.Max_latitude = Max_latitude
        self.Min_latitude = Min_latitude
        self.Max_longitude = Max_longitude
        self.Min_longitude = Min_longitude
        self.Sector_Rectangle = Sector_Rectangle if Sector_Rectangle != None else SDO_GEOMETRY(ordinates=(Min_longitude, Min_latitude, Max_longitude, Max_latitude))
    
    def to_SQL(self):
        return f"INSERT INTO Sector_Table Values Sector_Obj({self.Sector_ID}, {self.Sector_Rectangle})"


inserts = [
    (1, 45.75, 30.50, 120.25, 100.00),
    (2, 35.00, 20.25, 95.75, 80.50),
    (3, 25.50, 10.00, 85.25, 70.00),
    (4, 15.75, 5.50, 75.00, 60.25),
    (5, 5.00, -5.25, 65.75, 50.50),
    (6, -5.50, -15.75, 55.25, 40.00),
    (7, -15.75, -25.50, 45.00, 30.25),
    (8, -25.50, -35.00, 35.25, 20.00),
    (9, -35.25, -45.75, 25.00, 10.25),
    (10, -45.75, -55.25, 15.25, 0.00),
    (11, -55.50, -65.75, 5.00, -10.25),
    (12, -65.75, -75.50, -5.25, -20.00),
    (13, -75.50, -85.00, -15.00, -30.25),
    (14, -85.25, -90.00, -25.25, -40.00),
    (15, -90.00, -95.50, -35.00, -50.25),
    (16, -95.50, -100.00, -45.25, -60.00),
    (17, -100.25, -105.75, -55.00, -70.25),
    (18, -105.75, -110.50, -65.25, -80.00),
    (19, -110.50, -115.00, -75.00, -90.25),
]


for i in inserts:
    tmp = Sector(*i)
    print(tmp.to_SQL())


from PIL import Image, ImageDraw

def calculate_center(rect):
    x1, y1, x2, y2 = rect
    return (x1 + x2) // 2, (y1 + y2) // 2

width, height = 400, 300
background_color = (255, 255, 255)  # white
image = Image.new("RGB", (width, height), background_color)

draw = ImageDraw.Draw(image)
for i in inserts:
    tmp = Sector(*i)
    rect = (tmp.Min_latitude+150, tmp.Min_longitude+150, tmp.Max_latitude+150, tmp.Max_longitude+150)
    draw.rectangle(rect, fill="blue", outline="black")
    draw.text(calculate_center(rect), str(tmp.Sector_ID), fill="white", anchor="mm")


image.save("rectangles.png")
