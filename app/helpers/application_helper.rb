module ApplicationHelper
  def img_path(movie)
    movie.poster_path? ? "https://www.themoviedb.org/t/p/w188_and_h282_bestv2#{movie.poster_path}" : "/no_image.jpeg"
  end

  def per_page
    params[:per_page] || 20
  end
end
