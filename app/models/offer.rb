class Offer < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :bookings, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }

  pg_search_scope :search_by_owner,
    associated_against: {
      owner: [ :first_name, :last_name ]
    },
    using: {
      tsearch: { prefix: true }
    }

end
