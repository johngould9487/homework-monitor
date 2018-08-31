require 'json'
require 'csv'


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


# create dates
dates_set = []
dates_due = []

(1..30).to_a.each do |index|
  dates_set << Date.today - (index * 7)
  dates_due << Date.today - (index * 7) + 3
end

# create maths titles
csv_text = File.read(Rails.root.join('lib', 'seeds', 'maths_titles.csv'))
maths_titles = CSV.parse(csv_text)
maths_titles = maths_titles.flatten.select do |element|
  element
end
# create physics titles
csv_text = File.read(Rails.root.join('lib', 'seeds', 'physics_titles.csv'))
physics_titles = CSV.parse(csv_text)
physics_titles = physics_titles.flatten.select do |element|
  element
end
# create chemistry titles
csv_text = File.read(Rails.root.join('lib', 'seeds', 'chemistry_titles.csv'))
chemistry_titles = CSV.parse(csv_text)
chemistry_titles = chemistry_titles.flatten.select do |element|
  element
end
# create biology titles
csv_text = File.read(Rails.root.join('lib', 'seeds', 'biology_titles.csv'))
biology_titles = CSV.parse(csv_text)
biology_titles = biology_titles.flatten.select do |element|
  element
end
# create english titles
csv_text = File.read(Rails.root.join('lib', 'seeds', 'english_titles.csv'))
english_titles = CSV.parse(csv_text)
english_titles = english_titles.flatten.select do |element|
  element
end

# create maths assignments
dates_set.each_with_index do |date, index|
  title = maths_titles[index]
  Assignment.create!(
    date_created: date,
    date_due:dates_due[index],
    description: "Read up on the following:",
    grading_type: :score,
    maximum_score: 10,
    teaching_group: teaching_groups[0],
    title: title
  )
end

# create physics assignments
dates_set.each_with_index do |date, index|
  title = physics_titles[index]
  Assignment.create!(
    date_created: date,
    date_due:dates_due[index],
    description: "Make notes on the following:",
    grading_type: :score,
    maximum_score: 10,
    teaching_group: teaching_groups[1],
    title: title
  )
end
# create chemisty assignments
dates_set.each_with_index do |date, index|
  title = chemistry_titles[index]
  Assignment.create!(
    date_created: date,
    date_due:dates_due[index],
    description: "Make notes on the following:",
    grading_type: :score,
    maximum_score: 10,
    teaching_group: teaching_groups[2],
    title: title
  )
end
# create biology assignments
dates_set.each_with_index do |date, index|
  title = biology_titles[index]
  Assignment.create!(
    date_created: date,
    date_due:dates_due[index],
    description: "Make notes on the following:",
    grading_type: :score,
    maximum_score: 10,
    teaching_group: teaching_groups[3],
    title: title
  )
end

# create english assignments
dates_set.each_with_index do |date, index|
  title = english_titles[index]
  Assignment.create!(
    date_created: date,
    date_due:dates_due[index],
    description: "Read this book",
    grading_type: :score,
    maximum_score: 10,
    teaching_group: teaching_groups[4],
    title: title
  )
end




# create old assignments for all classes




puts "Done."












