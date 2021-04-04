class Product < ApplicationRecord
  belongs_to :category
  belongs_to :subcategory
  belongs_to :user
  has_many :images
  has_many :comments

  validates :name, presence: true
  validates :status, inclusion: { in: %w(unpublished published)}

  before_save :add_url_name

  scope :published, -> {where(status: 'published')}

  def self.search(pattern)
    if pattern.blank?
      all
    else
      where('name ILIKE ?', "%#{pattern}%")
    end
  end

  private

  def add_url_name
    self.url_name = name.downcase.gsub(' ', '-')
  end
end
