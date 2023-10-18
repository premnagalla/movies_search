require 'rails_helper'

RSpec.describe "movies/index", type: :view do
  before(:each) do
    assign(:movies, [
      Movie.create!(
        adult: false,
        api_id: 2,
        original_language: "Original Language",
        original_title: "Original Title",
        overview: "MyText",
        poster_path: "Poster Path",
        title: "Title",
        vote_average: 3.5,
        vote_count: 4
      ),
      Movie.create!(
        adult: false,
        api_id: 2,
        original_language: "Original Language",
        original_title: "Original Title",
        overview: "MyText",
        poster_path: "Poster Path",
        title: "Title",
        vote_average: 3.5,
        vote_count: 4
      )
    ])
  end

  it "renders a list of movies" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Original Language".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Original Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Poster Path".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.5.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
  end
end
