require "application_system_test_case"

class FavoriesTest < ApplicationSystemTestCase
  setup do
    @favory = favories(:one)
  end

  test "visiting the index" do
    visit favories_url
    assert_selector "h1", text: "Favories"
  end

  test "creating a Favory" do
    visit favories_url
    click_on "New Favory"

    fill_in "Product", with: @favory.product_id
    click_on "Create Favory"

    assert_text "Favory was successfully created"
    click_on "Back"
  end

  test "updating a Favory" do
    visit favories_url
    click_on "Edit", match: :first

    fill_in "Product", with: @favory.product_id
    click_on "Update Favory"

    assert_text "Favory was successfully updated"
    click_on "Back"
  end

  test "destroying a Favory" do
    visit favories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Favory was successfully destroyed"
  end
end
