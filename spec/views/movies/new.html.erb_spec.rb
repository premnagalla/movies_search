require 'rails_helper'

RSpec.describe "movies/new", type: :view do
  before(:each) do
    assign(:movie, Movie.new(
      adult: false,
      api_id: 1,
      original_language: "MyString",
      original_title: "MyString",
      overview: "MyText",
      poster_path: "MyString",
      title: "MyString",
      vote_average: 1.5,
      vote_count: 1
    ))
  end

  it "renders new movie form" do
    render

    assert_select "form[action=?][method=?]", movies_path, "post" do

      assert_select "input[name=?]", "movie[adult]"

      assert_select "input[name=?]", "movie[api_id]"

      assert_select "input[name=?]", "movie[original_language]"

      assert_select "input[name=?]", "movie[original_title]"

      assert_select "textarea[name=?]", "movie[overview]"

      assert_select "input[name=?]", "movie[poster_path]"

      assert_select "input[name=?]", "movie[title]"

      assert_select "input[name=?]", "movie[vote_average]"

      assert_select "input[name=?]", "movie[vote_count]"
    end
  end
end
