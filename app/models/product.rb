class Product < ApplicationRecord
	has_many :samplings, dependent: :destroy
    validates :name, :peso_minimo, :peso_maximo, :peso_liquido, :preco, presence: true
end
