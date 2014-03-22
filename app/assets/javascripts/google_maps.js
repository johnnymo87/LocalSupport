LocalSupport.maps = {
    // View must provide a URL variable
    getData: function(URL) {
        $.ajax({
            type: 'GET',
            url: URL,
            dataType: 'json',
            contentType: 'application/json',
            success: function (data) {
                checks.each(function () {
                    var parent = $(this).closest('td'),
                        row = $(this).closest('tr'),
                        id = row.attr('id'),
                        res = data[id];
                    parent.html(res);
                    if (res.match(/Error:/g)) {
                        row.addClass("alert alert-error")
                    } else {
                        row.addClass("alert alert-success")
                    }
                });
            },
            error: function (data) {
            }
        });
    }
};

handler = Gmaps.build('Google');
handler.buildMap({
        provider: {
            zoom: 12,
            center: new google.maps.LatLng(51.580697,-0.34212),
            mapTypeId: google.maps.MapTypeId.ROADMAP
        },
        internal: {id: 'map'}
    },
    function () {
        var rawData = LocalSupport.maps.getData(organizationURL);
        var markers = rawData.each(function() {

        })
    });

