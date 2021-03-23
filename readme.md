Note:

The system should have ruby installed in the system if not follow (https://rvm.io/rvm/install)

In this application it is assumed that lower-left coordinates is [0,0]

In order to execute your inputs put them in a '.txt' file for e.g. check 'input.txt'

If you want to add the validation for finding if the rover is not in lower-left
and upper-right coordinates of the pleatue, go to 'app/navigator.rb' and uncomment from line
'34 to 36'. Similarly for test 'spec/navigator_spec.rb' uncomment from line '31 -34'.

Instructions to run the program:

1. Open terminal/powershell or your preferred command line tool
2. Navigate to the folder 'mars_rovers' where this folder is extracted
3. Run 'bundle install'
4. Run 'rake default < absolute_path_to_file >'

Instructions to run the program test:

1. Open terminal/powershell or your preferred command line tool
2. Navigate to the folder 'family' where this folder is extracted
3. Run 'bundle install'
4. Run 'rake spec'
