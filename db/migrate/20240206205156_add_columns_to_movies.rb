class AddColumnsToMovies < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :studio, :string
    add_column :movies, :audience_score, :integer
    add_column :movies, :profitability, :float
    add_column :movies, :rt_score, :integer
    add_column :movies, :gross, :float
  end
end
