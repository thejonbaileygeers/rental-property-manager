<template>
  <div>
    <h1>Welcome to the Maintenance Portal!!</h1>
    <br /><placeholder-greeting />
    <maintenance-request-list />
  </div>
</template>

<script>
import MaintenanceRequestList from "../components/MaintenanceRequestList.vue";
import PlaceholderGreeting from "../components/PlaceholderGreeting.vue";

export default {
  components: { PlaceholderGreeting, MaintenanceRequestList },
};
</script>

<style>
</style>