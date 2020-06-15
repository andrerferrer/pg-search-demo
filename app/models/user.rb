class User < ApplicationRecord
  # Associations
  has_many :offers, dependent: :destroy, foreign_key: :owner
  has_many :bookings, dependent: :destroy, foreign_key: :customer

  # Scopes
  scope :owners, -> { where(id: Offer.select(:owner_id).distinct) }

  # Methods
  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
