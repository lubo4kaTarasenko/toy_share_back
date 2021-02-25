class Product < ApplicationRecord
  belongs_to :category
  belongs_to :subcategory

  def self.search(pattern)
    if pattern.blank?
      all
    else
      where('name ILIKE ?', "%#{pattern}%")
    end
  end
end
