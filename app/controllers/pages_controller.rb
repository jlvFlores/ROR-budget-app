class PagesController < ApplicationController
  def splash_screen
    return unless user_signed_in?

    redirect_to categories_path
  end
end
