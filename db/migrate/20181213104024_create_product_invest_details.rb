class CreateProductInvestDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :product_invest_details do |t|
      t.references :product_invest, foreign_key: true
      t.string :name
      t.integer :test

      t.timestamps
    end
  end
end
