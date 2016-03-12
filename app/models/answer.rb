class Answer < ActiveRecord::Base
  belongs_to :question
<<<<<<< HEAD

  validates :answer, presence: true, if: :required?

  def required?
    question.required
  end
=======
  belongs_to :taker
  validates_presence_of :question
>>>>>>> 30684e90f9abe100aa82c811ccba881588f0b062
end
