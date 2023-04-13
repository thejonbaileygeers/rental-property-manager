<template>
  <div><property-overview :property="property" :owner="owner" /></div>
</template>

<script>
import PropertyOverview from "../components/PropertyOverview.vue";

export default {
  components: { PropertyOverview },
  data() {
    return {
      property: {},
      owner: {},
    };
  },
  created() {
    //Grab properties from the Store
    const properties = this.$store.state.properties;

    const prop = properties.find((property) => {
      return this.$route.params.id == property.propertyId;
    });

    //Set data to
    this.property = prop;

    const users = this.$store.state.users;
    let propOwner = users.find((user) => {
      return this.property.ownerId == user.id;
    });

    this.owner = propOwner;
  },
};
</script>

<style scoped>
</style>