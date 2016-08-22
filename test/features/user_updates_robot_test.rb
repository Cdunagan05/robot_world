require_relative '../test_helper'

class UserUpdatesARobotTest < FeatureTest
  def test_user_updates_a_robot
    robot_manager.create({name: "Rick", city: "Memphis", state: "Tennessee", birthdate: "7/7/1977", department: "This one"})

    visit '/robots'

    click_on("Edit")

    fill_in("robot[name]", with: "Lucifer")
    fill_in("robot[state]", with: "New York")

    save_and_open_page

    click_on("submit")

    assert page.has_content?('Lucifer')
  end
end
