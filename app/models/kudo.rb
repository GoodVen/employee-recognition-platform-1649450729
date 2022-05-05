class Kudo < ApplicationRecord
  belongs_to :giver, class_name: 'Employee', inverse_of: :given_kudos
  belongs_to :receiver, class_name: 'Employee', inverse_of: :received_kudos

  validates :title, :content, presence: true
  validate :less_than_zero

  def less_than_zero
    if giver.number_of_available_kudos - Kudo.where(giver: giver).count <= 0
      errors.add(:expiration_number, "can't be less than 0")
    end
  end
end
