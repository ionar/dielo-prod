class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :peso
      t.decimal :peso_minimo
      t.decimal :peso_maximo

      t.timestamps
    end
  end
end
