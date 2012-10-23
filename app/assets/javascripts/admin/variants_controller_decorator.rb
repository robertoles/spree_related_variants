Spree::Admin::VariantsController.class_eval do

  def search
    includes = [{:variants => [:images,  {:option_values => :option_type}]}, {:master => :images}]
    @collection = Spree::Variant.where(["sku #{LIKE} ?", "%#{params[:q]}%"]).limit(params[:limit] || 10)
    respond_to do |format|
      format.json { render :json => search_json_data }
    end
  end

private

  def search_json_data
    @collection.map do |v|
      { :label => "#{v.sku}: #{v.name}", :id => v.id, sku: v.sku }
    end
  end

end