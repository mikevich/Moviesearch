class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :audience_score
      t.integer :rt_score
      t.float :profitability
      t.decimal :gross
      t.integer :year
      t.integer :studio_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
