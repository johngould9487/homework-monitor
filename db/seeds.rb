teacher1 = User.create(email:"teacher1@teacher.com", password:"123123")
teacher2 = User.create(email:"teacher2@teacher.com", password:"123123")
student1 = User.create(email:"student1@student.com", password:"123123")
student2 = User.create(email:"studetn2@student.com", password:"123123")

teaching_group = TeachingGroup.create(group_code:"ASDF")

teacher_group_membership1 = TeacherGroupMembership.create(
  teacher: teacher1,
  teacher_teaching_group: teaching_group
  )
teacher_group_membership2 = TeacherGroupMembership.create(
  teacher: teacher2,
  teacher_teaching_group: teaching_group
  )
student_group_membership1 = StudentGroupMembership.create(
  student: student1,
  student_teaching_group: teaching_group
  )
student_group_membership2 = StudentGroupMembership.create(
  student: student2,
  student_teaching_group: teaching_group
  )
