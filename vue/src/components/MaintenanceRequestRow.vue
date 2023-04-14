<template>
  <router-link
    :to="{
      name: 'maintenance-request-details',
      params: { id: request.requestId },
    }"
  >
    <div>
      ID: {{ request.requestId }} | Title: {{ request.title }} | Priority:
      {{ request.priority }} | Status:
      {{ request.status }}
    </div>
  </router-link>
</template>

<script>
export default {
  props: ["request", "property"],
};
</script>

<style>
</style>