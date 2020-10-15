class AboutController < ApplicationController

  def index
    @admin_name = ENV["ADMIN_USER"]
  end
end
