class Tmdb < ApplicationService
  require 'rest-client'
  API_KEY = YAML.load(File.read("config/tmdb_keys.yml"))[Rails.env]["api_key"]

  def initialize(search_str:, page_no:)
    @search_str = search_str
    @page_no = page_no
  end

  def call
    search_movies
  end

  private

  def search_movies
    params_str = "api_key=#{Tmdb::API_KEY}&query=#{@search_str}"
    params_str += "&page=#{@page_no}" if @page_no
    url = "https://api.themoviedb.org/3/search/movie?#{params_str}"
    response = RestClient.get(url)
    JSON.parse(response)
  end
end
