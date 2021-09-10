#Alex Marzella
#October 10
#IT 212
#Professor Jost

from MarzellaProj4B import onlineStudent

#creating an empty dictionary
student_dict = { }
#assigning read1 to open students.txt
read1 = open("students.txt", "r")
#splitting the students.txt into the different parameters of onlineStudents
for line in read1:
    fields = line.split(",")
    s = onlineStudent((fields[0]),(fields[1]),(fields[2]), (fields[3]),(fields[4]), (fields[5]))
    student_dict[fields[0]] = s
    
print(student_dict)

#Pop off the first name in the list, then append the study group to the end of it
read2 = open("study-groups.txt", "r")
for line in read2:
    fields = line.strip( ).split(",")
    name = fields.pop(0)
    for f in fields:
        student_dict[name].add_group_member(f)
for x in student_dict.keys():
    print(x, ":", student_dict[x].study_group)
print( )

#search student name from student dictionary, then print each field of onlineStudents
search_name = input("Enter Student Name: ")
if search_name in student_dict:
    y = student_dict[search_name]
    print("Username: ", y.i)
    print("First Name: ", y.first)
    print("Last Name: ", y.last)
    print("Phone Number: ", y.ph)
    print("Year: ", y.yr)
    print("Email: ", y.em)
    print("Study Group: ", y.study_group)
else:
    print("Student not found")

        
