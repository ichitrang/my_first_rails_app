require "application_system_test_case"

class CaresTest < ApplicationSystemTestCase
  setup do
    @care = cares(:one)
  end

  test "visiting the index" do
    visit cares_url
    assert_selector "h1", text: "Cares"
  end

  test "should create care" do
    visit cares_url
    click_on "New care"

    fill_in "Make", with: @care.make
    fill_in "Model", with: @care.model
    fill_in "Year", with: @care.year
    click_on "Create Care"

    assert_text "Care was successfully created"
    click_on "Back"
  end

  test "should update Care" do
    visit care_url(@care)
    click_on "Edit this care", match: :first

    fill_in "Make", with: @care.make
    fill_in "Model", with: @care.model
    fill_in "Year", with: @care.year
    click_on "Update Care"

    assert_text "Care was successfully updated"
    click_on "Back"
  end

  test "should destroy Care" do
    visit care_url(@care)
    click_on "Destroy this care", match: :first

    assert_text "Care was successfully destroyed"
  end
end
