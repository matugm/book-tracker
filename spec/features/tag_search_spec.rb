require 'rails_helper'

feature "Tag search" do
  let(:tag_name) { tag(:ruby).name }

  scenario "Users can filter post by tag by clicking on a tag name" do
    visit books_path
    click_link(tag_name, match: :first)

    books.each do |book_title|
      expect(page).to have_text(book_title)
    end
  end
end
