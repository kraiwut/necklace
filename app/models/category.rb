class Category < ActiveRecord::Base
  attr_accessible :name, :parent_id

  has_many :products
  has_many :children, :class_name => Category.name, :foreign_key => :parent_id
  belongs_to :parent, :class_name => Category.name, :foreign_key => :parent_id

  validates :name, :presence => true
  
  def self.root
  	where(:parent_id => nil).first
  end

  def root?
    parent_id.nil?
  end

  def parent_and_self_name
  	parent ? "#{parent.name}:#{name}" : name
  end

end
