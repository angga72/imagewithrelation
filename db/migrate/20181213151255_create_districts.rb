class CreateDistricts < ActiveRecord::Migration[5.2]
  def change
    create_table :districts do |t|
      t.references :province, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
