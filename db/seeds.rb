# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'movies.csv'))
csv =CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
    m = Movie.new
    m.title = row['Film']
    m.genre = row['Genre']
    m.release_year = row['Year']
    m.studio = row['Lead Studio']
    m.audience_score = row['Audience score %']
    m.rt_score = row['Rotten Tomatoes %']
    m.gross = row['Worldwide Gross'][1..-1]
    m.profitability = row['Profitability']
    m.save
    puts "#{m.title} saved"
end