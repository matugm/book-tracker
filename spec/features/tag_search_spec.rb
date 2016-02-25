require 'rails_helper'

feature "Tag search" do
  let(:tag_name)  { tag(:ruby).name }
  let(:ruby_book) { book(:eloquent).title }

  scenario "Users can filter post by tag by clicking on a tag name" do
    visit books_path
    click_link(tag_name, match: :first)

    expect(page).to have_text(ruby_book)
  end
end
