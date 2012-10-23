Deface::Override.new(:virtual_path => "spree/products/_cart_form",
                     :name => "add_related_variants_cart",
                     :insert_after => "code[erb-silent]:contains('if @product.has_variants?')",
                     :partial => "spree/products/related_variants_cart")

Deface::Override.new(:virtual_path => "spree/products/_cart_form",
                     :name => "ensure_product_added_to_cart",
                     :insert_top => ".add-to-cart",
                     :text => '<%= hidden_field_tag "add_variants[#{@product.master.id}]" %>')