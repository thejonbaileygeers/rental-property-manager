<template>
  <div>
    <maintenance-request-form :propertyId="property.propertyId" />
  </div>
</template>

<script>
import MaintenanceRequestForm from "../components/MaintenanceRequestForm.vue";
export default {
  components: { MaintenanceRequestForm },
  data() {
    return {
      property: {},
    };
  },
  created() {
    const lease = this.$store.state.leases.find((lea) => {
      console.log(lea.tenantId);
      return lea.tenantId == this.$store.state.user.id;
    });

    console.log(lease);

    this.property = this.$store.state.properties.find((prop) => {
      return prop.propertyId == lease.propertyId;
    });

    console.log(this.property);
  },
};
</script>

<style>
</style>