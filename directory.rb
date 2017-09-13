def prompt
  puts "Please enter the names of the student to enter:"
  @name = gets.chomp.capitalize
  if !@name.empty?
    puts "What cohort are they in?"
    @cohort = gets.chomp.capitalize
  end
end

def input_students
  prompt
  students = []
  while !@name.empty? do
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
  students << {name: @name, cohort: @cohort.to_sym, hobbies: hobby_list[rand(0..10)], height: "#{rand(4..6)} foot, #{rand(1..12)} inches"}
  puts "Now we have #{students.count} students"
  prompt
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students, cohort=nil)
  if cohort != nil
    students.select {|student| student[:cohort] == cohort}.each_with_index do |student, i|
    puts "#{i+1}: #{student[:name]}".ljust(20) + "(#{student[:cohort]} Cohort)".center(20) + "They like #{student[:hobbies]} and are #{student[:height]} tall.".center(35)
    end
  else
    students.each_with_index do |student, i|
    puts "#{i+1}: #{student[:name]}".ljust(20) + "(#{student[:cohort]} Cohort)".center(20) + "They like #{student[:hobbies]} and are #{student[:height]} tall.".center(35)
    end
  end
end

def print_footer(students)
  puts "-------------"
  if students.count != 1
    puts "Overall, we have #{students.count} great students"
  else
    puts "Overall, we have #{students.count} great student."
  end
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
