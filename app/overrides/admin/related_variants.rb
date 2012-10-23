Deface::Override.new(:virtual_path => "spree/admin/shared/_product_tabs",
                     :name => "add_related_variants_tab",
                     :insert_bottom => "[data-hook='admin_product_tabs']",
                     :partial => "spree/admin/related_variants/tab",
                     :disabled => false)
