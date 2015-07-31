require 'rails_helper'

feature "Tag search" do

  let(:books) {[
    "Eloquent Ruby",
    "The Well-Grounded Rubyist",
    "Practical Object-Oriented Design in Ruby"
  ]}

  scenario "Users can search by tag using a drop-down selection" do
    create_books

    visit root_path
    click_link('Ruby', match: :first)

    books.each do |book_title|
      expect(page).to have_text(book_title)
    end
  end

  def create_books
    ruby_tag = [Tag.create(name: 'Ruby')]

    books.each { |book| Book.create(title: book, tags: ruby_tag) }
  end
end
