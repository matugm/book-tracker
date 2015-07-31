require 'rails_helper'

describe TagsController, "#show -> GET /tags/:tag_name" do
  let!(:books) { create_books }

  before { get :show, tag_name: 'Ruby' }

  it 'renders the show template with a success response code' do
    expect(response).to have_http_status(200)
    expect(response).to render_template(:show)
  end

  it 'assigns the filtered books to @books' do
    expect(assigns(:books).first).to be_an_instance_of(Book)
  end

  context "when there are no books with this tag" do
    before { get :show, tag_name: 'Rspec' }

    # Render the view to make sure it doesn't crash when given an empty @books
    render_views

    it 'assigns an empty list of records to @books' do
      expect(assigns(:books)).to be_nil
      expect(response).to have_http_status(200)
    end
  end

  private

  def create_books
    ruby_tag = [Tag.create(name: 'Ruby')]

    Book.create(title: "Eloquent Ruby", tags: ruby_tag)
    Book.create(title: "The Well-Grounded Rubyist", tags: ruby_tag)
    Book.create(title: "Practical Object-Oriented Design in Ruby", tags: ruby_tag)
  end
end
