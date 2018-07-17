require "application_system_test_case"

class SamplingsTest < ApplicationSystemTestCase
  setup do
    @sampling = samplings(:one)
  end

  test "visiting the index" do
    visit samplings_url
    assert_selector "h1", text: "Samplings"
  end

  test "creating a Sampling" do
    visit samplings_url
    click_on "New Sampling"

    fill_in "Data", with: @sampling.data
    fill_in "Lote", with: @sampling.lote
    fill_in "Peso", with: @sampling.peso
    fill_in "Product", with: @sampling.product_id
    fill_in "Quantidade Produzida", with: @sampling.quantidade_produzida
    click_on "Create Sampling"

    assert_text "Sampling was successfully created"
    click_on "Back"
  end

  test "updating a Sampling" do
    visit samplings_url
    click_on "Edit", match: :first

    fill_in "Data", with: @sampling.data
    fill_in "Lote", with: @sampling.lote
    fill_in "Peso", with: @sampling.peso
    fill_in "Product", with: @sampling.product_id
    fill_in "Quantidade Produzida", with: @sampling.quantidade_produzida
    click_on "Update Sampling"

    assert_text "Sampling was successfully updated"
    click_on "Back"
  end

  test "destroying a Sampling" do
    visit samplings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sampling was successfully destroyed"
  end
end
