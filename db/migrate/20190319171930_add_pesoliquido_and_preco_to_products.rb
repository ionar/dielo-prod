class AddPesoliquidoAndPrecoToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :peso_liquido, :decimal
    add_column :products, :preco, :decimal
  end
end
