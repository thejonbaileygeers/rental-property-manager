<template>
  <div class="property-list">
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
</style>