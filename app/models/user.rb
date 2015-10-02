class User < ActiveRecord::Base
  has_secure_password

  has_many :auctions, dependent: :nullify

  validates :email, presence: true,
            format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
            unless: :from_omniauth?
  validates :first_name, presence: true

  def full_name
    "#{first_name} #{last_name}".strip
  end
end
