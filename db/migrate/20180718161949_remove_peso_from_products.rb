class RemovePesoFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :peso, :decimal
  end
end
