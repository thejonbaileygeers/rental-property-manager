<template>
  <div class="home">
    <property-list />
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

.home {
  background-color: #e6e6e6;
}
</style>
