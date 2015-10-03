class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :auction

  validates :price, presence: true, numericality: {greater_than: 0}

  private

  # def self.search(value)
    # includes(:auction).where("user_id = ?", value).references(:auction)
  #   binding.pry
  # end
end
