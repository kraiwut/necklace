require 'machinist/active_record'

User.blueprint do
	username  { "User#{sn}" }
  email 		{ "dev#{sn}@necklace.com" }
  password  { "123456" }
  type			{ NormalUser.name }
end

SiteAdmin.blueprint do
  type			{ SiteAdmin.name }
end

Category.blueprint do
	name { "Cat-#{sn}" }
end

Product.blueprint do
	name 							{ "Cat-#{sn}" }
	short_description { "short description" }
	description 			{ "description" }
	price							{ 1000 }
end

Image.blueprint do
	name { "Cover" }
	file {"/path/of/file.jpg"}
end