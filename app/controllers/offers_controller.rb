class OffersController < ApplicationController
  def index
    @offers = Offer.all
    search if params[:search]
  end

  private

  def search
    search = params[:search]
    @offers = @offers.where(description: search[:description]) if search[:description].present?
    end
  end
end
