require 'rails_helper'

RSpec.describe "movies/show", type: :view do
  before(:each) do
    assign(:movie, Movie.create!(
      adult: false,
      api_id: 2,
      original_language: "Original Language",
      original_title: "Original Title",
      overview: "MyText",
      poster_path: "Poster Path",
      title: "Title",
      vote_average: 3.5,
      vote_count: 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Original Language/)
    expect(rendered).to match(/Original Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Poster Path/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4/)
  end
end
