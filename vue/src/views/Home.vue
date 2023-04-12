<template>
  <div class="home">
    <div class="header">
      <h1>Let's Rent!</h1>
      <p>Browse our properties:</p>
      <property-list />
    </div>
  </div>
</template>

<script>
import PropertyList from "../components/PropertyList.vue";
export default {
  name: "home",
  components: { PropertyList },
};
</script>

<style scoped>
h1,
p {
  text-align: center;
}

img {
  width: 100vw;
}
</style>
