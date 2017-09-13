@students = []

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      print_students_list
    when "9"
      exit
    else
      puts "Please enter a number from 1, 2 or 9"
  end
end

def print_menu
  puts "What would you like to do?"
  puts "1. Input the students"
  puts "2. Show the student directory"
  puts "9. Exit"
end

def prompt
  puts "Please enter the names of the student to enter:"
  @name = gets.chop.capitalize
  if !@name.empty?
    puts "What cohort are they in?"
    @cohort = gets.chop.capitalize
    puts "What do they like to do?"
    @hobby = gets.chop
    puts "And finally, what is their height in feet and inches?"
    @height = gets.chop
  end
end

def input_students
  prompt
  while !@name.empty? do

  @students << {name: @name, cohort: @cohort, hobbies: @hobby, height: @height}
  if @students.count == 1
    puts "Now we have #{@students.count} student"
  else
    puts "Now we have #{@students.count} students"
  end
  prompt
  end
  @students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_footer
  puts "-------------"
  if @students.count != 1
    puts "Overall, we have #{@students.count} great students"
  else
    puts "Overall, we have #{@students.count} great student."
  end
end

def print_students_list
  if @students != []
    print_header
    @students.each_with_index do |student, i|
      puts "#{i+1}: #{student[:name]}".ljust(20) + "(#{student[:cohort]} Cohort)".center(20) + "They like to #{student[:hobbies]} and are #{student[:height]} tall.".center(35)
    end
    print_footer
  end
end

interactive_menu
