<template>
  <div>
    <h1>Welcome to the Maintenance Portal!!</h1>
    <br /><placeholder-greeting />
    <assigned-requests-list />
  </div>
</template>

<script>
import AssignedRequestsList from "../components/AssignedRequestsList.vue";
import PlaceholderGreeting from "../components/PlaceholderGreeting.vue";

export default {
  components: { PlaceholderGreeting, AssignedRequestsList },
};
</script>

<style>
</style>