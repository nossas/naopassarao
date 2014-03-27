// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

$(function(){
  $(document).foundation();

  if(window.location.hash == "#gandalf"){
    $(window.location.hash).foundation('reveal', 'open');
    document.getElementById("gandalf-audio").play();
  }

  $(window).scroll(function(){
    // Parallax
    scrollRatio = window.scrollY/$(document).height();
    scrollProgress = ((window.scrollY/$(document).height()) * 100) + "%";
    invertedScrollProgress = (100 - ((window.scrollY/$(document).height()) * 100)) + "%";
    scrollProgressPx = ((window.scrollY/$(document).height()) * 1000) + "px";
    invertedScrollProgressPx = (10000 - (window.scrollY/$(document).height()) * 10000) + "px";

    slide1Height = $(".slide-1").height() + parseInt($(".slide-1").css("padding-top")) + parseInt($(".slide-1").css("padding-bottom"));
    slide1BgHeight = 896;
    slide1ScrollRatio = window.scrollY/($(".slide-1").position().top + slide1Height);
    slide1Offset = slide1BgHeight - slide1Height;
    slide1Position = (slide1Offset * slide1ScrollRatio) + "px";

    $(".slide-1").css("background-position", "center " + slide1Position);
    $(".slide-2").css("background-position", scrollProgress + " 40%");
  });
});
