class Option < ActiveRecord::Base
  belongs_to :question
  validates :value, presence: true
  validates_presence_of :question
end
