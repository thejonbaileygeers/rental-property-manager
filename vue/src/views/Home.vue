<template>
  <div class="home">
    <div class="header">
    <h1>Let's Rent</h1>
    <p>Helping you simplify all things renting.
    </p>
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



h1, p {
  text-align: center;
}
</style>
