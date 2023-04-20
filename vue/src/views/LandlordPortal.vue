<template>
  <div id="portal">
    <div class="header">
      <img src="../assets/skyline-crop-3.jpg" alt="Skyline" />
      <div class="title">
        <h1>
          Welcome,
          <span
            >{{ this.$store.state.user.firstName }}
            {{ this.$store.state.user.lastName }}</span
          >!
        </h1>
        <br />
        <p>View and manage your properties here</p>
      </div>
    </div>
    <div id="black-bar" />

    <div id="content" v-show="true">
      <landlord-property-list :id="this.$store.state.user.id" />
      <!--Placeholder must be replaced with actual Maintenance Order Queue-->
      <maintenance-request-list />
    </div>
  </div>
</template>

<script>
import LandlordPropertyList from "../components/LandlordPropertyList.vue";
import MaintenanceRequestList from "../components/MaintenanceRequestList.vue";

export default {
  components: {
    LandlordPropertyList,
    MaintenanceRequestList,
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
  grid-template-areas: "prop-list placeholder";
  grid-template-columns: 1fr 1fr;
  gap: 2rem;
  padding: 0 6rem;
  margin-bottom: 1rem;
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

.header h1,
.header p {
  color: white;
  text-align: center;

  align-content: center;
  font-weight: 500;
  text-shadow: 1px 1px 10px black;
}

.header h1 {
  font-size: 2.8rem;
}

.header p {
  font-size: 1.5rem;
}

.header {
  height: 20rem;
  overflow: hidden;
}

img {
  max-width: 100%;
  display: block;
  height: auto;
}

.title span {
  font-style: italic;
}

.title {
  position: absolute;
  top: 9rem;
  left: 50%;
  transform: translate(-50%, 0%);
  width: 100%;
}

#black-bar {
  height: 0.2rem;
  background-color: black;
  margin-bottom: 1rem;
}
</style>
