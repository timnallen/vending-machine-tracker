require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  it 'shows me the name of all snack associated with the vending machine and their price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    snack_1 = dons.snacks.create(name: "Snickers", price: 1.0)
    snack_2 = dons.snacks.create(name: "Cheez-its", price: 2.0)

    visit machine_path(dons)

    within "#snack-#{snack_1.id}" do
      expect(page).to have_content(snack_1.name)
      expect(page).to have_content(snack_1.price)
    end

    within "#snack-#{snack_2.id}" do
      expect(page).to have_content(snack_2.name)
      expect(page).to have_content(snack_2.price)
    end
  end
end
#
# As a user
# When I visit a vending machine show page
# I see the name of all of the snacks associated with that vending machine along with their price
