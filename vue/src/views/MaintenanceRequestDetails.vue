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
      let tenantLease = this.$store.state.leases.find((lease) => {
        return lease.propertyId == this.request.propertyId;
      });

      if (tenantLease) {
        return this.$store.state.users.find((usr) => {
          return usr.id == tenantLease.tenantId;
        });
      } else {
        return undefined;
      }
    },
    landlord() {
      return this.$store.state.users.find((usr) => {
        return usr.id == this.property.ownerId;
      });
    },
    maintenance() {
      return this.$store.state.users.find((usr) => {
        return usr.id == this.request.maintenanceId;
      });
    },
  },
};
</script>

<style>
</style>