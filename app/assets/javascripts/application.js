// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


$(document).ready(function() {
	var serviceURL = String(window.location.origin)+"/";

	for (var i=0; i<url_list.length; i++) {

		var url = url_list[i];
		$.ajax({
			type: "POST",
		  	url: serviceURL + "monitor/urls.html",
		  	dataType: 'json',
			data: {url: url},
		  	success: function(data, textStatus, xhr) {
		  		var url_list = document.getElementById('url_list');
		  		var url_list_stg = document.getElementById('url_list_stg');
		  		var result = document.createElement('li');
		  		if(data.result[1]==200){
		  			result.innerHTML = "<div class='test_success status'>" + data.result[1] + "</div><div class='url'>" + data.result[0] + "</div>";
		  		}
		  		else {
		  			result.innerHTML = "<div class='test_fail status'>" + data.result[1] + "</div><div class='url'>" + data.result[0] + "</div>";
		  		}
		  		if(data.result[0].indexOf("-stg.com") != -1) {
		  			url_list_stg.appendChild(result);
		  		}
		  		else{
		  			url_list.appendChild(result);
		  		}
		  	},
		  	error: function(result) {
		  		return false;
		  	}
		});

	}

});