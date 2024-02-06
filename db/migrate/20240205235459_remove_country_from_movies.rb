class RemoveCountryFromMovies < ActiveRecord::Migration[7.1]
  def change
    remove_column :movies, :country, :string
  end
end
