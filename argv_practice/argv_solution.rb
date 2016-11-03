
# Your Solution
sorted_argv = ARGV.sort { |a, b| a.length <=> b.length } 

sorted_argv.each do |word|
  puts word
end
# start with this, run from terminal to see what you get.
# p ARVG