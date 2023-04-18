<template>
  <div class="card">
    <img :src="property.imgUrl" />
    <div class="info">
      <div class="section-title">
        <h2>Property Details</h2>
        <router-link
          :to="{ name: 'property-detail', params: { id: property.propertyId } }"
        >
          <button>Edit Property</button>
        </router-link>
      </div>
      <div id="property-details">
        <div class="text">
          <p><span class="label">Name:</span>&nbsp; {{ property.name }}</p>
          <p>
            <span class="label">Address:</span>&nbsp;
            {{ property.streetAddress }}
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
      </div>

      <div id="lease-details">
        <div class="section-title">
          <h2>Lease Details</h2>
          <router-link
            :to="{ name: 'lease-details', params: { id: property.propertyId } }"
          >
            <button>{{ buttonText }}</button>
          </router-link>
        </div>
        <p v-if="!propertyLease">There is no active lease for this property.</p>
        <div class="text" v-if="propertyLease">
          <div class="lease-row">
            <p>
              <span class="label">Tenant:</span>&nbsp;
              {{ getTenantFromLeaseId.firstName ?? "Vacant" }}
              {{ getTenantFromLeaseId.lastName }}
            </p>
            <p v-if="propertyLease">
              <span class="label">Start Date:</span>&nbsp;
              {{ propertyLease.startDate }}
            </p>
            <p v-if="propertyLease">
              <span class="label">End Date:</span>&nbsp;
              {{ propertyLease.endDate }}
            </p>
          </div>
          <div class="lease-row">
            <p v-if="propertyLease">
              <span class="label">Rent:</span>&nbsp; ${{
                propertyLease.rentAmount
              }}
              /mo.
            </p>
          </div>
        </div>
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
    buttonText() {
      return this.propertyLease ? "Edit Lease" : "Create Lease";
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
  padding: 0 1rem;
}

img {
  width: 20rem;
}

h2 {
  display: block;
  text-align: left;
  margin: 10px 0;
}

.lease-row {
  display: flex;
  gap: 1rem;
  justify-content: space-between;
}

.section-title {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.label {
  font-weight: 600;
  vertical-align: bottom;
  line-height: 19px;
}

i {
  margin-right: 0.5rem;
}

/* .lease-row p {
  display: flex;
  align-items: center;
} */
</style>