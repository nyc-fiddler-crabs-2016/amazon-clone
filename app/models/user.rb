class User < ActiveRecord::Base
  has_secure_password
  has_many :addresses
  has_one :cart
  has_many :orders
  has_many :reviews
  has_many :rated_items, through: :reviews
  validates :username, :password, presence:true
  validates :username, uniqueness: true
  validate :password_has_numbers
end




   def password_has_numbers
    unless !!(self.password =~ /.*[0-9].*/)
      errors.add(:password, "needs at least one number")
    end
  end
