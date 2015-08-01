require 'rails_helper'

describe TagsController do
  # GET /tags/:tag_name
  describe "#show" do

    context "when books are found" do
      before { create_books }

      it 'renders the show template with a success response code' do
        get :show, tag_name: 'Ruby'
        expect(response).to have_http_status(200)
        expect(response).to render_template(:show)
      end

      it 'assigns the filtered books to @books' do
        get :show, tag_name: 'Ruby'
        expect(assigns(:books)).to_not be_nil
      end
    end

    context "when there are no books with this tag" do
       # Render the view to make sure it can handle an empty @books object
      render_views

      it 'renders the show template with a success response code' do
        get :show, tag_name: 'Rspec'
        expect(response).to have_http_status(200)
        expect(response).to render_template(:show)
      end

      it 'assigns an empty list of records to @books' do
        get :show, tag_name: 'Rspec'
        expect(assigns(:books)).to be_nil
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
end
