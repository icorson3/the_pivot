$(document).ready(function () {
  var $items = $('.item');

  $(".filter").children().on('change', function() {
    var currentCategory = $("#item_filter_category").val();
    var currentVendor   = $("#item_filter_vendor").val();
    $items.each(function (index,item) {
    var $item = $(item);
      if(($item.data("category") === currentCategory || $('#item_filter_category').val() === "") && ($item.data("vendor") === currentVendor || $('#item_filter_vendor').val() === "")) {
        $item.parent().show();
      } else {
        $item.parent().hide();
      }
    });
  });
});
