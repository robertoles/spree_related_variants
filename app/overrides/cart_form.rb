Deface::Override.new(:virtual_path => "spree/products/_cart_form",
                     :name => "add_related_variants_cart",
                     :insert_after => "code[erb-silent]:contains('if @product.has_variants?')",
                     :partial => "spree/products/related_variants_cart")