class Book < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { minimum: 2, maximum: 255 }, uniqueness: true
  validates :author_name, presence: true, length: { minimum: 2, maximum: 255 }

  enum status: { available: 0, unavailable: 1 }

  scope :latest, -> { order(created_at: :desc) }

  scope :with_status, -> (status) { where(status: status) if statuses.keys.include?(status) }

  before_destroy do
    throw :abort if unavailable?
  end
end


