Spree::OrdersController.class_eval do
  
  before_filter :remove_unwanted_variants, only: :populate

  private

  def remove_unwanted_variants
    return unless params[:variants]
    params[:add_variants] = {} unless params[:add_variants]
    params[:variants].delete_if do |key, value|
      params[:add_variants][key].nil?
    end
  end
end