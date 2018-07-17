class Product < ApplicationRecord
	has_many :samplings, dependent: :destroy
    validates :name, presence: true
end
