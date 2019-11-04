class Line < ApplicationRecord
  validates :name, presence: true
	has_many :products, dependent: :nullify
end
