<template lang="pug">
.map-container
  #map
</template>

<script>

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
    this.initMap()

    // // setup the markers
    // this.fireplaces.forEach(function(coordinate) {
    //   var marker = L.marker([coordinate[0], coordinate[1]], {icon: fireIcon})
    //   marker.addTo(map)
    // })
  },
  methods: {
    initMap() {
      var map = new window.google.maps.Map(document.getElementById('map'), {
          zoom: 5,
          center: { lat: 38.883056, lng: -77.016389 }
      });

      new window.google.maps.KmlLayer({
          url: 'https://storage.googleapis.com/fire-dog-storage/FirespotArea_SUOMI_VIIRS_C2_USA_contiguous_and_Hawaii_24h.kmz',
          map: map
      });

    }
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
