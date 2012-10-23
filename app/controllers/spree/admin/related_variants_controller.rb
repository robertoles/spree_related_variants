module Spree
  module Admin
    class RelatedVariantsController < Spree::Admin::BaseController
      before_filter :load_data, :only => [:create, :destroy]

      respond_to :js

      def index
        load_data
        @relation_types = Spree::Variant.relation_types
      end

      def create
        @relation = Spree::Relation.new(params[:relation])
        @relation.relatable = @product
        @relation.related_to = Spree::Variant.find(params[:relation][:related_to_id])
        @relation.save

        respond_with(@relation)
      end

      def destroy
        @relation = Spree::Relation.find(params[:id])
        @relation.destroy

        respond_with(@relation)
      end

      private

      def load_data
        @product = Spree::Product.find_by_permalink(params[:product_id])
      end
    end
  end
end