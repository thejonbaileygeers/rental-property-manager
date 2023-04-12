<template>
  <div id="property-list">
    <section id="header">
      <h1>Your Properties:</h1>
      <button>Add New Property</button>
    </section>
    <landlord-property-card
      v-for="property in propertyList"
      :key="property.id"
      :property="property"
    />
  </div>
</template>

<script>
import LandlordPropertyCard from "./LandlordPropertyCard.vue";

export default {
  components: { LandlordPropertyCard },

  //Landlord ID
  props: ["id"],

  computed: {
    propertyList() {
      const properties = this.$store.state.properties;
      return properties.filter((prop) => {
        return prop.ownerId == this.id;
      });
    },
  },
};
</script>

<style scoped>
#property-list {
  border: 1px red dotted;
}

#header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

button {
  height: 50%;
}
</style>