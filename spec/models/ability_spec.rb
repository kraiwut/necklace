require 'spec_helper'

describe Ability do
	describe "guest" do
		it "should be able to view product" do
			ability = Ability.new(nil)
			ability.can?(:read, Product.make!).should be_true
		end
	end

	describe "normal user" do
		it "should be able to view product" do
			ability = Ability.new User.make!
			ability.can?(:read, Product.make!).should be_true
		end

		it "should not avail able to manage all" do
			ability = Ability.new User.make!
			ability.can?(:manage, :all).should be_false
		end
	end

	describe "admin" do
		it "should be able to mange all" do
			ability = Ability.new SiteAdmin.make!
			ability.can?(:manage, :all).should be_true
		end
	end

end