require_relative '../test_helper'

class RobotManagerTest < Minitest::Test
  include TestHelpers
    def current_robot_id
      robot_manager.all.last.id
    end

    def create_robot
      robot_manager.create({
        :name => "some name",
        :city => "Austin",
        :state => "Texas",
        :birthdate => "12/23/1986",
        :department => "Kick ass and take names"
        })
    end


    def test_it_creates_a_robot
      create_robot

      robot = robot_manager.find(current_robot_id)
      assert_equal "some name", robot.name
      assert_equal "Austin", robot.city
      assert_equal current_robot_id, robot.id
      assert_equal "Texas", robot.state
      assert_equal "12/23/1986", robot.birthdate
      assert_equal "Kick ass and take names", robot.department
    end

    def test_it_returns_all_robots
      create_robot
      create_robot

      assert_equal 2, robot_manager.all.count
      assert_instance_of Robot, robot_manager.all.last
    end

    def test_it_finds_a_robot
    create_robot

    robot = robot_manager.find(current_robot_id)
    assert_instance_of Robot, robot
    assert_equal "Texas", robot.state
    assert_equal "Kick ass and take names", robot.department
    end

    def test_it_deletes_a_robot
      create_robot

      assert_equal 1, robot_manager.all.count

      robot_manager.destroy(current_robot_id)

      assert_equal 0, robot_manager.all.count
    end

    def test_it_updates_a_robot
    create_robot

    params = {robot: {name: "Dave", city: "LA", state: "California", birthdate: "7/08/15", department: "None"}}
    robot_manager.update(current_robot_id, params[:robot])

    robot = robot_manager.find(current_robot_id)

    assert_equal "Dave", robot.name
    assert_equal "California", robot.state
    assert_equal "None", robot.department
    end

    
  end
