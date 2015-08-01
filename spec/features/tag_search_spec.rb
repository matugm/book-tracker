require 'rails_helper'

feature "Tag search" do

  let(:books) {[
    "Eloquent Ruby",
    "The Well-Grounded Rubyist",
    "Practical Object-Oriented Design in Ruby"
  ]}

  let(:tag_name) { 'Ruby' }

  scenario "Users can filter post by tag by clicking on a tag name" do
    create_books

    visit books_path
    click_link(tag_name, match: :first)

    books.each do |book_title|
      expect(page).to have_text(book_title)
    end
  end

  def create_books
    ruby_tag = Tag.create(name: tag_name)

    books.each { |book| ruby_tag.books << Book.create(title: book) }
  end
end
