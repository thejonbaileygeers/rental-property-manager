<template>
  <div class="property-grid">
    <property-card
      v-for="property in this.$store.state.properties"
      :key="property.propertyId"
      :property="property"
    />
  </div>
</template>

<script>
import PropertyCard from "./PropertyCard.vue";
export default {
  components: { PropertyCard },
};
</script>

<style>

.property-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-gap: 20px;
  justify-items: center;
  margin: 0 auto;
}

</style>