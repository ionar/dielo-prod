class CreateWeighings < ActiveRecord::Migration[5.2]
  def change
    create_table :weighings do |t|
      t.decimal :peso
      t.references :sampling, foreign_key: true

      t.timestamps
    end
  end
end
