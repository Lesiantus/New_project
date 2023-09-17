class Badge < ApplicationRecord
  RULES = %W[category levels first_attempt].freeze
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges
  belongs_to :category, class_name: 'Category', optional: true

  validates :title, :image_name, presence: true
  validates :rule, inclusion: { in: RULES }

  def self.images
    images_path = 'app/assets/images/'
    badges = Dir.glob("#{images_path}badges/*")
    badges.map { |badge_path| badge_path.gsub(images_path, '') }
  end

  private

  def set_default_image_path
    self.image_path = 'badges/first.png'
  end
end
