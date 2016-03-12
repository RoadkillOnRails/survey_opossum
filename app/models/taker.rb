class Taker < ActiveRecord::Base
  have_many :answers
  before_create :token_create

  def token_create
    self.token = SecureRandom.urlsafe_base64
    self.save
  end
end
