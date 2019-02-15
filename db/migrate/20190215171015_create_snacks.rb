class CreateSnacks < ActiveRecord::Migration[5.1]
  def change
    create_table :snacks do |t|
      t.references :machine, foreign_key: true
      t.float :price
      t.string :name

      t.timestamps
    end
  end
end
