class Auction < ActiveRecord::Base
  belongs_to :user

  has_many :bids, dependent: :destroy

  validates :title, presence: true
  validates :details, presence: true
  validates :end_date, presence: true
  validates :reserve_price, presence: true, numericality: {greater_than: 0}

  after_initialize :set_defaults

  private
# Is the email method necessary, if we auto fill from controller? I think yes since the user could delete email and this way it doesn't need to be validated again
  def set_defaults
    self.end_date ||= Time.now + 1.day
    self.reserve_price ||= 1
    self.current_price ||= 1
  end

end
