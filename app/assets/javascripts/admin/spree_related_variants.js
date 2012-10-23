//= require admin/spree_core

format_variant_autocomplete = function(item) {
  var html = "";

  var variant = item.data.variant;
  html += "<div><h4>" + variant['label'] + "</h4>";
  html += "<span><strong><%= ::I18n.t(:sku) %>: </strong>" + variant['sku'] + "</span>";

  return html;
};

prep_variant_autocomplete_data = function(data){
  return $.map(eval(data), function(row) {

    var variant = row;
    
    return {
      data: {variant: variant},
      value: variant['label'],
      result: variant['label']
    };
  });
};


$.fn.variant_autocomplete = function() {
  return this.each(function() {
    $(this).autocomplete({
      source: function(request, response) {
        $.get('/admin/variants/search.json?' + jQuery.param({ q: $('#add_variant_name').val(), authenticity_token: encodeURIComponent($('meta[name=csrf-token]').attr("content"))}), function(data) {
          result = prep_variant_autocomplete_data(data);
          response(result);
        });
      },
      focus: function(event, ui) {
        $('#add_variant_name').val(ui.item.label);
        return false;
      },
      select: function(event, ui) {
        $('#add_variant_name').val(ui.item.label);
        variant = ui.item.data.variant;
        $('#add_variant_id').val(variant['id']);
        return false;
      }
    })
    /*.data("autocomplete")._renderItem = function(ul, item) {
      $(ul).addClass('ac_results');
      html = format_variant_autocomplete(item);
      return $("<li></li>")
              .data("item.autocomplete", item)
              .append("<a>" + html + "</a>")
              .appendTo(ul);
    }*/

    $(this).data("autocomplete")._resizeMenu = function() {
      var ul = this.menu.element;
      ul.outerWidth(this.element.outerWidth());
    }
  });
}

$(document).ready(function() {
  $('#add_variant_name').variant_autocomplete();
});