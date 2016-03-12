class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :taker
  validates_presence_of :question
end
