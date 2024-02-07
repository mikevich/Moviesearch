class CreateSearches < ActiveRecord::Migration[7.1]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.integer :genre_id
      t.integer :studio_id
      t.integer :min_audience_score
      t.integer :max_audience_score
      t.integer :min_rt_score
      t.integer :max_rt_score
      t.float :min_profitability
      t.float :max_profitability
      t.decimal :min_gross
      t.decimal :max_gross
      t.integer :min_year
      t.integer :max_year

      t.timestamps
    end
  end
end
