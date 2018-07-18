class Sampling < ApplicationRecord
  belongs_to :product
  validates :data, :peso, presence: true
  validates :data, uniqueness: true

  default_scope {order(data: :desc)}
end
