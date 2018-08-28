TeachingGroup.destroy_all

subjects = %w[
  maths english biology physics chemistry geography history french
  spanish
]
courses = %w[
  7 8 9 10 11 L1 L2 L3 BTEC
]
20.times do
  subject = subjects.sample
  course = courses.sample
  group_code = subject[0..1].capitalize + %w[A B C D E F G].sample + '/' + course
  TeachingGroup.create!(subject: subject, course: course,
    group_code: group_code
  )
end

100.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  digits = (1..99).to_a.sample
  name = "#{first_name} #{last_name}"
  email = "#{first_name}#{last_name}#{digits}@student.com"
  password = "123123"
  student = true
  guardian = false
  teacher = false
  User.create!(name: name, email: email, password: password, teacher: teacher,
    student: student, guardian: guardian)
end
