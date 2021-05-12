class Notification < ApplicationRecord
  belongs_to :user

  validates :status, inclusion: { in: %w[new viewed] }
  validates :kind, inclusion: { in: %w[comment proposal] }

  scope :new_notification, -> { where(status: 'new') }
end
