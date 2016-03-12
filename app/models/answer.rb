class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :taker
  validates_presence_of :question
  validates :answer, presence: true, if: :required?

  def required?
    question.required
  end

end
