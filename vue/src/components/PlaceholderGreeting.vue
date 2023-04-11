<template>
  <div>
    <h1>Hello, {{ firstName }} {{ lastName }}! You are a {{ type }}.</h1>
  </div>
</template>

<script>
export default {
  data() {
    return {
      firstName: "",
      lastName: "",
      type: "",
    };
  },
  created() {
    this.firstName = this.$store.state.user.firstName;
    this.lastName = this.$store.state.user.lastName;
    this.type = this.$store.state.user.type;
  },
};
</script>

<style>
</style>