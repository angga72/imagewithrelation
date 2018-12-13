class CreateSubdistricts < ActiveRecord::Migration[5.2]
  def change
    create_table :subdistricts do |t|
      t.references :district, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
