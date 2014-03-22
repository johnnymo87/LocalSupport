LocalSupport.maps = {
    // View must provide a URL variable
    getData: function(URL) {
    },
    loadMap: function() {
        var harrow = new google.maps.LatLng(51.605427,-0.254600);
        var mapOptions = {
            zoom: 12,
            center: harrow
        };
        return new google.maps.Map(document.getElementById('map'), mapOptions);
    },
    loadMarkers: function(map, url) {
        $.ajax({
            type: 'GET',
            url: url,
            dataType: 'JSON',
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    var org = data[i];
                    var coords = new google.maps.LatLng(org.latitude, org.longitude);
                    var marker = new google.maps.Marker({
                        position: coords,
                        title: org.name
                    });
                    marker.setMap(map)
                }
            }
        });
    }
};

$(function () {
    var map = LocalSupport.maps.loadMap();
    LocalSupport.maps.loadMarkers(map, organizationURL)
});
