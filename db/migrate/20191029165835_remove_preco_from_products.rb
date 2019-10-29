class RemovePrecoFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :preco, :decimal
  end
end
