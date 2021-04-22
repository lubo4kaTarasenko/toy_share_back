class Notification < ApplicationRecord
  belongs_to :user

  validates :status, inclusion: { in: %w(new viewed)}
  validates :kind, inclusion: { in: %w(comment proposal)}

  scope :new, -> {where(status: 'new')}
end
