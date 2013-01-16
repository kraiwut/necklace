module CategoriesHelper

	TREE_TYPE_ADMIN = "admin"
	TREE_TYPE_CUSTOMER = "customer"

	def render_categories_tree
		root = Category.root
		html = ""
		html += render_node(root)
		html.html_safe
	end

	private
		def render_node(category)
			type = controller.is_a?(AdminController) ? TREE_TYPE_ADMIN : TREE_TYPE_CUSTOMER
			
			children_html = ""
			category.children.order(:created_at).each do |child|
				children_html += render_node(child) 
			end
			children_html = "<ul>#{children_html}</ul>" unless children_html.blank?
			
			if TREE_TYPE_ADMIN == type
				path = admin_category_products_path(category)
			else
				path = category_products_path(category)
			end
			link = link_to category.name, path
			%@<li>&nbsp;#{link}
					#{children_html}
				</li>@
		end

end