class Tagging < ActiveRecord::Base
  validates :tag_id, :link_id, presence: true

  belongs_to :tag_topics,
    primary_key: :id,
    foreign_key: :tag_id,
    class_name: :TagTopic

  belongs_to :shortened_urls,
    primary_key: :id,
    foreign_key: :link_id,
    class_name: :ShortenedUrl
end
