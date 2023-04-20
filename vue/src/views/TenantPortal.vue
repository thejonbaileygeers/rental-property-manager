<template>
  <div class="list">
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
        <p>View your current residence and submit maintenance requests</p>
      </div>
    </div>
    <div id="black-bar" />
    <div id="content" v-if="property.propertyId">
      <tenant-property-display :property="property" />
      <maintenance-request-list :property="property" />
    </div>
    <div id="new-tenant" v-if="!property.propertyId">
      <h1>Oops, looks like you don't currently have an active lease!</h1>
      <router-link :to="{ name: 'home' }"
        ><button>View Properties Here</button>
      </router-link>
    </div>
  </div>
</template>

<script>
import MaintenanceRequestList from "../components/MaintenanceRequestList.vue";
import TenantPropertyDisplay from "../components/Tenant-Property-Display.vue";

export default {
  data() {
    return {
      property: {},
    };
  },
  components: {
    MaintenanceRequestList,
    TenantPropertyDisplay,
  },
  created() {
    const lease = this.$store.state.leases.find((lea) => {
      return lea.tenantId == this.$store.state.user.id;
    });

    this.property = this.$store.state.properties.find((prop) => {
      return prop.propertyId == lease.propertyId;
    });
  },
};
</script>

<style scoped>
#content {
  display: grid;
  height: 100%;
  grid-template-columns: 1fr 1fr;
  gap: 2rem;
  padding: 0 6rem;
}

#black-bar {
  height: 0.2rem;
  background-color: black;
  margin-bottom: 1rem;
}

.content {
  display: flex;
  align-items: flex-start;
  justify-content: space-evenly;
  gap: 2rem;
  padding: 2rem 7rem;
}

.header h1,
.header p {
  color: white;
  text-align: center;
  align-content: center;
  font-weight: 500;
  text-shadow: 1px 1px 10px black;
}

.placeholder {
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

.title {
  position: absolute;
  top: 9rem;
  left: 50%;
  transform: translate(-50%, 0%);
  width: 100%;
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

#new-tenant {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 1rem;
  box-shadow: 0.2rem 0.2rem 5px 0px grey;
  background-color: white;
  border-radius: 2rem;
  width: 60rem;
  padding: 1.2rem;
  margin: auto;
}

#new-tenant button {
  font-size: 1.1rem;
  margin-bottom: 1rem;
}
</style>