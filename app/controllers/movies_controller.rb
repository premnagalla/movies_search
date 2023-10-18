class MoviesController < ApplicationController
  def index
    @movies = Movie.none
  end

  def search
    # Search movies in local DB, from movieclient service
    if params[:title].present?
      if params[:search_in] && params[:search_in] == 'search_tmdb'
        movies, @total_count = MoviesClient.search_and_save_movies(params[:title], params[:page])
        flash.now[:success] = "Data fetched from API"
      else
        movies = Movie.where("title like ?", "%#{params[:title]}%").reorder("id asc")
        flash.now[:success] = "Data fetched locally" if movies.exists?
        @total_count = movies.count if movies.exists?
        movies, @total_count = MoviesClient.search_and_save_movies(params[:title], params[:page]) unless movies.exists?
        flash.now[:success] = "Data fetched from API" if params[:search_in] == 'search_tmdb'
      end
      @movies = Kaminari.paginate_array(movies, total_count: @total_count).page(params[:page]).per(per_page) || Movie.none
    else
      @movies = []
      flash.now[:danger] = "Please enter a movie name to Search"
    end
  end

  def show
    @movie = Movie.find params[:id]
  end
end
