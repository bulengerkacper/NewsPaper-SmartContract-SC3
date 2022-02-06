$.get('/papay/menu',  // url
    function (data, textStatus, jqXHR) {  
    $('menu').append(data);
});

$.get('/papay/rules',  // url
    function (data, textStatus, jqXHR) {  
    $('rules').append(data);
});

function myFunction() {
    var title = document.getElementById("textarea_field_news_title").value;
    var content = document.getElementById("textarea_field_news_content").value;
    var gaz = document.getElementById("textarea_field_gas").value;
    console.log(title);
    console.log(content);
    console.log(gaz);

}

  