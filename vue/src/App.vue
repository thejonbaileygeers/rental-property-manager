<template>
  <div id="app">
    <div id="nav">
      <img src="../src/assets/templatelogo.png" class="logo" />
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link
        v-bind:to="{ name: 'logout' }"
        v-if="$store.state.token != ''"
        >Logout</router-link
      >
    </div>
    <router-view />
  </div>
</template>

<script>
import PropertyService from "./services/PropertyService.js";

export default {
  created() {
    PropertyService.getAll()
      .then((response) => {
        this.$store.commit("SET_PROPERTIES", response.data);
      })
      .catch((error) => {
        //Todo: Add more appropriate error handling
        console.log(error);
      });
  },
};
</script>


<style>
#nav {
  display: flex;
  justify-content: space-around;
  align-items: center;
  min-height: 8vh;
  background-color: #eeeef0;
  font-family: "Roboto";
  position: relative;
  margin-bottom: 10px;
}

body {
  margin: 0px;
}

.logo {
  position: absolute;
  left: 10px;
  top: 10px;
  max-width: 5%;
  height: auto;
  border-radius: 20%;
}
</style>