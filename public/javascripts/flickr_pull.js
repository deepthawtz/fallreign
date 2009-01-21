$.getJSON("http://api.flickr.com/services/feeds/groups_pool.gne?id=675729@N22&lang=en-us&format=json&jsoncallback=?", function(data){
  $.each(data.items, function(i,item){
    $("<img/>").attr("src", item.media.m).appendTo("#images")
      .wrap("<a href='" + item.link + "'></a>");
  });
});