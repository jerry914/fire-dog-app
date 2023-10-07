<template lang="pug">
.home
  el-row(:gutter="20")
    el-col(:span="6")
      .navigation-container
        //- h2 Find a location
        //- el-select.nav-select(v-model='value' multiple='' filterable='' remote='' reserve-keyword='' placeholder='Please enter a keyword' :remote-method='remoteMethod' :loading='loading')
        //-   el-option(v-for='item in options' :key='item.value' :label='item.label' :value='item.value')
        h2 Select date
        el-date-picker.nav-select(v-model="fireDate" type="date")
    el-col(:span="18")
      FireMap
</template>

<script>
// @ is an alias to /src
import FireMap from '@/components/FireMap.vue'

export default {
  name: 'HomeView',
  components: {
    FireMap
  },
  data() {
    return {
      fireDate: new Date(),
      options: [],
      value: [],
      list: [],
      loading: false,
      states: ["Alabama", "Alaska", "Arizona",
      "Arkansas", "California", "Colorado",
      "Connecticut", "Delaware", "Florida",
      "Georgia", "Hawaii", "Idaho", "Illinois",
      "Indiana", "Iowa", "Kansas", "Kentucky",
      "Louisiana", "Maine", "Maryland",
      "Massachusetts", "Michigan", "Minnesota",
      "Mississippi", "Missouri", "Montana",
      "Nebraska", "Nevada", "New Hampshire",
      "New Jersey", "New Mexico", "New York",
      "North Carolina", "North Dakota", "Ohio",
      "Oklahoma", "Oregon", "Pennsylvania",
      "Rhode Island", "South Carolina",
      "South Dakota", "Tennessee", "Texas",
      "Utah", "Vermont", "Virginia",
      "Washington", "West Virginia", "Wisconsin",
      "Wyoming"]
    }
  },
  mounted() {
    this.list = this.states.map(item => {
      return { value: `value:${item}`, label: `label:${item}` };
    })
  },
  methods: {
    remoteMethod(query) {
      if (query !== '') {
        this.loading = true;
        setTimeout(() => {
          this.loading = false;
          this.options = this.list.filter(item => {
            return item.label.toLowerCase()
              .indexOf(query.toLowerCase()) > -1;
          });
        }, 200)
      } else {
        this.options = []
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