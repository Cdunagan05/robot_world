require_relative '../test_helper'

class RobotTest < Minitest::Test
  def test_it_assigns_attributes_correctly
    robot = Robot.new({
      "id" => 1,
      "name" => "Test Name",
      "city" => "test city",
      "state" => "test state",
      "birthdate" => "test birthdate",
      "department" => "test department"
      })
    assert_equal "Test Name", robot.name
    assert_equal 1, robot.id
    assert_equal "test city", robot.city
    assert_equal "test state", robot.state
    assert_equal "test birthdate", robot.birthdate
    assert_equal "test department", robot.department
  end
end
