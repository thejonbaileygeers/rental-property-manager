<template>
  <div id="portal">
    <h1>Welcome to the Landlord Portal!!</h1>
    <br /><placeholder-greeting />

    <div id="content" v-show="true">
      <landlord-property-list :id="this.$store.state.user.id" />
      <!--Placeholder must be replaced with actual Maintenance Order Queue-->
      <landlord-request-list />
    </div>
  </div>
</template>

<script>
import LandlordPropertyList from "../components/LandlordPropertyList.vue";
import LandlordRequestList from "../components/LandlordRequestList.vue";
import PlaceholderGreeting from "../components/PlaceholderGreeting.vue";

export default {
  components: {
    PlaceholderGreeting,
    LandlordPropertyList,
    LandlordRequestList,
  },

  data() {
    return {};
  },
  methods: {
    addProperty() {
      console.log("hi");
    },
  },
};
</script>



<style scoped>
#content {
  display: grid;
  height: 100%;
  width: 100%;
  grid-template-areas: "prop-list placeholder";
  grid-template-columns: 1fr 1fr;
  gap: 3vw;
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