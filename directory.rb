def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []
  name = gets.chomp
  while !name.empty? do
    hobby_list = [
      "chess",
      "revenge",
      "general evilness",
      "knitting",
      "concocting plans to take over the world",
      "butterfly collecting",
      "resurrecting the dead",
      "swimming",
      "coding",
      "designing killer weapons",
      "browsing youtube for hours and hours"
    ]
    students << {name: name, cohort: :November, hobbies: hobby_list[rand(0..10)], height: "#{rand(4..6)} foot, #{rand(1..12)} inches"}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, i|
      puts "#{i+1}: #{student[:name]}".ljust(20) + "(#{student[:cohort]} Cohort)".center(20) + "They like #{student[:hobbies]} and are #{student[:height]} tall.".center(35)
  end
end

def print_footer(students)
  puts "-------------"
  puts "Overall, we have #{students.count} great students"
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
