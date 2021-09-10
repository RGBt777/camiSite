#Alex Marzella
#IT 212
#Jost
#October 4

#importing student class
from MarzellaProj4a import Student


class onlineStudent(Student):

    def __init__(self, i, last, first, ph, yr, em):
        #importing init from student class
        super().__init__(i, last, first, ph, yr)
        self.em = em
        self.study_group = [ ]
    def __str__(self):
        return f"{self.i};{self.first};{self.last};{self.ph},{self.yr},{self.em}"
    def __repr__(self):
        return f"<str{str(self)}>"
    def __lt__(self, other):
        if self.i < other.i:
            return True
    def add_group_member(self, member_id):
        self.study_group.append(member_id)




