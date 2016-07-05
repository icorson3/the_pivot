$(document).ready(function(){
  $('.order_table').hide();
  $('#pending_orders').show();

  showOrderTable("#pending", "#pending_orders");
  showOrderTable("#all", "#all_orders");
  showOrderTable("#order", "#ordered_orders");
  showOrderTable("#pay", "#paid_orders");
  showOrderTable("#cancel", "#cancelled_orders");
  showOrderTable("#complete", "#completed_orders");

  function showOrderTable(buttonID, status){
    $(buttonID).on("click", function(){
      $('.order_table').hide();
      $(status).show();
    });
  }
});
