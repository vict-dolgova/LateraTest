class Issuance < ApplicationRecord
  belongs_to :book
  belongs_to :subscriber
  validates :subscriber_id, presence: true
  validates :issueDate, presence: true
  validates :returnDate, presence: true

  validate :returnDate_before_issueDate

  def returnDate_before_issueDate
    if issueDate && returnDate
      errors.add(:returnDate, "Error returnDate") if returnDate < issueDate
    end
  end

end
