class Question < ActiveRecord::Base
  belongs_to :survey
  belongs_to :question_type

  has_many :options
  has_many :answers

  accepts_nested_attributes_for :options,
      reject_if: :all_blank,
      allow_destroy: true
end
