##
# This class responsible to process movies list
class MoviesClient
  IGNORED_KEYS = ["backdrop_path", "genre_ids", "popularity", "video", "id"]

  def self.save_movies(movies)
    movie_data = []
    movies["results"].each do |movie|
      existing_movie = Movie.where(api_id: movie["id"]).first
      movie_data << existing_movie if existing_movie

      unless existing_movie
        new_movie = Movie.new(api_id: movie["id"])
        IGNORED_KEYS.each{ |k| movie.delete(k) }
        new_movie.assign_attributes(movie)
        movie_data << new_movie if new_movie.save
      end
    end
    [movie_data, movies['total_results']]
  end

  def self.search_and_save_movies(search_str, page_no)
    tmdb_data = Tmdb.call(search_str: search_str, page_no: page_no)
    MoviesClient.save_movies(tmdb_data)
  end
end
