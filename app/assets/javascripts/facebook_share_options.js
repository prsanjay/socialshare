jQuery(function() {
  $('body').prepend('<div id="fb-root"></div>');
  return $.ajax({
    url: window.location.protocol + "//connect.facebook.net/en_US/all.js",
    dataType: 'script',
    cache: true
  });
});

window.fbAsyncInit = function() {
  FB.init({
    appId: '675872932620328',
    cookie: true,
    xfbml: true,
    version: 'v2.8'

  });
  $('#sign_in').click(function(e) {
    e.preventDefault();
    return FB.login(function(response) {
      if (response.authResponse) {
        return window.location = '/auth/facebook/callback';
      }
    },{scope: 'publish_actions,email,user_birthday,public_profile'});
  });
  return $('#sign_out').click(function(e) {
    FB.getLoginStatus(function(response) {
      if (response.authResponse) {
        return FB.logout();
      }
    });
    return true;
  });
};

