class Book < ActiveRecord::Base
  has_and_belongs_to_many :tags

  def self.find_by_tag(tag_name)
    joins(:tags).where(tags: { name: tag_name })
  end
end
