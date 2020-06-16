class OffersController < ApplicationController
  def index
    @offers = Offer.all
    search if params[:search]
  end

  private

  def search
    search = params[:search]
    @offers = @offers.where('name @@ :name', name: "%#{search[:name]}%") if search[:name].present?
  end
end
