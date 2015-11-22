App.gizmos = App.cable.subscriptions.create("GizmosChannel", {
  received: function(data) {
    console.debug("data", data);
    var node = $(data.id);
    if (node) {
      node.html(data.html);
    }
    //gizmos.append(data.gizmo);
    // gizmos.scrollTop(gizmos.height() + 1000);
  }
});

// $(document).on("page:change", function() {
//   $("#new_message").on("ajax:success", function() {
//     $('#message_body').val('');
//   });
// });
