class HomeController < ApplicationController
  def index
    @offers = Offer.all
    render 'index': @offers
  end

  def new
    @offers = Offer.all
    render 'view'
  end
end
