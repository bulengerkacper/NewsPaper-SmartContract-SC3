$.get('/menu',
    function (data, textStatus, jqXHR) {  
    $('menu').append(data);
});

$.get('/rules',
    function (data, textStatus, jqXHR) {  
    $('rules_data').append(data);
});


function addNews() {
    var title = document.getElementById("textarea_field_news_title").value;
    var content = document.getElementById("textarea_field_news_content").value;
    var gaz = document.getElementById("textarea_field_gas").value;
	
	$.ajax({
	type: 'POST',
	contentType: 'application/json',
	url: '/add',
	dataType: 'json',
	data: JSON.stringify({ "name": title,"message":content,"gas":gaz }),
	//data: JSON.stringify({ "name": title }),
	success: function (result) {
	},
	error: function (error) { }
	});
    //location.reload();

	//tutaj postem w endpoint
    console.log(title);
    console.log(content);
    console.log(gaz);
}

function addComment() {
    var message = document.getElementById("textarea_field_message").value;
    var pseudonim = document.getElementById("textarea_field_pseudonim").value;
	//tutaj postem w endpoint
}

