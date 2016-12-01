class TagTopic < ActiveRecord::Base
  validates :topic_name, presence: true, uniqueness: true

  has_many :taggings,
    primary_key: :id,
    foreign_key: :tag_id,
    class_name: :Tagging

  has_many :tags,
    through: :taggings,
    source: :shortened_urls
end
