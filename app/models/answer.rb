class Answer < ActiveRecord::Base
  belongs_to :question

  validates :answer, presence: true, if: :required?

  def required?
    question.required
  end
end
