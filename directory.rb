def interactive_menu
  students = []
  loop do
    puts "What would you like to do?"
    puts "1. Input the students"
    puts "2. Show the student directory"
    puts "9. Exit"

    selection = gets.chomp
    case selection
      when "1"
        students = input_students
      when "2"
        print(students)
      when "9"
        exit
      else
        puts "Please enter a number from 1, 2 or 9"
    end
  end
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
  students << {name: @name, cohort: @cohort.to_sym, hobbies: hobby_list.sample, height: "#{rand(4..6)} foot, #{rand(1..12)} inches"}
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
  if students != []
    print_header
    if cohort != nil
      students.select do |student| student[:cohort] == cohort end.each_with_index do |student, i|
        puts "#{i+1}: #{student[:name]}".ljust(20) + "(#{student[:cohort]} Cohort)".center(20) + "They like #{student[:hobbies]} and are #{student[:height]} tall.".center(35)
      end
    else
      students.each_with_index do |student, i|
        puts "#{i+1}: #{student[:name]}".ljust(20) + "(#{student[:cohort]} Cohort)".center(20) + "They like #{student[:hobbies]} and are #{student[:height]} tall.".center(35)
      end
    end
    print_footer(students)
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
interactive_menu
