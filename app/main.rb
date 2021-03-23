require_relative "navigator"
include Constants

def main
  input_file = ARGV[1] # Pick input file path from command

  @input = load_input(input_file) # Loading input file from path

  if @input.class == String # Check if any error with input file
    puts @input
    return
  end

  load_max_coordinates

  navigator = Navigator.new # Initializing Navigator class

  rover_inputs.each do |input|
    puts navigator.destination(input[LOCATION], input[ROUTE], @max_coordinates)
  end
end

private

# Upper-right coordinates of the plateau
def load_max_coordinates
  @max_coordinates = @input[MAX_COORDINATE]
end

# Picking and formatting rover position and path commands
def rover_inputs
  @input[1..@input.length].each_slice(2).to_a
end

# Read file from path
def load_input file_path
  if File.exist?(file_path)
    if File.extname(file_path) != ".txt"
      return "This file looks like a non txt file, use a '.txt' file"
    end
    file = File.open(file_path, "r")
    data = file.map { |command| command.split("\n").first.split(' ') }
    file.close
    return "Oops! Empty file it seems." if data.flatten.empty?
    return data
  else
    return "No such file present, kindly check the path"
  end
end
