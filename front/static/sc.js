$.get('/papay/menu',  // url
    function (data, textStatus, jqXHR) {  
    $('menu').append(data);
});

function myFunction() {
    console.log("executed");
    var title = document.getElementById("textarea_field_news_title").value;
    var content = document.getElementById("textarea_field_news_content").value;
    var gaz = document.getElementById("textarea_field_gas").value;
    console.log(title);
    console.log(content);
    console.log(gaz);

    document.querySelector('form').addEventListener('submit', (e) => {
        const data = Object.fromEntries(new FormData(e.target).entries());
        console.log(data)
      });
}

  