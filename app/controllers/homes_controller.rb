class HomesController < ApplicationController
  layout false

  def show
    I18n.locale = browser_locale || I18n.default_locale
  end

  private

  def browser_locale
    request.env["HTTP_ACCEPT_LANGUAGE"].to_s.scan(/^[a-z]{2}/).first
  end
end
