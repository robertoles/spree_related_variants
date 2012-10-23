Spree::Product.class_eval do
  def related_variants
    relations.where(related_to_type: 'Spree::Variant')
  end
end