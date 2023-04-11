<template>
  <div class="property-card">
    <img :src="property.imgUrl" />
    <h2 id="name">{{ property.name }}</h2>
    <h3 id="address">{{ property.streetAddress }}</h3>
    <p>
      <span>{{ property.bedrooms }}</span
      ><span>{{ property.bathrooms }}</span>
      <span>{{ property.squareFootage }}</span>
    </p>
  </div>
</template>

<script>
export default {
  props: ["property"],
};
</script>

<style>
.property-card {
  border: 2px, solid green;
}
</style>