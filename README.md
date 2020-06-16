# GOAL

This is a demo to show-case how to implement searching with ( and without ) the [pg_search gem](https://github.com/Casecommons/pg_search).

[You can also check my other demos](https://github.com/andrerferrer/dedemos/blob/master/README.md#ded%C3%A9mos).

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

## How can we do it without PgSearch?
### 1. In the controller
```ruby
class OffersController < ApplicationController
  def index
    @offers = Offer.all
    owners = User.owners
    @owners_names = owners.map(&:full_name)
    @owners_ids = owners.pluck :id
    search if params[:search]
  end

  private

  def search
    search = params[:search]
    @offers = @offers.where('name @@ :name', name: "%#{search[:name]}%") if search[:name].present?
    if search[:owner].present?
      user = User.find search[:owner]
      @offers = @offers.joins(:owner)
                       .where(users: {
                                first_name: user.first_name,
                                last_name: user.last_name
                              })
    end
  end
end
```

### 2. In the views
```erb
<%= simple_form_for :search, url: root_path, method: :get do |f| %>
  <%= f.input :name, required: false %>
  <%= f.input :owner, collection: @owners_names.zip(@owners_ids), required: false %>
  <%= f.submit "Search" %>
<% end %>

<% @offers.each do |offer| %>
  <h2>
    <%= offer.name %> <em>with <%= offer.owner.full_name %></em>
  </h2>
  <p>
    <%= offer.description %>
  </p>
<% end %>
```

And we're good to go 🤓
