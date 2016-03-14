class Question < ActiveRecord::Base
  belongs_to :survey
  belongs_to :question_type
  has_many :options, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :question_text, presence: { message: "A Question must have text" }
  validates :order, presence: { message: "A Question must have it's order set" }
  validates :question_type_id, presence: true
  validate :number_of_options
  MINOPTIONS = 2

  def number_of_options
    options_number = MINOPTIONS
    if options.present?
      options_number = options.reject(&:marked_for_destruction?).length
    end
    errors.add(:options, 'You must have at least 2 options for multiple choice questions') if options_number < MINOPTIONS
  end

  accepts_nested_attributes_for :options,
      reject_if: :all_blank,
      allow_destroy: true

  accepts_nested_attributes_for :answers,
      allow_destroy: true

  def options_minimum
    options.count >= 2
  end
end
