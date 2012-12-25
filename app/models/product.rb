class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :short_description, :seo_link
end
