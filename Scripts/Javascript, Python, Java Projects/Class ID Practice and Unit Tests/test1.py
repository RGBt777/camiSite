from MarzellaProj4B import onlineStudent
#checking all methods and variables from onlineStudent class
s = onlineStudent(1111, "Carter", "Marilyn", "312/473-4837", 1, "Gooza3@gmail.com")
print(str(s))
test = str(s)
print(repr(test))
print(s.i < 1112)
print(s.em)
print(onlineStudent.study_group)
#adding 1112 username to study group
onlineStudent.add_group_member(s, 1112)
print(onlineStudent.study_group)

