class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:terms_of_service]

  def index
  end

  def users
  end

  def terms_of_service
  end
end
