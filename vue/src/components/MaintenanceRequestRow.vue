<template>
  <div>
    ID: {{ request.requestId }} | Title: {{ request.title }} | Priority:
    {{ request.priority }} | Status:
    {{ request.status }}
  </div>
</template>

<script>
export default {
  props: ["request", "property"],
};
</script>

<style>
</style>