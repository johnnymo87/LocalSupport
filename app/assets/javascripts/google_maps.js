LocalSupport.maps = {
    // View must provide a URL variable
    openInfoWindow: undefined,
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
    getData: function(map, url) {
        $.ajax({
            type: 'GET',
            url: url,
            dataType: 'JSON',
            success: function (data) {
                if (data.length == undefined) {
                    LocalSupport.maps.loadMarkers(map, data)
                } else {
                    for (var i = 0; i < data.length; i++) {
                        LocalSupport.maps.loadMarkers(map, data[i])
                    }
                }
            }
        });
    },
    loadMarkers: function(map, org) {
        var coords = new google.maps.LatLng(org.latitude, org.longitude);
        var marker = new google.maps.Marker({
            position: coords,
            title: org.name,
            infoWindow: new google.maps.InfoWindow({
                content: '<a href="/organizations/' + org.id + '">' + org.name + '</a><br>' + org.description,
                position: coords,
                disableAutoPan: true
            })
        });
        google.maps.event.addListener(marker, 'click', function() {
            // this == marker
            var previous = LocalSupport.maps.openInfoWindow;
            if (previous != undefined) {
                previous.close()
            }
            this.infoWindow.open(map, this);
            LocalSupport.maps.openInfoWindow = this.infoWindow
        });
    }
};

$(function () {
    var map = LocalSupport.maps.loadMap();
    LocalSupport.maps.getData(map, organizationURL)
});
