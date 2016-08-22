require_relative '../test_helper'

class UserDeletesTaskTest < FeatureTest
  def test_user_deletes_task
    robot_manager.create({name: "Rick", city: "Memphis", state: "Tennessee", birthdate: "7/7/1977", department: "This one"})
    robot_manager.create({name: "Crabby", city: "Nashville", state: "Tennessee", birthdate: "7/7/1977", department: "This one"})

    visit '/robots'

    click_on("Rick")

    click_on("Delete!")

    assert_equal '/robots', current_path

    assert page.has_no_content?("Rick")
  end
end
