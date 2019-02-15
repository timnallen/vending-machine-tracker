class Machine < ApplicationRecord
  validates_presence_of :location

  belongs_to :owner
  has_many :snacks

  def average_price
    if snacks.count > 0
      Machine.joins(:snacks).select("machines.*, avg(snacks.price) as avg_price").where(id: self.id).group(:id)[0].avg_price
    else
      0
    end
  end
end
