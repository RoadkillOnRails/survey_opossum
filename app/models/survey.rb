class Survey < ActiveRecord::Base
  belongs_to :author
  has_many :questions
  validates :title, presence: true
  
end
