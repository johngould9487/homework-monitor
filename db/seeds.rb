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

# teachers = []
teaching_groups = []
# students = []
# guardians = []

#TEACHERS
teachers = [
User.create!(email: "Romain@lewagon.ac.uk", password: "123123", first_name: "Romain", last_name: "Campech" , teacher: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1536140971/Homework%20monitor/Romain.jpg"),
User.create!(email: "Sarah@lewagon.ac.uk", password: "123123", first_name: "Sarah" , last_name: "Lafer" , teacher: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1536140971/Homework%20monitor/Sarag.jpg"),
User.create!(email: "Sandrine@lewagon.ac.uk", password: "123123", first_name: "Sandrine", last_name: "Ayral" , teacher: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1536140971/Homework%20monitor/Sandrine.jpg"),
User.create!(email: "Sam@lewagon.ac.uk", password: "123123", first_name: "Sam" , last_name: "Willis" , teacher: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1536140971/Homework%20monitor/Sam.jpg"),
User.create!(email: "Phelim@lewagon.ac.uk", password: "123123", first_name: "Phelim" , last_name: "Dunleavy" , teacher: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1536140970/Homework%20monitor/Phelim.jpg"),
User.create!(email: "Ben@lewagon.ac.uk", password: "123123", first_name: "Ben" , last_name: "Baranger", teacher: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1536140969/Homework%20monitor/Ben.jpg"),
User.create!(email: "Arthur@lewagon.ac.uk", password: "123123", first_name: "Arthur" , last_name: "Littmann" , teacher: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1536140969/Homework%20monitor/Arthur.jpg" )
]

# STUDENTS
students = [
User.create!(email: "Rinus@lewagon.ac.uk", password: "123123", first_name: "Rinus", last_name: "Strobel", student: true, avatar:"https://res.cloudinary.com/duspt82gb/image/upload/v1536140144/Homework%20monitor/Linus.jpg" ),
User.create!(email: "Barry@lewagon.ac.uk", password: "123123", first_name: "Barry" , last_name: "Kingdon" , student: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1536140134/Homework%20monitor/Harry.jpg" ),
User.create!(email: "Neddie@lewagon.ac.uk", password: "123123", first_name: "Neddie" , last_name: "Scadding", student: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1536140134/Homework%20monitor/Freddie.jpg"),
User.create!(email: "Christian@lewagon.ac.uk", password: "123123", first_name: "Christian" , last_name:"Bale" , student: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1536140134/Homework%20monitor/Christian.jpg"),
User.create!(email: "Chesley@lewagon.ac.uk", password: "123123", first_name: "Chesley", last_name: "Hawkes" , student: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1536140134/Homework%20monitor/Wesley_S.jpg"),
User.create!(email: "Taria@lewagon.ac.uk", password: "123123", first_name: "Taria" , last_name: "Sanchez-Barrueta" , student: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1536140133/Homework%20monitor/Maria.jpg"),
User.create!(email: "Ronan@lewagon.ac.uk", password: "123123", first_name: "Ronan", last_name: "Keeting" , student: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1536140133/Homework%20monitor/Roan_M.jpg"),
User.create!(email: "Suiza@lewagon.ac.uk", password: "123123", first_name: "Suiza", last_name: "Pinto" , student: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1536140133/Homework%20monitor/Luiza.jpg" ),
User.create!(email: "Woli@lewagon.ac.uk", password: "123123", first_name: "Woli", last_name: "Where's", student: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1536140133/Homework%20monitor/Oli_M.jpg"),
User.create!(email: "Bess@lewagon.ac.uk", password: "123123", first_name: "Bess", last_name: "Lee" , student: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1536140133/Homework%20monitor/Jess.jpg")
]

#GUARDIANS
guardians = [
User.create!(email: "Ed@lewagon.ac.uk", password: "123123", first_name: "Edward" , last_name: "Ward" , guardian: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1536146768/Homework%20monitor/Ed.jpg" ),
User.create!(email: "Boris@lewagon.ac.uk", password: "123123", first_name: "Boris" , last_name: "Paillard" , guardian: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1536146768/Homework%20monitor/Boris.jpg" ),
User.create!(email: "Seb@lewagon.ac.uk", password: "123123", first_name: "Seb" , last_name: "Saunier", guardian: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1536146768/Homework%20monitor/Seb.jpg"),
User.create!(email: "Wonda@lewagon.ac.uk", password: "123123", first_name: "Wonda", last_name: "Smith", guardian: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1535026988/Avatar/Andy.jpg" ),
User.create!(email: "Bonda@lewagon.ac.uk", password: "123123", first_name: "Bonda", last_name: "Smith", guardian: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1535026989/Avatar/Alex_Kelly.png" ),
User.create!(email: "Sonda@lewagon.ac.uk", password: "123123", first_name:"Sonda" , last_name: "Smith", guardian: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1535026989/Avatar/John_Gould.png"),
User.create!(email: "Londa@lewagon.ac.uk", password: "123123", first_name: "Londa" , last_name: "Smith", guardian: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1535026988/Avatar/Syed.png"),
User.create!(email: "Conda@lewagon.ac.uk", password: "123123", first_name: "Conda" , last_name: "Smith", guardian: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1535026988/Avatar/Andy.jpg"),
User.create!(email: "Honda@lewagon.ac.uk", password: "123123", first_name: "Honda" , last_name: "Smith", guardian: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1535026989/Avatar/Alex_Kelly.png"),
User.create!(email: "Yonda@lewagon.ac.uk", password: "123123", first_name: "Yonda" , last_name: "Smith", guardian: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1535026989/Avatar/John_Gould.png"),
User.create!(email: "Andy@lewagon.ac.uk", password: "123123", first_name: "Andy" , last_name: "Levis", guardian: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1535026988/Avatar/Andy.jpg" ),
User.create!(email: "Syed@lewagon.ac.uk", password: "123123", first_name: "Syed", last_name: "Abdullah-Ali", guardian: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1535026988/Avatar/Syed.png" ),
User.create!(email: "Alex@lewagon.ac.uk", password: "123123", first_name: "Alex" , last_name: "Kelly" , guardian: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1535026989/Avatar/Alex_Kelly.png" ),
User.create!(email: "John@lewagon.ac.uk", password: "123123", first_name: "John", last_name: "Gould" , guardian: true, avatar: "https://res.cloudinary.com/duspt82gb/image/upload/v1535026989/Avatar/John_Gould.png" )
]

# 7.times do
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#   email = "#{first_name}.#{last_name}@lewagon.ac.uk"
#   password = "123123"
#   teachers << User.create!(email:email, password: password, first_name:first_name, last_name:last_name, teacher: true)
# end

# 10.times do
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#   email = "#{first_name}.#{last_name}@lewagon.ac.uk"
#   password = "123123"
#   students << User.create!(email:email, password: password, first_name:first_name, last_name:last_name, student: true)
# end

# 13.times do
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#   email = "#{first_name}.#{last_name}@gmail.com"
#   password = "123123"
#   guardians << User.create!(email:email, password: password, first_name:first_name, last_name:last_name, guardian: true)
# end

teaching_groups << TeachingGroup.create!(group_code:"LE1/W173", course:"Full-stack", subject:"Ruby on Rails")
teaching_groups << TeachingGroup.create!(group_code:"HT1/ML1", course:"Front-end", subject:"HTML")
teaching_groups << TeachingGroup.create!(group_code:"C55/Ss5", course:"Front-end", subject:"CSS")
teaching_groups << TeachingGroup.create!(group_code:"D4t/B45", course:"Back-end", subject:"Databases")
teaching_groups << TeachingGroup.create!(group_code:"RU8/Yop", course:"Back-end", subject:"Ruby basics")

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

#set lorem ipsum
lorem_ipsum = "dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

# create dates
dates_set = []
dates_due = []

(1..13).to_a.each do |index|
  dates_set << Date.today - (index * 7)
  dates_due << Date.today - (index * 7) + 3
end

# create Ruby on Rails titles
csv_text = File.read(Rails.root.join('lib', 'seeds', 'rails_titles.csv'))
rails_titles = CSV.parse(csv_text)
rails_titles = rails_titles.flatten.select do |element|
  element
end
# create HTML titles
csv_text = File.read(Rails.root.join('lib', 'seeds', 'html_titles.csv'))
html_titles = CSV.parse(csv_text)
html_titles = html_titles.flatten.select do |element|
  element
end
# create CSS titles
csv_text = File.read(Rails.root.join('lib', 'seeds', 'css_titles.csv'))
css_titles = CSV.parse(csv_text)
css_titles = css_titles.flatten.select do |element|
  element
end
# create Database titles
csv_text = File.read(Rails.root.join('lib', 'seeds', 'database_titles.csv'))
database_titles = CSV.parse(csv_text)
database_titles = database_titles.flatten.select do |element|
  element
end
# create Ruby titles
csv_text = File.read(Rails.root.join('lib', 'seeds', 'ruby_titles.csv'))
ruby_titles = CSV.parse(csv_text)
ruby_titles = ruby_titles.flatten.select do |element|
  element
end

# create ruby on rails assignments
dates_set.each_with_index do |date, index|
  title = rails_titles[index]
  Assignment.create!(
    published: true,
    marked: true,
    date_created: date,
    date_due:dates_due[index],
    description: "Today's Ruby on Rails homework is: #{lorem_ipsum}",
    guardian_note: "It is important that this homework is completed on time and that all resources are used and carefully referenced.",
    grading_type: :Score,
    maximum_score: 10,
    teaching_group: teaching_groups[0],
    title: title
  )
end

Assignment.create!(
  date_created: Date.today,
  date_due:Date.today + 5,
  description: "Welcome to advanced Ruby on Rails! Well done for getting this far. Today's homework is all about testing out your knowledge.

  Create a new rails app to help gardeners classify plants and check off which plants they have in their garden.",
  guardian_note: "This is a complex piece of work, so you will need to support with the Ruby 'o' Rails handbook, page 173",
  grading_type: :score,
  maximum_score: 10,
  teaching_group: teaching_groups[0],
  title: "Advanced Rails and setting up main project"
)

Assignment.create!(
  date_created: Date.today,
  date_due:Date.today + 4,
  description: "Welcome to advanced Ruby on Rails! Well done for getting this far. Today's homework is all about testing out your knowledge.

  Create a new rails app to help gardeners classify plants and check off which plants they have in their garden.",
  guardian_note: "This is a complex piece of work, so you will need to support with the Ruby 'o' Rails handbook, page 150",
  grading_type: :score,
  maximum_score: 10,
  teaching_group: teaching_groups[0],
  title: "Integrating pundit"
)

Assignment.create!(
  date_created: Date.today,
  date_due:Date.today + 3,
  description: "Welcome to advanced Ruby on Rails! Well done for getting this far. Today's homework is all about testing out your knowledge.

  Create a new rails app to help gardeners classify plants and check off which plants they have in their garden.",
  guardian_note: "This is a complex piece of work, so you will need to support with the Ruby 'o' Rails handbook, page 150",
  grading_type: :score,
  maximum_score: 10,
  teaching_group: teaching_groups[0],
  title: "Blocs and yields"
)

# create html assignments
dates_set.each_with_index do |date, index|
  title = html_titles[index]
  Assignment.create!(
    published: true,
    marked: true,
    date_created: date,
    date_due:dates_due[index],
    description: "Today's HTML homework is: #{lorem_ipsum}",
    guardian_note: "It is important that this homework is completed on time and that all resources are used and carefully referenced.",
    grading_type: :score,
    maximum_score: 10,
    teaching_group: teaching_groups[1],
    title: title
  )
end
Assignment.create!(
  date_created: Date.today + 3,
  date_due:Date.today + 5,
  description: "Read up on the following:",
  grading_type: :score,
  maximum_score: 10,
  teaching_group: teaching_groups[1],
  title: "Find the cross-section for a typical Compton-Scattering event"
)
Assignment.create!(
  date_created: Date.today,
  date_due:Date.today + 5,
  description: "Welcome to advanced Ruby on Rails! Well done for getting this far. Today's homework is all about testing out your knowledge.

  Create a new rails app to help gardeners classify plants and check off which plants they have in their garden.",
  guardian_note: "This is a complex piece of work, so you will need to support with the Ruby 'o' Rails handbook, page 173",
  grading_type: :score,
  maximum_score: 10,
  teaching_group: teaching_groups[1],
  title: "Advanced Rails and setting up main project"
)

Assignment.create!(
  date_created: Date.today,
  date_due:Date.today + 4,
  description: "Welcome to advanced Ruby on Rails! Well done for getting this far. Today's homework is all about testing out your knowledge.

  Create a new rails app to help gardeners classify plants and check off which plants they have in their garden.",
  guardian_note: "This is a complex piece of work, so you will need to support with the Ruby 'o' Rails handbook, page 150",
  grading_type: :score,
  maximum_score: 10,
  teaching_group: teaching_groups[1],
  title: "Integrating pundit"
)

Assignment.create!(
  date_created: Date.today,
  date_due:Date.today + 3,
  description: "Welcome to advanced Ruby on Rails! Well done for getting this far. Today's homework is all about testing out your knowledge.

  Create a new rails app to help gardeners classify plants and check off which plants they have in their garden.",
  guardian_note: "This is a complex piece of work, so you will need to support with the Ruby 'o' Rails handbook, page 150",
  grading_type: :score,
  maximum_score: 10,
  teaching_group: teaching_groups[1],
  title: "Blocs and yields"
)

# create css assignments
dates_set.each_with_index do |date, index|
  title = css_titles[index]
  Assignment.create!(
    marked: true,
    published: true,
    date_created: date,
    date_due:dates_due[index],
    description: "Today's CSS homework is: #{lorem_ipsum}",
    guardian_note: "It is important that this homework is completed on time and that all resources are used and carefully referenced.",
    grading_type: :score,
    maximum_score: 10,
    teaching_group: teaching_groups[2],
    title: title
  )
end
Assignment.create!(
  date_created: Date.today + 3,
  date_due:Date.today + 5,
  description: "Read up on the following:",
  grading_type: :score,
  maximum_score: 10,
  teaching_group: teaching_groups[2],
  title: "Write up experiment from today's lesson"
)

Assignment.create!(
  date_created: Date.today,
  date_due:Date.today + 5,
  description: "Welcome to advanced Ruby on Rails! Well done for getting this far. Today's homework is all about testing out your knowledge.

  Create a new rails app to help gardeners classify plants and check off which plants they have in their garden.",
  guardian_note: "This is a complex piece of work, so you will need to support with the Ruby 'o' Rails handbook, page 173",
  grading_type: :score,
  maximum_score: 10,
  teaching_group: teaching_groups[2],
  title: "Advanced Rails and setting up main project"
)

Assignment.create!(
  date_created: Date.today,
  date_due:Date.today + 4,
  description: "Welcome to advanced Ruby on Rails! Well done for getting this far. Today's homework is all about testing out your knowledge.

  Create a new rails app to help gardeners classify plants and check off which plants they have in their garden.",
  guardian_note: "This is a complex piece of work, so you will need to support with the Ruby 'o' Rails handbook, page 150",
  grading_type: :score,
  maximum_score: 10,
  teaching_group: teaching_groups[2],
  title: "Integrating pundit"
)

Assignment.create!(
  date_created: Date.today,
  date_due:Date.today + 3,
  description: "Welcome to advanced Ruby on Rails! Well done for getting this far. Today's homework is all about testing out your knowledge.

  Create a new rails app to help gardeners classify plants and check off which plants they have in their garden.",
  guardian_note: "This is a complex piece of work, so you will need to support with the Ruby 'o' Rails handbook, page 150",
  grading_type: :score,
  maximum_score: 10,
  teaching_group: teaching_groups[2],
  title: "Blocs and yields"
)

# create database assignments
dates_set.each_with_index do |date, index|
  title = database_titles[index]
  Assignment.create!(
    published: true,
    marked: true,
    date_created: date,
    date_due:dates_due[index],
    description: "Today's database homework is: #{lorem_ipsum}",
    guardian_note: "It is important that this homework is completed on time and that all resources are used and carefully referenced.",
    grading_type: :score,
    maximum_score: 10,
    teaching_group: teaching_groups[3],
    title: title
  )
end
Assignment.create!(
  date_created: Date.today + 3,
  date_due:Date.today + 5,
  description: "Read up on the following:",
  grading_type: :score,
  maximum_score: 10,
  teaching_group: teaching_groups[3],
  title: "Mitosis/Mieosis"
)
Assignment.create!(
  date_created: Date.today,
  date_due:Date.today + 5,
  description: "Welcome to advanced Ruby on Rails! Well done for getting this far. Today's homework is all about testing out your knowledge.

  Create a new rails app to help gardeners classify plants and check off which plants they have in their garden.",
  guardian_note: "This is a complex piece of work, so you will need to support with the Ruby 'o' Rails handbook, page 173",
  grading_type: :score,
  maximum_score: 10,
  teaching_group: teaching_groups[3],
  title: "Advanced Rails and setting up main project"
)

Assignment.create!(
  date_created: Date.today,
  date_due:Date.today + 4,
  description: "Welcome to advanced Ruby on Rails! Well done for getting this far. Today's homework is all about testing out your knowledge.

  Create a new rails app to help gardeners classify plants and check off which plants they have in their garden.",
  guardian_note: "This is a complex piece of work, so you will need to support with the Ruby 'o' Rails handbook, page 150",
  grading_type: :score,
  maximum_score: 10,
  teaching_group: teaching_groups[3],
  title: "Integrating pundit"
)

Assignment.create!(
  date_created: Date.today,
  date_due:Date.today + 3,
  description: "Welcome to advanced Ruby on Rails! Well done for getting this far. Today's homework is all about testing out your knowledge.

  Create a new rails app to help gardeners classify plants and check off which plants they have in their garden.",
  guardian_note: "This is a complex piece of work, so you will need to support with the Ruby 'o' Rails handbook, page 150",
  grading_type: :score,
  maximum_score: 10,
  teaching_group: teaching_groups[3],
  title: "Blocs and yields"
)

# create ruby basics assignments
dates_set.each_with_index do |date, index|
  title = rails_titles[index]
  Assignment.create!(
    published: true,
    marked: true,
    date_created: date,
    date_due:dates_due[index],
    description: "Today's Ruby homework is: #{lorem_ipsum}",
    guardian_note: "It is important that this homework is completed on time and that all resources are used and carefully referenced.",
    grading_type: :score,
    maximum_score: 10,
    teaching_group: teaching_groups[4],
    title: title
  )
end
# Assignment.create!(
#   date_created: Date.today + 3,
#   date_due:Date.today + 5,
#   description: "Read up on the following:",
#   grading_type: :score,
#   maximum_score: 10,
#   teaching_group: teaching_groups[4],
#   title: "Transitive/Intransitive Verbs"
# )
Assignment.create!(
  date_created: Date.today + 3,
  date_due:Date.today + 5,
  description: "Welcome to advanced Ruby on Rails! Well done for getting this far. Today's homework is all about testing out your knowledge.

  Create a new rails app to help gardeners classify plants and check off which plants they have in their garden.",
  guardian_note: "This is a complex piece of work, so you will need to support with the Ruby 'o' Rails handbook, page 173",
  grading_type: :score,
  maximum_score: 10,
  teaching_group: teaching_groups[4],
  title: "Advanced Rails and setting up main project"
)

Assignment.create!(
  date_created: Date.today + 3,
  date_due:Date.today + 4,
  description: "Welcome to advanced Ruby on Rails! Well done for getting this far. Today's homework is all about testing out your knowledge.

  Create a new rails app to help gardeners classify plants and check off which plants they have in their garden.",
  guardian_note: "This is a complex piece of work, so you will need to support with the Ruby 'o' Rails handbook, page 150",
  grading_type: :score,
  maximum_score: 10,
  teaching_group: teaching_groups[4],
  title: "Integrating pundit"
)

Assignment.create!(
  date_created: Date.today + 3,
  date_due:Date.today + 3,
  description: "Welcome to advanced Ruby on Rails! Well done for getting this far. Today's homework is all about testing out your knowledge.

  Create a new rails app to help gardeners classify plants and check off which plants they have in their garden.",
  guardian_note: "This is a complex piece of work, so you will need to support with the Ruby 'o' Rails handbook, page 150",
  grading_type: :score,
  maximum_score: 10,
  teaching_group: teaching_groups[4],
  title: "Blocs and yields"
)

TeachingGroup.all.each do |teaching_group|
  teaching_group.assignments.last(3).each do |assignment|
    assignment.marked = false
    assignment.save
  end
end


comments = [
"well done",
"terrible"
]


Assignment.all.each do |assignment|
  if assignment.date_due > Date.today
  elsif assignment.date_due < Date.today - 17
    assignment.attempts.each do |attempt|
      attempt.mark = rand(11)
      attempt.comment = comments.sample
      attempt.save
    end
  elsif assignment.date_due < Date.today - 9
    assignment.attempts.each_with_index do |attempt, index|
      if index.even?
        attempt.mark = rand(11)
        attempt.comment = comments.sample
        attempt.save
      end
    end
  else
    assignment.attempts.each_with_index do |attempt, index|
      if index % 3 == 0
        attempt.mark = rand(11)
        attempt.comment = comments.sample
        attempt.save
      end
    end
  end
end



puts "Done."










