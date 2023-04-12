<template>
  <div>
    <h1 class="property-name">{{ property.name }}</h1>
    <h2 class="address">
      {{ property.streetAddress }}
      <span v-if="property.unit">Unit #{{ property.unit }}</span>
    </h2>
    <h2 class="address">{{ property.state }} {{ property.zip }}</h2>
    <h3 class="info">
      <span>{{ property.bedrooms }} Bed </span
      ><span>{{ property.bathrooms }} Bath </span>
      <span>{{ property.squareFootage }} Square Feet </span>
    </h3>

    <img :src="property.imgUrl" />
    <p class="description">{{ property.description }}</p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      property: {},
    };
  },
  created() {
    //Grab properties from the Store
    const properties = this.$store.state.properties;

    const prop = properties.find((property) => {
      console.dir(property);
      return this.$route.params.id == property.propertyId;
    });

    //Set data to
    this.property = prop;
  },
};
</script>

<style scoped>
</style>