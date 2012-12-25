require 'machinist/active_record'

User.blueprint do
	username  { "User#{sn}" }
  email 		{ "dev#{sn}@necklace.com" }
  password  { "123456" }
end