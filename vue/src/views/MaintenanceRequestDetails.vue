<template>
  <div>
    <request-details-display :request="request" />
  </div>
</template>

<script>
import RequestDetailsDisplay from "../components/RequestDetailsDisplay.vue";

export default {
  data() {
    return {
      request: {},
    };
  },
  components: {
    RequestDetailsDisplay,
  },

  created() {
    this.request = this.$store.state.requests.find((req) => {
      return req.requestId == this.$route.params.id;
    });
  },
};
</script>

<style>
</style>