class DashboardController < ApplicationController
  before_action :authenticate

  def index
    @surveys = Survey.where(author_id: sessions[:user_id])
  end
end
