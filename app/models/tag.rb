class Tag < ActiveRecord::Base
  has_and_belongs_to_many :books

  def self.find_books_by_tag(tag_name)
    find_by(name: tag_name).try(:books)
  end
end
