<template>
  <div>
    <router-link :to="{ name: 'maintenance-request' }">
      <button>Make New Request</button>
    </router-link>
    <maintenance-request-row
      v-for="request in requests"
      :key="request.requestId"
      :request="request"
    />
  </div>
</template>

<script>
import MaintenanceRequestRow from "./MaintenanceRequestRow.vue";

export default {
  data() {
    return {
      properties: [],
    };
  },
  components: { MaintenanceRequestRow },
  computed: {
    requests() {
      let allRequests = this.$store.state.requests;
      return allRequests.filter((req) => {
        return this.propertyIds.includes(req.propertyId);
      });
    },
    propertyIds() {
      return this.properties.map((prop) => {
        return prop.propertyId;
      });
    },
  },
  created() {
    const landlordId = this.$store.state.user.id;
    this.properties = this.$store.state.properties.filter((prop) => {
      return prop.ownerId == landlordId;
    });
  },
};
</script>

<style>
</style>