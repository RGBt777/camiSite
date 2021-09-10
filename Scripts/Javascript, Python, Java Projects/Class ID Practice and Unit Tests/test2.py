#Alex Marzella
#IT 212
#Jost
#October 4

#Unit Test class, checking that all values equal expected values

from MarzellaProj4B import onlineStudent
import unittest

class MyUnitTestClass(unittest.TestCase):
    def test_1(self):
        s = onlineStudent(1111, "Carter", "Marilyn", "312/473-4837", 1, "Gooza3@gmail.com")
        test = str(s)
        self.assertEqual(str(s), "1111;Marilyn;Carter;312/473-4837,1,Gooza3@gmail.com")
        self.assertEqual(test, '1111;Marilyn;Carter;312/473-4837,1,Gooza3@gmail.com')
        self.assertEqual(s.i < 1112, True)
        self.assertEqual(onlineStudent.study_group, [])
#adding to study group list
        onlineStudent.add_group_member(s, 1112)
        self.assertEqual(onlineStudent.study_group, [1112])

        
if __name__ == '__main__':
    unittest.main( )
