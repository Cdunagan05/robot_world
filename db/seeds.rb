require 'sqlite3'

database = SQLite3:: Database.new("db/robot_manager_development.db")

database.execute("DELETE FROM robots")

database.execute("INSERT INTO robots
        (name, city, state, birthdate, department)
        VALUES
          ('Bob', 'Midland', 'Texas', '12/14/2009', 'Done and Done'),
          ('Larry', 'Denver', 'Colorado', '11/11/2011', 'Smoking');")

puts "It worked and:"
p database.execute("SELECT * FROM robots;")
