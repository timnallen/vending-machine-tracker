require 'rails_helper'

describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
  end

  describe 'relationships' do
    it { should belong_to :owner }
    it { should have_many :snacks }
  end

  describe 'instance methods' do
    it '.average_price' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")

      snack_1 = dons.snacks.create(name: "Snickers", price: 1.0)
      snack_2 = dons.snacks.create(name: "Cheez-its", price: 2.0)

      expect(dons.average_price).to eq(1.5)
    end
  end
end
