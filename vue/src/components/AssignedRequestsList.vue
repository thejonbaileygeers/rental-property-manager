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
        return req.maintenanceId == this.$store.state.user.id;
      });
    },
  },
};
</script>

<style>
</style>