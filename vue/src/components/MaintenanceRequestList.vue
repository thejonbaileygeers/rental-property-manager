<template>
  <div>
    <router-link :to="{ name: 'maintenance-request' }">
      <button>Make New Request</button>
    </router-link>
    <maintenance-request-row
      v-for="request in requests"
      :key="request.requestId"
      :property="property"
      :request="request"
    />
  </div>
</template>

<script>
import MaintenanceRequestRow from "./MaintenanceRequestRow.vue";

export default {
  components: { MaintenanceRequestRow },
  props: ["property"],
  computed: {
    requests() {
      let allRequests = this.$store.state.requests;
      return allRequests.filter((req) => {
        return req.propertyId == this.property.propertyId;
      });
    },
  },
};
</script>

<style>
</style>