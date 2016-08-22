require_relative '../test_helper'

class UserSeesAllRobotsTest < FeatureTest
  def test_user_sees_all_robots
    robot_manager.create({name: "Rick", city: "Memphis", state: "Tennessee", birthdate: "7/7/1977", department: "This one"})
    robot_manager.create({name: "Crabby", city: "Nashville", state: "Tennessee", birthdate: "7/7/1977", department: "This one"})

  visit '/robots'

  assert page.has_content?('Rick')
  assert page.has_content?('Crabby')

  end
end
