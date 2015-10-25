class Reference < ActiveRecord::Base
  validates :url, presence: true
  validates :url, format: { with: URI.regexp }
  belongs_to :topic
end
