class Search < ApplicationRecord
    def movies
        @movies ||= find_movies
    end

private

    def find_movies
        movies = Movie.order(:title)
        keywords.split(" ").each do |keyword|
            movies = movies.where("lower(title) like ?", "%#{keyword.downcase}%") if keywords.present?
        end
        movies = movies.where(genre_id: genre_id) if genre_id.present?
        movies = movies.where(studio_id: studio_id) if studio_id.present?
        movies = movies.where("audience_score >= ?", min_audience_score) if min_audience_score.present?        
        movies = movies.where("audience_score <= ?", max_audience_score) if max_audience_score.present?    
        movies = movies.where("rt_score >= ?", min_rt_score) if min_rt_score.present?    
        movies = movies.where("rt_score <= ?", max_rt_score) if max_rt_score.present?    
        movies = movies.where("profitability >= ?", min_profitability) if min_profitability.present?    
        movies = movies.where("profitability <= ?", max_profitability) if max_profitability.present?    
        movies = movies.where("gross >= ?", min_gross) if min_gross.present?    
        movies = movies.where("gross <= ?", max_gross) if max_gross.present?  
        movies = movies.where("year >= ?", min_year) if min_year.present?    
        movies = movies.where("year <= ?", max_year) if max_year.present?   
        movies
    end
end
