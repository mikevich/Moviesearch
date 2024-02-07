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
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
    m = Movie.new

    if genre = Genre.find_by_title(row['Genre'])
        m.genre_id = genre.id
    else
        g = Genre.new
        g.title = row['Genre']
        g.save
        puts "#{g.title} saved"
        m.genre_id = g.id
    end

    if studio = Studio.find_by_title(row['Lead Studio'])
        m.studio_id = studio.id
    else
        s = Studio.new
        s.title = row['Lead Studio']
        s.save
        puts "#{s.title} saved"
        m.studio_id = s.id
    end

    m.title = row['Film']
    m.audience_score = row['Audience score %']
    m.rt_score = row['Rotten Tomatoes %']
    m.profitability = row['Profitability']
    m.gross = row['Worldwide Gross']
    m.year = row['Year']

    m.save
    puts "#{m.title} saved"
end