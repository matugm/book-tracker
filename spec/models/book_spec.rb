require 'rails_helper'

describe Book do
  it 'finds books by tag' do
    found_books = Book.find_by_tag('Ruby')

    expect(found_books.size).to eq(3)
  end

  it 'finds books by tag' do
    found_books = Book.find_by_tag('Linux')

    expect(found_books.size).to eq(1)
  end
end
