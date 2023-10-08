<template lang="pug">
.map-container
  #map
</template>

<script>

export default {
  name: 'FireMap ',
  props: ['fireplaces'],
  watch: {
    fireplaces: {
      deep: true,
      handler() {
        this.initMap()
      }
    }
  },
  mounted() {
    this.initMap()
  },
  methods: {
    initMap() {
      var map = new window.google.maps.Map(document.getElementById('map'), {
        zoom: 4,
        center: {
          lat: 39.017453, 
          lng: -99.339670
        },
        mapTypeControl: false,
        mapTypeId: 'satellite'
      })

      new window.google.maps.visualization.HeatmapLayer({
        map: map,
        data: this.fireplaces,
        radius: 40
      })

      const image = "https://raw.githubusercontent.com/jerry914/fire-dog-app/gh-pages/assets/fire.png"
      this.fireplaces.forEach((fireplace) => {
        console.log(fireplace)
        new window.google.maps.Marker({
          position: { lat: fireplace.latitude, lng: fireplace.longitude },
          map,
          icon: image
        })
      })
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
