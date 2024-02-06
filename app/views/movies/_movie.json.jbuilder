json.extract! movie, :id, :title, :release_year, :genre, :studio, :audience_score, :rt_score, :profitability, :gross, :created_at, :updated_at
json.url movie_url(movie, format: :json)
