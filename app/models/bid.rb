class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :auction

  validates :price, presence: true, numericality: {greater_than: 0}
end
