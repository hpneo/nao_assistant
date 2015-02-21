function showNotification(text, id) {
  var notification = $('#new_call_request');
  notification.find('p').text(text)
  notification.find('a').attr('href', '/call_requests/' + id + '/respond');
  notification.addClass('visible');

  setTimeout(function() {
    // notification.removeClass('visible');
  }, 2000);
}