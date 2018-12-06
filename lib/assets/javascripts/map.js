var map = L.map('map').setView([49.183333, -0.350000], 8);

L.tileLayer('https://korona.geog.uni-heidelberg.de/tiles/roads/x={x}&y={y}&z={z}', {
    maxZoom: 20
}).addTo(map);