class Topic < ActiveRecord::Base
  has_many :references, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
end
