  function initMap() {
    //緯度と経度をマップの中心に指定する
    var point ={lat: parseFloat(gon.latitude), lng: parseFloat(gon.longitude)};
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 15,
        center: point
    });
    var contentString = '場所：gon.area';
    var infowindow = new google.maps.InfoWindow({
      content: contentString
    });
    //指定した地点にマーカーをつける
    var Marker = new google.maps.Marker({
        position:point,
        map: map,
        title: contentString
    });
  }