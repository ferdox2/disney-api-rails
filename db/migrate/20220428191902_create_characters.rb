class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :age
      t.float :weight
      t.text :history
      t.string :movie_serie

      t.timestamps
    end
  end
end
