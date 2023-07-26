# frozen_string_literal: true
files = [
  "C:/Users/jpryd/Documents/Ruby/tk_learning/TodoList/classes/dataio.rb",
  "C:/Users/jpryd/Documents/Ruby/tk_learning/TodoList/classes/user.rb",
  "C:/Users/jpryd/Documents/Ruby/tk_learning/TodoList/classes/ui.rb",
  "C:/Users/jpryd/Documents/Ruby/tk_learning/TodoList/application.rb"
]

File.open("output.txt", "w") do |f|
  files.each do |file|
    f.puts "\n=== Contents of file: #{file} ===\n"
    f.puts File.read(file)
  end
end
