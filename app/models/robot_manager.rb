class RobotManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    database.execute("INSERT INTO robots
                    (name, city, state, birthdate, department)
                    VALUES
                    ('#{robot[:name]}',
                    '#{robot[:city]}',
                    '#{robot[:state]}',
                    '#{robot[:birthdate]}',
                    '#{robot[:department]}');")
    # database.transaction do
    #   database['robots'] ||= []
    #   database['total'] ||= 0
    #   database['total'] += 1
    #   database['robots'] << {"id" => database['total'],
    #                          "name" => robot[:name],
    #                          "city" => robot[:city],
    #                          "state" => robot[:state],
    #                          "birthdate" => robot[:birthdate],
    #                          "department" => robot[:department] }
  end

  def raw_robots
    database.execute("SELECT * FROM robots;")
    # database.transaction do
    #   database['robots'] || []
    # end
  end

  def raw_robot(id)
    database.execute("SELECT * FROM robots WHERE id=#{id};").first
    # raw_robots.find {|robot| robot["id"] == id}
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def all
    raw_robots.map {|data| Robot.new(data)}
  end

  def update(id, robot_data)
    database.execute("UPDATE robots SET name = '#{robot_data[:name]}',
                                        city = '#{robot_data[:city]}',
                                        state = '#{robot_data[:state]}',
                                        birthdate = '#{robot_data[:birthdate]}',
                                        department = '#{robot_data[:department]}' WHERE id=#{id};")
  end

  def destroy(id)
    database.execute("DELETE FROM robots WHERE id=#{id};")
  end

  def delete_all
    database.execute("DELETE FROM robots;")
  end





end
