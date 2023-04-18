<template>
  <div class="card">
    <img :src="property.imgUrl" />
    <div class="info">
      <h2>Property Details:</h2>
      <div id="property-details">
        <div class="text">
          <p>Name: {{ property.name }}</p>
          <p>
            Address: {{ property.streetAddress }}
            {{ property.unit ? "Unit #" + property.unit : "" }},
            {{ property.city }}, {{ property.state }}, {{ property.zip }}
          </p>
          <p>
            <span
              >{{ property.bedrooms }} &nbsp;<i class="fa-solid fa-bed" /></span
            ><span
              >{{ property.bathrooms }} &nbsp;<i class="fa-solid fa-bath"
            /></span>
            <span>{{ property.squareFootage }} Sq Ft</span>
          </p>
        </div>
        <router-link
          :to="{ name: 'property-detail', params: { id: property.propertyId } }"
        >
          <button>View Details</button>
        </router-link>
      </div>
      <h2>Lease Details:</h2>

      <div id="lease-details">
        <div class="text">
          <p>
            Tenant: {{ getTenantFromLeaseId.firstName ?? "Vacant" }}
            {{ getTenantFromLeaseId.lastName }}
          </p>
          <p>Start Date: {{ propertyLease.startDate }}</p>
          <p>End Date: {{ propertyLease.endDate }}</p>
          <p>Rent: ${{ propertyLease.rentAmount }} /mo.</p>
        </div>
        <router-link
          :to="{ name: 'lease-details', params: { id: property.propertyId } }"
        >
          <button>View Lease</button>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      tenant: {},
      transactions: {},
      lease: {},
    };
  },
  props: ["property"],
  computed: {
    getTenantFromLeaseId() {
      const lease = this.$store.state.leases.find(
        (ln) => ln.propertyId === this.property.propertyId
      );
      if (!lease) return "open";
      return (
        this.$store.state.users.find((u) => {
          if (u.id === lease.tenantId) {
            return u;
          }
        }) ?? "None"
      );
    },
    propertyLease() {
      return this.$store.state.leases.find(
        (ln) => ln.propertyId === this.property.propertyId
      );
    },
  },
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