class Image < ActiveRecord::Base
  attr_accessible :file, :name, :product_id
  
  mount_uploader :file, ImageUploader

  belongs_to :product
end
