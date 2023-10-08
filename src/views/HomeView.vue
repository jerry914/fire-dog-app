<template lang="pug">
.home
  el-row(:gutter="20")
    el-col(:span="6")
      .navigation-container
        h2 Select date
        el-date-picker.nav-select(v-model="fireDate" type="date")
        h2 Player
        el-button(type="primary" round) 6 months
        el-button(type="primary" round) 1 year
        el-button(type="primary" round) 10 years
    el-col(:span="18")
      FireMap(:fireplaces="fireplaces")
</template>

<script>
// @ is an alias to /src
import FireMap from '@/components/FireMap.vue'
import axios from 'axios'
export default {
  name: 'HomeView',
  components: {
    FireMap
  },
  data() {
    return {
      fireDate: null,
      fireplaces: [
        {location: new window.google.maps.LatLng(25.033065, 121.563696), weight: 16},
        {location: new window.google.maps.LatLng(25.032099, 121.561341), weight: 5},
        {location: new window.google.maps.LatLng(25.031958, 121.558931), weight: 8},
        {location: new window.google.maps.LatLng(25.035347, 121.559460), weight: 5}
      ]
    }
  },
  watch: {
    fireDate(val) {
      this.getFireplaces(this.formatDate(val))
    }
  },
  mounted() {
    this.fireDate = new Date()
  },
  methods: {
    getFireplaces(date) {
      axios.get('https://storage.googleapis.com/fire-dog-storage/sorted_by_date/'+date+'.json').then((response) => {
        this.jsonData = response.data
        this.jsonData.forEach((data) => {
          this.fireplaces.push(this.transformData(data))
        })
        console.log(this.fireplaces)
      }).catch((error) => {
        console.error('An error occurred:', error)
        this.$message({
          showClose: true,
          message: 'Database error',
          type: 'error'
        });
      })
    },
    formatDate(date) {
      const year = date.getFullYear()
      const month = String(date.getMonth() + 1).padStart(2, '0')
      const day = String(date.getDate()).padStart(2, '0')
      return `${year}-${month}-${day}`
    },
    transformData(data) {
      const latitude = parseFloat(data.latitude);
      const longitude = parseFloat(data.longitude);
      const frp = parseFloat(data.frp);

      // Map the FRP value from 1 to 100
      const weight = Math.min(Math.max(Math.round(frp * 100), 1), 100);

      return {
        latitude: latitude,
        longitude: longitude,
        location: new window.google.maps.LatLng(latitude, longitude),
        weight: weight,
      }
    }
  }
}
</script>

<style>
.navigation-container {
  margin: 20px 0;
  padding: 20px;
  width: 100%;
}
.nav-select {
  width: 220px;
}
</style>