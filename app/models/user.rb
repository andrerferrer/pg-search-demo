class User < ApplicationRecord
  has_many :offers, dependent: :destroy, foreign_key: :owner
  has_many :bookings, dependent: :destroy, foreign_key: :customer

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
