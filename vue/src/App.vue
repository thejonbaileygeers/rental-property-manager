<template>
  <div id="app" v-if="!isLoading">
    <navigation />
    <router-view id="view" />
  </div>
</template>

<script>
import Navigation from "./components/Navigation.vue";
import PropertyService from "./services/PropertyService.js";
import MaintRequestService from "./services/MaintRequestService.js";
import UserService from "./services/UserService.js";
import LeaseService from "./services/LeaseService.js";


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

            MaintRequestService.getAll()
              .then((response) => {
                this.$store.commit("SET_REQUESTS", response.data);

                LeaseService.getAll()
                  .then((response) => {
                    this.$store.commit("SET_LEASES", response.data);
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


<style>
* {
  font-family: "League Spartan", sans-serif;
}

#view {
  margin-top: 5em;
}
</style>