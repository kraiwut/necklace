module ProductsSpecHelper

	# cat1
	# 	|- cat1.1
	# 	|		|- prod1.1.1
	# 	|
	# 	|- prod1.1
	# 	|- prod1.2
	#
	# cat2
	# 	|- cat2.1
	# 	|		|- prod2.1.1
	# 	|		|- prod2.1.2
	#  	|
	# 	|- cat2.2
	# 	|- cat2.3
	# 	|- cat2.4
	# 	|- cat2.5
	# 	|
	# 	|- prod2.1
	# 	|- prod2.2
	# 	|- prod2.3
	# 	|- prod2.4
	# 	|- prod2.5
	#
	# cat3
	def init_categories
		categories = []
		categories << Category.make!(:name => "cat1")
		categories << Category.make!(:name => "cat2")
		categories << Category.make!(:name => "cat3")
		categories[0].children << Category.make!(:name => "cat1.1")
		categories[1].children << Category.make!(:name => "cat2.1")
		categories[1].children << Category.make!(:name => "cat2.2")
		categories[1].children << Category.make!(:name => "cat2.3")
		categories[1].children << Category.make!(:name => "cat2.4")
		categories[1].children << Category.make!(:name => "cat2.5")

		categories[0].products << Product.make!(:name => "prod1.1")
		categories[0].products << Product.make!(:name => "prod1.2")
		categories[0].children[0].products << Product.make!(:name => "prod1.1.1")
		categories[1].products << Product.make!(:name => "prod2.1")
		categories[1].products << Product.make!(:name => "prod2.2")
		categories[1].products << Product.make!(:name => "prod2.3")
		categories[1].products << Product.make!(:name => "prod2.4")
		categories[1].products << Product.make!(:name => "prod2.5")
		categories[1].children[0].products << Product.make!(:name => "prod2.1.1")
		categories[1].children[0].products << Product.make!(:name => "prod2.1.2")

		categories
	end

end