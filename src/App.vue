<template>
  <nav>
    <el-row :gutter="20">
      <el-col :span="16">
        <div class="web-title">Fire Dog App</div>
      </el-col>
      <el-col :span="8">
        <router-link to="/">Home</router-link> |
        <router-link to="/about">About</router-link>
      </el-col>
    </el-row>
  </nav>
  <router-view/>
</template>

<style>
@import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap');

body {
  background-color: black;
}
#app {
  font-family: 'Quicksand', sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: white;
}

nav {
  padding: 30px;
  line-height: 38px;
  text-align: right;
}

nav a {
  font-weight: 500;
  color: white;
}

nav a.router-link-exact-active {
  color: #fcba03;
}

.web-title {
  text-align: left;
  font-size: 38px;
  font-weight: 500;
  color: #fcba03;
}
</style>
