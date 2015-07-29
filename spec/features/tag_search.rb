require 'rails_helper'

RSpec.feature "Tag search", type: :feature do

  let(:book_names) {[
    "Eloquent Ruby",
    "The Well-Grounded Rubyist",
    "Practical Object-Oriented Design in Ruby"
  ]}

  scenario "Users can search by tag using a drop-down selection" do
    create_books

    visit root_path
    select('Ruby', :from => 'tags')
    click_link('Search')

    book_names.each do |book|
      expect(page).to have_text(book)
    end
  end

  def create_books
    ruby_tag = [Tag.create(name: 'Ruby')]

    Book.create(title: "Eloquent Ruby", tags: ruby_tag)
    Book.create(title: "The Well-Grounded Rubyist", tags: ruby_tag)
    Book.create(title: "Practical Object-Oriented Design in Ruby", tags: ruby_tag)
  end
end
