<template>
  <div class="card">
    <img :src="property.imgUrl" />
    <div class="info">
      <h1>Address: {{ property.streetAddress }}</h1>
      <h2>
        Tenant:
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
};
</script>

<style scoped>
.card {
  border: 1px green solid;
  display: flex;
}

.info {
  display: flex;
  flex-direction: column;
}
</style>