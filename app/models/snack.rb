class Snack < ApplicationRecord
  validates_presence_of :price
  validates_presence_of :name

  belongs_to :machine
end
