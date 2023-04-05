class HomesController < ApplicationController
  layout false

  def show
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
