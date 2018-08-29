puts "Deleting all data"

FamilyConnection.destroy_all
StudentGroupMembership.destroy_all
TeacherGroupMembership.destroy_all
Attempt.destroy_all
User.destroy_all
Assignment.destroy_all
TeachingGroup.destroy_all

puts "Creating seed data"

teachers = []
teaching_groups = []
students = []
guardians = []

7.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "#{first_name}.#{last_name}@lewagon.ac.uk"
  password = "123123"
  teachers << User.create!(email:email, password: password, first_name:first_name, last_name:last_name, teacher: true)
end

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "#{first_name}.#{last_name}@lewagon.ac.uk"
  password = "123123"
  students << User.create!(email:email, password: password, first_name:first_name, last_name:last_name, student: true)
end

13.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "#{first_name}.#{last_name}@gmail.com"
  password = "123123"
  guardians << User.create!(email:email, password: password, first_name:first_name, last_name:last_name, guardian: true)
end

teaching_groups << TeachingGroup.create!(group_code:"A1B/Mt1", course:"A-level", subject:"Mathematics")
teaching_groups << TeachingGroup.create!(group_code:"A1B/Ph2", course:"A-level", subject:"Physics")
teaching_groups << TeachingGroup.create!(group_code:"A1C/Ch3", course:"A-level", subject:"Chemistry")
teaching_groups << TeachingGroup.create!(group_code:"A1C/Bi1", course:"A-level", subject:"Biology")
teaching_groups << TeachingGroup.create!(group_code:"A1D/En2", course:"A-level", subject:"English Language")

indices = [[0, 0], [0, 1], [1, 0], [2, 1], [3, 2], [4, 2], [4, 3], [5, 4], [6, 3], [6, 4]]
indices.each do |index_pair|
  TeacherGroupMembership.create!(teacher: teachers[index_pair[0]], teacher_teaching_group: teaching_groups[index_pair[1]])
end

indices = [[1, 2, 3, 4, 5, 6], [1, 2, 3, 7, 8], [1, 2, 7, 9, 10], [1, 2, 4, 8, 9, 10], [1, 3, 4, 7, 9, 10]]
teaching_groups.each_with_index do |teaching_group, teaching_group_index|
  indices[teaching_group_index].each do |student_number|
    StudentGroupMembership.create!(student: students[student_number - 1], student_teaching_group: teaching_group)
  end
end

indices = [[0,0], [0,1], [1,0], [1,1], [2,2], [3,3], [4,3], [4,4], [5,4], [6,5], [7,5], [8,6], [9,6], [8,7], [9,7], [10,8], [11,9], [12,9]]
indices.each do |index_pair|
  FamilyConnection.create!(student:students[index_pair[1]], guardian:guardians[index_pair[0]])
end

# create old assignments for all classes



puts "Done."

























