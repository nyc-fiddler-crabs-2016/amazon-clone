class AddressesController < ApplicationController
  def index
    if logged_in?
     @addresses = current_user.addresses
  end


end
