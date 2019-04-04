class Sampling < ApplicationRecord
  belongs_to :product
  has_many :weighings, dependent: :destroy

  accepts_nested_attributes_for :weighings, reject_if: :all_blank, allow_destroy: true
  
  validates :data, :quantidade_produzida, presence: true
  #validates :data, uniqueness: true

  default_scope {order(data: :desc)}

end
