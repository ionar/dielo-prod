class Sampling < ApplicationRecord
  belongs_to :product
  validates :data, :peso, presence: true
end
