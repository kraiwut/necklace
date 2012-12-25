class Address < ActiveRecord::Base
  attr_accessible :city, :country_code, :line1, :line2, :postal_code, :province, :tel
end
