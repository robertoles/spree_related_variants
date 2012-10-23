Spree::Variant.class_eval do
  def self.relation_types
    Spree::RelationType.find_all_by_applies_to(self.to_s, :order => :name)
  end
end