class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :short_description, :seo_link, :images_attributes

  belongs_to :category
  has_many :images
  accepts_nested_attributes_for :images
end
