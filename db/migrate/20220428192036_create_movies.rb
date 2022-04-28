class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.date :creation_date
      t.integer :rating
      t.string :associated_characters
      t.belongs_to :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end
