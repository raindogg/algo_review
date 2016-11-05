def quiz_maker(file)
input = File.open(file)
topic = ""
result = ""
questions = []
choices = []
correct_responses = []
score = 0
choice = 0

input.each do |line|
  topic = /(?<=Topic: ).*/.match(line) if /(?<=Topic: ).*/.match(line)

  questions << /.+(?<=[?]).*/.match(line).to_s if /.+(?<=[?]).*/.match(line)

  choices << /.+(?<=[.]).*/.match(line).to_s if /.+(?<=[.]).*/.match(line)

  correct_responses << /(?<=Correct: ).*/.match(line).to_s if /(?<=Correct: ).*/.match(line)
end

puts "Welcome to the quiz!\n+++++++++++++++++++\n\nThe topic of tonight's quiz will be #{topic}.\n\n..........................\n\n"

questions.each do |question|
  position = questions.index(question)
  puts "#{question}\n#{choices[choice]}\n#{choices[choice + 1]}\n#{choices[choice + 2]}"
  choice += 3
  answer = gets.chomp.upcase
  if answer == correct_responses[position]
    puts "Correct!\n\n..........................\n\n"
    score += 1
  else
    puts "Incorrect. The correct response was #{correct_responses[position]}.\n\n..........................\n\n"
  end

end
puts "Thanks for playing! You got #{score} out of #{questions.length} questions correct!"
end

quiz_maker("quiz_source_text.txt")
quiz_maker("quiz_will_test.txt")