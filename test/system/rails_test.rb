require "application_system_test_case"

class RailsTest < ApplicationSystemTestCase
  setup do
    @rail = rails(:one)
  end

  test "visiting the index" do
    visit rails_url
    assert_selector "h1", text: "Rails"
  end

  test "creating a Rail" do
    visit rails_url
    click_on "New Rail"

    fill_in "G", with: @rail.g
    fill_in "Lat", with: @rail.lat
    fill_in "Lng", with: @rail.lng
    fill_in "Map", with: @rail.map
    fill_in "Scaffold", with: @rail.scaffold
    fill_in "Text", with: @rail.text
    click_on "Create Rail"

    assert_text "Rail was successfully created"
    click_on "Back"
  end

  test "updating a Rail" do
    visit rails_url
    click_on "Edit", match: :first

    fill_in "G", with: @rail.g
    fill_in "Lat", with: @rail.lat
    fill_in "Lng", with: @rail.lng
    fill_in "Map", with: @rail.map
    fill_in "Scaffold", with: @rail.scaffold
    fill_in "Text", with: @rail.text
    click_on "Update Rail"

    assert_text "Rail was successfully updated"
    click_on "Back"
  end

  test "destroying a Rail" do
    visit rails_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rail was successfully destroyed"
  end
end
