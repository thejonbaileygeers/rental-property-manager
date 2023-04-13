<template>
  <div id="portal">
    <h1>Welcome to the Landlord Portal!!</h1>
    <br /><placeholder-greeting />

    <link rel="stylesheet" href="" :to="">
    <div id="content" v-show="false">
      <landlord-property-list :id="this.$store.state.user.id" />
      <!--Placeholder must be replaced with actual Maintenance Order Queue-->
      <div id="placeholder">PLACEHOLDER FOR MAINTENANCE REQUESTS</div>
    </div>
  </div>
</template>

<script>
import LandlordPropertyList from "../components/LandlordPropertyList.vue";
import PlaceholderGreeting from "../components/PlaceholderGreeting.vue";

export default {
  components: { PlaceholderGreeting, LandlordPropertyList },

  data() {
    return {

    } 
  },
  methods: {
    addProperty() {
      console.log('hi');
    }
  }
};
</script>



<style>
#content {
  display: grid;
  height: 100%;
  width: 100%;
  grid-template-areas: "prop-list placeholder";
  grid-template-columns: 1fr 1fr;
  gap: 5vw;
}

landlord-property-list {
  flex: 1;
  max-width: 50%;
  width: 50%;
  grid-area: prop-list;
}

#placeholder {
  background-color: tomato;
  grid-area: placeholder;
  width: 100%;
  text-align: center;
}

#portal {
  margin: 1em;
}
</style>