<template>
  <div id="app" v-if="!isLoading">
    <navigation />
    <router-view />
  </div>
</template>

<script>
import Navigation from "./components/Navigation.vue";
import PropertyService from "./services/PropertyService.js";
import UserService from "./services/UserService.js";

export default {
  data() {
    return {
      isLoading: true,
    };
  },
  components: {
    Navigation,
  },
  created() {
    this.isLoading = true;
    PropertyService.getAll()
      .then((response) => {
        this.$store.commit("SET_PROPERTIES", response.data);

        UserService.getAll()
          .then((response) => {
            this.$store.commit("SET_USERS", response.data);
            this.isLoading = false;
          })
          .catch((error) => {
            //Todo: Add more appropriate error handling
            console.log(error);
          });
      })
      .catch((error) => {
        //Todo: Add more appropriate error handling
        console.log(error);
      });
  },
};
</script>


<style scoped>
router-view {
  margin: 1em;
}
</style>