<template>
  <div class="card">
    <img :src="property.imgUrl" />
    <div class="info">
      <h1>Address: {{ property.streetAddress }}</h1>
      <h2>
        Tenant: {{  getTenantFromLeaseId.firstName ??  'Vacant' }} {{ getTenantFromLeaseId.lastName }}
        <!--Todo: ADD TENANT INFO-->
      </h2>
      <h2>
        Rent Status:
        <!--ADD RENT STATUS BASED ON TRANSACTIONS-->
      </h2>
      <router-link
        :to="{ name: 'property-detail', params: { id: property.propertyId } }"
      >
        <button>View Details</button>
      </router-link>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      tenant: {},
      transactions: {},
    };
  },
  props: ["property"],
  computed: {
    getTenantFromLeaseId() {
      const lease = this.$store.state.leases.find(ln => ln.propertyId === this.property.propertyId);
      if (!lease) return 'open';
      return this.$store.state.users.find(u => {
        if(u.id === lease.tenantId) {
          return u;
        }
      }) ?? 'None';
    }
  }
};
</script>

<style scoped>
.card {
  display: inline-block;
  width: 100%;
  margin-bottom: 20px;
  box-shadow: 0.2rem 0.2rem 5px 0px grey;
  border-radius: 2rem;
  overflow: hidden;
  font-size: 20px;
  transition: all 0.1s cubic-bezier(0, 0, 0.5, 1);
  background-color: white;
}


.card img {
  width: 100%;
  height: 150px;
  object-fit: cover;
}


.info {
  display: flex;
  flex-direction: column;
}

img {
  width: 20rem;
}
</style>