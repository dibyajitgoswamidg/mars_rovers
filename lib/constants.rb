module Constants
  X_AXIS = 0 # X-Axis value from array of position
  Y_AXIS = 1 # Y-Axis value from array of position
  DIRN = 2   # Direction value from array of position

  LOCATION = 0 # Location of the rover on pleatue in the input array
  ROUTE = 1    # Path defined for rover to travel on pleatue in input array

  MAX_COORDINATE = 0 # Upper right corner of the pleatue in input array

  # Direction where one will turn when turn left or right
  DIRECTION =
    {
      "N" =>
      {
        "L" => "W",
        "R" => "E"
      },
      "S" =>
      {
        "L" => "E",
        "R" => "W"
      },
      "E" =>
      {
        "L" => "N",
        "R" => "S"
      },
      "W" =>
      {
        "L" => "S",
        "R" => "N"
      }
    }
end
