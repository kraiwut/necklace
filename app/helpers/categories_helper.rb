module CategoriesHelper

	def render_categories_tree
		root = Category.root
		html = ""
		html += render_node(root)
		html.html_safe
	end

	private
		def render_node(category)
			children_html = ""
			category.children.each do |child|
				children_html += render_node(child) 
			end
			children_html = "<ul>#{children_html}</ul>" unless children_html.blank?
			link = link_to category.name, admin_category_products_path(category)
			%@<li>&nbsp;#{link}
					#{children_html}
				</li>@
		end

end