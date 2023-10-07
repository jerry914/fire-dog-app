<template lang="pug">
.map-container
  #map
</template>

<script>
import L from 'leaflet'
export default {
  name: 'FireMap ',
  props: {
    fireplaces: {
      type: Array,
      default: () => {
        return [
        [14.06708, 101.83491],
        [34.55589, 85.13651],
        [23.78011, 86.2106],
        [22.32899, 82.65689],
        [22.04595, 83.7338],
        [21.92604, 83.35297],
        [21.91722, 83.35153],
        [22.00451, 82.67525],
        [21.80643, 84.04158],
        [21.76287, 84.01854],
        [21.75401, 84.01706],
        [21.6755, 84.04631],
        [21.72437, 82.70048],
        [20.96141, 86.01079],
        [21.0807, 85.03998],
        [20.96791, 85.17152],
        [20.96631, 85.18182],
        [20.79621, 85.25239],
        [20.79455, 85.2628],
        [20.38471, 85.1707],
        [17.29199, 82.22084],
        [9.28092, 79.17278],
        [17.1667, 81.50951]
        ]
      }
    }
  },
  mounted() {
    // Sstup the map
    var map = L.map('map', {
      center: [20.915, 84.686],
      zoom: 5
    })
    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
      maxZoom: 8,
      attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
    }).addTo(map)

    // setup the icon
    var fireIcon = L.icon({
        iconUrl:'https://raw.githubusercontent.com/jerry914/fire-dog-app/gh-pages/assets/fire.png',
        iconSize: [20, 20],
        iconAnchor: [10, 10]
    })

    // setup the markers
    this.fireplaces.forEach(function(coordinate) {
      var marker = L.marker([coordinate[0], coordinate[1]], {icon: fireIcon})
      marker.addTo(map)
    })
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
.map-container {
  height: 80vh;
  margin: 20px;
}
#map { 
  height: 100%;
}
</style>
