<template>
  <div>
    <div id="details">
      <h1>ID: {{ request.requestId }} {{ request.title }}</h1>
      <h2>Request Details:</h2>
      <h3>Priority: {{ request.priority }} Status: {{ request.status }}</h3>
      <h3>
        Date Opened: {{ request.dateRequested }}
        <span v-show="request.dateCompleted != null"
          >Date Completed: {{ request.dateCompleted }}</span
        >
      </h3>
      <p>{{ request.description }}</p>
    </div>
  </div>
</template>

<script>
export default {
  props: ["request"],
};
</script>

<style>
</style>