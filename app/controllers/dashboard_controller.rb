class DashboardController < ApplicationController
  before_action :authenticate

  def index
    @surveys = Survey.where(author_id: session[:user_id])
  end
end
