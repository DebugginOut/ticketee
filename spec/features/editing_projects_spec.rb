require 'spec_helper'
feature "Editing Projects" do
  before do
    #arrange
    FactoryGirl.create(:project, name: "TextMate 2")
    #act
    visit "/"
    click_link "TextMate 2"
    click_link "Edit Project"
  end

  scenario "Updating a project" do
    #act, continued from before block
    fill_in "Name", with: "TextMate 2 beta"
    click_button "Update Project"
    #assert
    expect(page).to have_content("Project has been updated.")
  end

  scenario "Updating a project with invalid attributes is bad" do
    fill_in "Name", with: ""
    click_button "Update Project"

    expect(page).to have_content("Project has not been updated.")
  end
end
