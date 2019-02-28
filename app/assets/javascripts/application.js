// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require rails-ujs
//= require activestorage
//= require_tree .

$(document).ready(function() {
  $(".tablinks").each(function(index) {
    $(this).click(function() {
      let tabs = $(".cardtab");
      tabs.addClass("collapse");
      let tab = $(tabs[index]);
      tab.toggleClass("collapse");
    });
  });

  $("#navbarTogglerDemo03").click(function() {
    $("#navbar-dropdown").toggleClass("collapse");
  });

  $("#hamburgerMenu .nav-item").click(function(e) {
    e.preventDefault();
    $("#sign_in").toggleClass("collapse");
  });

  $("#hamburgerMenu .nav-item").focusout(function() {
    $("#sign_in").toggleClass("collapse");
  });

  console.log($(".checkbox"));
  $(".checkbox").bind("change", function() {
    console.log("cocou");
    var bool = this.checked ? true : false;
    var regex = /task_/;
    $.ajax({
      url: "/tasks/" + this.id.replace(regex, ""),
      type: "PUT",
      data: { status: bool },
      dataType: "script"
    });
  });
});
