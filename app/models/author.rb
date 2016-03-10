class Author < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :surveys

  def name
    "#{first_name} #{last_name}"
  end
end
