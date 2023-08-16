class PagesController < ApplicationController
  def splash_screen
    if user_signed_in?
      redirect_to categories_path
    end
  end
end
