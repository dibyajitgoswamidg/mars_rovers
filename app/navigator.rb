require_relative '../lib/constants'

class Navigator
  include Constants

  def destination current_location, route, max_coordinates
    return travel(current_location, format_route(route), max_coordinates)
  end

  private

  # Format route commands from string to array
  def format_route route
    route.first.split('')
  end

  # Evaluate commands to reach destination
  def travel current_location, route, max_coordinates
    errors = validate_location(current_location)
    return errors unless errors.nil?

    next_location = current_location
    route.each do |command|
      if command == "M"
        towards = next_location[DIRN]
        current_location = move(current_location, towards)
      else
        return "Wrong path command" unless ["L","R"].include?(command)
        dirn = current_location[DIRN]
        next_location[DIRN] = DIRECTION[dirn][command]
      end
    end
    # This ensure if the destination is out of grid
    # current_location << "This is out of grid" if
    #   (!(0..max_coordinates[X_AXIS].to_i).member?(current_location[X_AXIS].to_i) ||
    #   !(0..max_coordinates[Y_AXIS].to_i).member?(current_location[Y_AXIS].to_i))
    current_location.join(' ')
  end

  # Move the rover based on direction and current position
  def move current_location, towards
    case towards
    when "S"
      current_location[Y_AXIS] = current_location[Y_AXIS].to_i - 1
    when "E"
      current_location[X_AXIS] = current_location[X_AXIS].to_i + 1
    when "W"
      current_location[X_AXIS] = current_location[X_AXIS].to_i - 1
    when "N"
      current_location[Y_AXIS] = current_location[Y_AXIS].to_i + 1
    end
    current_location[DIRN] = towards
    current_location
  end

  # Validate if the location provided is proper
  def validate_location current_location
    regx = /\A[-+]?\d+\z/
    return "Coordinates are not numeric" if
      !(regx === current_location[X_AXIS]) || !(regx === current_location[Y_AXIS])
    return "Direction is not valid" unless
      ["N", "S", "E", "W"].include?(current_location[DIRN])
  end

end
