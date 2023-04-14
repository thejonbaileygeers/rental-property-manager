<template>
  <div>
    <h1>Welcome to the Tenant Portal!!</h1>
    <br /><placeholder-greeting />
    <maintenance-request-list :property="property" />
  </div>
</template>

<script>
import MaintenanceRequestList from "../components/MaintenanceRequestList.vue";
import PlaceholderGreeting from "../components/PlaceholderGreeting.vue";

export default {
  data() {
    return {
      property: {},
    };
  },
  components: { PlaceholderGreeting, MaintenanceRequestList },
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

<style>
</style>