json.extract! movie, :id, :title, :audience_score, :rt_score, :profitability, :gross, :year, :created_at, :updated_at
json.url movie_url(movie, format: :json)
