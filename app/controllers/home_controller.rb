class HomeController < ApplicationController
  # GET /families
  # GET /families.json
  def index
    @families = Family.all
  end
end
