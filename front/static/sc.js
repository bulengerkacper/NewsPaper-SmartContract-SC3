$.get('/papay/menu',  // url
    function (data, textStatus, jqXHR) {  
    $('menu').append(data);
});