class CreateSamplings < ActiveRecord::Migration[5.2]
  def change
    create_table :samplings do |t|
      t.references :product, foreign_key: true
      t.date :data
      t.decimal :peso
      t.string :lote
      t.integer :quantidade_produzida

      t.timestamps
    end
  end
end
