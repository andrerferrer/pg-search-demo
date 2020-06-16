# frozen_string_literal: true

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
