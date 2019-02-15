require 'rails_helper'

feature 'When a user visits a snack show page' do
  scenario 'they see info about the snack' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    snack_1 = dons.snacks.create(name: "Snickers", price: 1.0)
    snack_2 = dons.snacks.create(name: "Cheez-its", price: 2.0)

    visit snack_path(snack_1)

    expect(page).to have_content(snack_1.name)
    expect(page).to have_content(snack_1.price)
    expect(page).to have_content(snack_1.machines.locations)
    expect(page).to have_content(dons.average_price)
    expect(page).to have_content(dons.number_of_choices)
  end
end
