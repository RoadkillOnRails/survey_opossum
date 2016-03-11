class DashboardController < ApplicationController
  before_action :authenticate

  def index
    @unpublished_surveys = Survey.where('author_id = ? AND token IS ?', session[:user_id], nil)
    @published_surveys = Survey.where('author_id = ? AND token NOT ?', session[:user_id], nil)
  end
end
