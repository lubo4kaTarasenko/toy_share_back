class Product < ApplicationRecord
  belongs_to :category
  belongs_to :subcategory
  has_many :images
  belongs_to :user

  validates :name, presence: true
  validates :status, inclusion: { in: %w(unpublished published)}

  scope :published, -> {where(status: 'published')}

  def self.search(pattern)
    if pattern.blank?
      all
    else
      where('name ILIKE ?', "%#{pattern}%")
    end
  end
end
