# DEMO

This is a demo to show-case how can we rename references in a rails app.

## Schema
This is the schema

```

  +--------------+       +-------------+
  |     users    |       |    offers   |
  +--------------+       +-------------+
+-| id           |---+   | id          |-+
| | first_name   |   |   | name        | |
| | last_name    |   |   | description | |
| | address      |   +-->| owner_id    | |
| | phone_number |       +-------------+ |
| +--------------+                       |
|                                        |
|            +-------------+             |
|            |  bookings   |             |
|            +-------------+             |
|            | id          |             |
|            | start_time  |             |
|            | end_time    |             |
+----------->| customer_id |             |
             | offer_id    |<------------+
             +-------------+

```

## What needs to be done?

### 1. Add the gem
```ruby
# Gemfile
gem 'pg_search'
```

Remember to `bundle install`

### 2. Add the filters to the model
```ruby
class Offer < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :bookings, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
                  against: %i[name description],
                  using: {
                    tsearch: { prefix: true }
                  }

  pg_search_scope :search_by_owner,
                  associated_against: {
                    owner: %i[first_name last_name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
```
It allows us to search by name or description `Offer.search_by_name_and_description('fly')`

And to search by owner `Offer.search_by_owner('Leia')`


And we're good to go 🤓