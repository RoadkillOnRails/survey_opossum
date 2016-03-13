class Taker < ActiveRecord::Base
  has_many :answers

  def token_create
    self.token = SecureRandom.urlsafe_base64
    self.save
  end
end
