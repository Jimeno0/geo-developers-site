define(['jquery','cookies','base','jsrender'], function($, Cookies, base){
    var Methods = {
        init: function(){
            base.init(Cookies);

            $("#suggestBtn").click(function(){
                var $this = $(this);
                $this.addClass("disabled");

                if(GEODEV["youtube"].selected.length == 0){
                    //alert("Debes seleccionar al menos un vídeo. Haz clic sobre el título para seleccionarlos.")
                    return -1;
                }
                data = {
                    videos:GEODEV["youtube"].selected
                };

                $.ajax({
                    type: "POST",
                    url: GEODEV.rootpath + "api/video/suggest",
                    data: data,
                    dataType: "json",
                    success: function (r) {
                        if (r.status !== "success") {
                            alert("Error: " + r.message);
                            $this.removeClass("disabled");
                        } else {
                            $("#youtubeNavigation").hide();
                            $("#suggestDone").show();
                            //console.log("r=", r);
                        }
                    }
                });
            });

            GEODEV["youtube"] = {
                page: 0,
                requests: 1,
                selected: [],
                videos: [],
                init: function(){
                    GEODEV["youtube"].requests = 1;
                    GEODEV["youtube"].selected = [];
                    GEODEV["youtube"].videos = [];
                    GEODEV["youtube"].page = 0;
                    GEODEV["youtube"].params.q = $("#searchVideo input").val();

                    var el = $("#searchVideo .search");
                    el.addClass("disabled");
                    el.find("i").addClass("fa fa-circle-o-notch fa-spin");
                    $("#suggestDone").hide();
                    $("#searchResults .selected").removeClass("selected");

                    GEODEV["youtube"].loadVideos();
                },
                params: {
                    part: "snippet",
                    order: "relevance",
                    type: "video",
                    videoDefinition: "high",
                    key: apikey
                },
                loadVideos: function(pageToken){
                    that = this;
                    if(pageToken){
                        GEODEV["youtube"].params["pageToken"] = pageToken;
                    }

                    $.ajax({
                        type: "GET",
                        url: "https://www.googleapis.com/youtube/v3/search",
                        data: GEODEV["youtube"].params,
                        dataType: "json",
                        success: function (r) {
                            GEODEV["youtube"].videos = GEODEV["youtube"].videos.concat(r.items);
                            var max = GEODEV["youtube"].requests;
                            if(GEODEV["youtube"].videos.length < (30*max) && r.nextPageToken){
                                GEODEV["youtube"].loadVideos(r.nextPageToken)
                            }else{
                                GEODEV["youtube"].renderVideos();
                                GEODEV["youtube"].requests++;
                                var el = $("#searchVideo .search");
                                el.removeClass("disabled");
                                el.find("i").removeClass("fa fa-circle-o-notch fa-spin");
                            }
                        }
                    });
                },
                renderVideos: function(){
                    var counter = GEODEV["youtube"].page;
                    var data = GEODEV["youtube"].videos.slice(6*counter,6*counter+6);

                    template = $.templates("#videoTmpl");
                    htmlOutput = template.render(data);
                    $("#searchResults").html(htmlOutput);

                    $(GEODEV["youtube"].selected).each(function(i,elem){
                        $('[data-url="'+elem.url+'"]').addClass("selected");
                    });
                    if(GEODEV["youtube"].videos.length > 0){
                        if(data.length == 0){
                            GEODEV["youtube"].loadVideos();
                        }
                        $("#youtubeNavigation").show();
                    }else{
                        $("#youtubeNavigation").hide();
                    }
                }
            };

            window.selectVideo = function(elem){

                $(elem).toggleClass('selected');

                var video = {
                    title: $(elem).find("p").text(),
                    url:$(elem).find("a").attr("href")
                };

                if($(elem).hasClass("selected")){
                    GEODEV["youtube"].selected.push(video);
                }else{
                    $(GEODEV["youtube"].selected).each(function(i,elem){
                        if(elem.url == video.url){
                            GEODEV["youtube"].selected.splice(i, 1);
                        }
                    });
                }
            };

            $('#searchVideo input').keypress(function (e) {
                if (e.which == 13) {
                    GEODEV["youtube"].init();
                }
            });
            $('#searchVideo .search').click(GEODEV["youtube"].init);


            $("#searchVideo .after").click(function(e){
                GEODEV["youtube"].page++;
                /*if(GEODEV["youtube"].page*5 === GEODEV["youtube"].videos.length){
                 GEODEV["youtube"].loadVideos();
                 }*/
                GEODEV["youtube"].renderVideos();
                if(GEODEV["youtube"].page > 0){
                    $("#searchVideo .before").removeClass("disabled");
                }else{
                    $("#searchVideo .before").addClass("disabled");
                }
            });
            $("#searchVideo .before").click(function(e) {
                GEODEV["youtube"].page--;
                GEODEV["youtube"].renderVideos();
                if(GEODEV["youtube"].page > 0){
                    $(this).removeClass("disabled");
                }else{
                    $(this).addClass("disabled");
                }
            });
        }
    };
    return Methods;
});
