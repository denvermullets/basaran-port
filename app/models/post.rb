class Post < ApplicationRecord
  has_many_attached :images

  validates :title, presence: true
  validates :client, presence: true
  validates :status, presence: true
  validates :display_order, numericality: { only_integer: true }

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
