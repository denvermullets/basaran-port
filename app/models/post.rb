class Post < ApplicationRecord
  validates :title, presence: true
  validates :client, presence: true
  validates :status, presence: true
  validates :display_order, numericality: { only_integer: true }
end
