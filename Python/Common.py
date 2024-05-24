from typing import Tuple


class SDO_GEOMETRY:
    def __init__(self, geom_type: int=2002, srid: int = -1, elem_info: Tuple[int, int, int] = (1, 2, 1), ordinates: Tuple = ()):
        self.geom_type = geom_type
        self.srid = srid
        self.elem_info = elem_info
        self.ordinates = ordinates
    
    def __str__(self) -> str:
        return f"SDO_GEOMETRY({self.geom_type},{'NULL' if self.srid == -1 else self.srid},NULL,SDO_ELEM_INFO_ARRAY{self.elem_info},SDO_ORDINATE_ARRAY{self.ordinates})"
