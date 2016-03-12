class Question < ActiveRecord::Base
  belongs_to :survey
  belongs_to :question_type
  has_many :options, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :question_text, presence: true
  validates :order, presence: true
  validates :question_type_id, presence: true

  accepts_nested_attributes_for :options,
      reject_if: :all_blank,
      allow_destroy: true

  accepts_nested_attributes_for :answers,
      allow_destroy: true
end
