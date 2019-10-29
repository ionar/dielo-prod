class Product < ApplicationRecord
	has_many :samplings, dependent: :destroy
  validates :name, :peso_minimo, :peso_maximo, :peso_liquido, presence: true

  scope :name_ordened, -> { order(name: :asc) }

  def product_label
    "#{self.name.to_s} - min: #{self.peso_minimo}g | max: #{self.peso_maximo}g"
  end
end
