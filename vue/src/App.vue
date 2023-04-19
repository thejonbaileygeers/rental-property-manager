<template>
  <div id="app" v-if="!isLoading">
    <navigation />
    <router-view id="view" />
    <p id="version-no">v0.3</p>
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
  mounted() {
    let tag = document.createElement("script");
    tag.setAttribute("src", "https://kit.fontawesome.com/ae58b87c40.js");
    document.head.appendChild(tag);
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

button {
  padding: 6px 12px;
  border-radius: 4px;
  border: none;
  background-color: #007bff;
  color: #fff;
  cursor: pointer;
}

button:hover {
  background-color: #0069d9;
}

#version-no {
  text-align: right;
  margin-right: 1rem;
  font-size: 0.8rem;
}
</style>