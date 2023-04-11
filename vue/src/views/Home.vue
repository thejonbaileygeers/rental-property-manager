<template>
  <div class="home">
    <h1>Home</h1>
    <p>You must be authenticated to see this</p>
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
