<template>
  <div>
    <request-details-display
      :request="request"
      :landlord="landlord"
      :tenant="tenant"
      :maintenance="maintenance"
      :property="property"
    />
  </div>
</template>

<script>
import RequestDetailsDisplay from "../components/RequestDetailsDisplay.vue";

export default {
  data() {
    return {
      request: {},
      property: {},
    };
  },
  components: {
    RequestDetailsDisplay,
  },

  created() {
    this.request = this.$store.state.requests.find((req) => {
      return req.requestId == this.$route.params.id;
    });

    this.property = this.$store.state.properties.filter((prop) => {
      return prop.propertyId == this.request.propertyId;
    })[0];
  },
  computed: {
    tenant() {
      let tenantId = this.$store.state.leases.filter((lease) => {
        return lease.propertyId == this.request.propertyId;
      })[0].tenantId;

      return this.$store.state.users.filter((usr) => {
        return usr.id == tenantId;
      })[0];
    },
    landlord() {
      return this.$store.state.users.filter((usr) => {
        return usr.id == this.property.ownerId;
      })[0];
    },
    maintenance() {
      return this.$store.state.users.filter((usr) => {
        return usr.id == this.request.maintenanceId;
      })[0];
    },
  },
};
</script>

<style>
</style>