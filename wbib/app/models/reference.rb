class Reference < ActiveRecord::Base
  validates :url, presence: true
  #validates :url, format: { with: URI.regexp }
  validates :url, format: { with: /((https|http):\/\/)?(www\.)?(\w+\.)+([a-z]*)(.*)/ }
  belongs_to :topic
end
