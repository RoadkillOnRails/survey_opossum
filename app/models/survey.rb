require 'securerandom'

class Survey < ActiveRecord::Base
  belongs_to :author
  has_many :questions, dependent: :destroy
  has_many :answers, through: :questions

  validates :title, presence: true

  accepts_nested_attributes_for :questions,
      reject_if: :all_blank,
      allow_destroy: true

  def publish
    self.token = SecureRandom.urlsafe_base64
    self.save
  end

  def unpublish
    self.token = nil
    self.save
  end

end
