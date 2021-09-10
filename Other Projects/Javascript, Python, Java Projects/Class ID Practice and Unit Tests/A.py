class Student:

    def __init__(self, i, last, first, ph, yr):
        self.i = i
        self.last = last
        self.first = first
        self.ph = ph
        self.yr = yr
        if int(self.yr) > 4:
            self.yr = 4
        if 1 <= int(self.yr) <=4:
            self.yr = yr

    def __str__(self):
        return f"{self.i};{self.first};{self.last};{self.ph},{self.yr}"
    #def __repr__(self):
        return f"<str{str(self)}>"
    def update_year(self):
        if self.yr < 4:
            self.yr += 1

s = Student("1111", "Carter", "Marilyn", "312/473-4837", 1)




    
