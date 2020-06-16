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
    @offers = @offers.search_by_name_and_description(search[:name]) if search[:name].present?
    @offers = @offers.search_by_owner(search[:owner]) if search[:owner].present?
  end
end
