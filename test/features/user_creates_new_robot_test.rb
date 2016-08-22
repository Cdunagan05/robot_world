require_relative '../test_helper'

class UserCreatesNewRobotTest < FeatureTest
  def test_user__creates_new_robot
    visit '/'

    click_link("Create New Robot")

    assert_equal '/robots/new', current_path

    fill_in("robot[name]", with: "Jon")
    fill_in("robot[city]", with: "Nederland")
    fill_in("robot[state]", with: "Texas")
    fill_in("robot[birthdate]", with: "10/11/2012")
    fill_in("robot[department]", with: "This department is not here")

    click_on("submit")

    assert_equal '/robots', current_path

    assert page.has_content?("Jon")

  end
end
