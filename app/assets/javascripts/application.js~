// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require moment
//= require bootstrap
//= require bootstrap-datetimepicker
//= require bootbox



// When document is ready: this gets fired before body onload <img src='http://blogs.digitss.com/wp-includes/images/smilies/icon_smile.gif' alt=':)' class='wp-smiley' />

$(function(){
 $("#search").keyup(function(){         	
	_this = this;
	// Show only matching TR, hide rest of them
	$.each($("#table tbody").find("tr"), function() {
    	console.log($(this).text());
    	if($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) == -1)
       		$(this).hide();
    	else
         	$(this).show();                
	});
  }); 

 });

