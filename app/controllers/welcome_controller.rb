class WelcomeController < ApplicationController
  def index
    @welcome_stat = WelcomePageService.new.call
  end
end
