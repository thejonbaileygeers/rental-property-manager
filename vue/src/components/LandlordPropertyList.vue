<template>
  <div id="property-list">
    <section id="header">
      <h1>Your Properties</h1>

      <router-link :to="{ name: 'add-property-form' }"
        ><button>Add New Property</button></router-link
      >
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
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

#header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  box-shadow: 0.2rem 0.2rem 5px 0px grey;
  background-color: white;
  border-radius: 2rem;
  margin: auto;
  padding: 0;
  width: 100%;
}

#header h1 {
  margin: 1rem 1.5rem;
  font-size: 1.8rem;
}

#header button {
  margin-right: 1.2rem;
}

button {
  height: 50%;
}
</style>