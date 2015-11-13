class Tag < ActiveRecord::Base
  belongs_to :image, dependent: :destroy
end
