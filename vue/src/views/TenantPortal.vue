<template>
  <div class="list">
    <div class="header">
      <img src="../assets/skyline-crop-3.jpg" alt="Skyline" />
      <div class="title">
        <h1>Welcome to the <span>Tenant Portal</span></h1>
        <div class="placeholder"><br /><placeholder-greeting /></div>
      </div>
    </div>
    <div id="black-bar" />
    <div class="content">
      <tenant-property-display :property="property" />
      <maintenance-request-list :property="property" />
    </div>
  </div>
</template>

<script>
import MaintenanceRequestList from "../components/MaintenanceRequestList.vue";
import PlaceholderGreeting from "../components/PlaceholderGreeting.vue";
import TenantPropertyDisplay from "../components/Tenant-Property-Display.vue";

export default {
  data() {
    return {
      property: {},
    };
  },
  components: {
    PlaceholderGreeting,
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

#black-bar {
  height: 0.2rem;
  background-color: black;
}
</style>