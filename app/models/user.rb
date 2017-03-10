class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :books
  has_one :picture, as: :imageable, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  validates :first_name, length: { minimum: 2, maximum: 25 }
  validates :last_name, length: { minimum: 2, maximum: 25 }

  scope :with_books, -> { joins(:books) }

  enum role: { regular: 0, admin: 1 }
  accepts_nested_attributes_for :picture

  before_destroy do
    throw :abort if books.present?
  end

  def picture
    super || build_picture
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def has_avatar?
    !picture.new_record?
  end

  def avatar_url
    picture.picture.url
  end
end