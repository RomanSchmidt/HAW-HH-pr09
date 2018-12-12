# Author: Roman Schmidt, Daniel Osterholz

Student = Struct.new(:first_name, :last_name)
Prof = Struct.new(:first_name, :last_name)

students = []
profs = []

students.push(Student.new('1.1.1', '1.1.1')).push(Student.new('1.2.1', '1.2.2'))
profs.push(Prof.new('2.1.1', '2.1.2')).push(Prof.new('2.2.1', '2.2.2'))

students.each do |student|
  puts student.singleton_class # Class
end

profs.each do |prof|
  puts prof.singleton_class # Class
end

puts 'singleton class of BasicObject: ' + BasicObject.singleton_class.to_s
puts 'super of singleton class of BasicObject: ' + BasicObject.singleton_class.superclass.to_s