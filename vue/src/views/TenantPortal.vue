<template>
  <div>
    <div id="portal">
      <h1>Welcome to the Tenant Portal!!</h1>
      <br /><placeholder-greeting />
      <div id="content">
        <tenant-property-display :property="property" />
        <maintenance-request-list :property="property" />
      </div>
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

    console.log(this.property);
  },
};
</script>

<style scoped>
#content {
  display: flex;
  align-items: flex-start;
  justify-content: space-evenly;
  gap: 2rem;
}

#portal {
  padding: 4rem;
}
</style>