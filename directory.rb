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
    when "3"
      save_students
    when "4"
      load_students
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
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def prompt
  puts "Please enter the names of the student to enter:"
  @name = gets.chop.capitalize
  if !@name.empty?
    puts "What cohort are they in?"
    @cohort = gets.chop.capitalize
  end
end

def input_students
  prompt
  while !@name.empty? do

  @students << {name: @name, cohort: @cohort.to_sym}
  if @students.count == 1
    puts "Now we have #{@students.count} student"
  else
    puts "Now we have #{@students.count} students"
  end
  prompt
  end
  @students
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Your file has been saved."
  puts "-------------"
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
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
      puts "#{i+1}: #{student[:name]}".ljust(20) + "(#{student[:cohort]} Cohort)".center(20)
    end
    print_footer
  end
end



interactive_menu
