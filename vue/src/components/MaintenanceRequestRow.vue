<template>
  <router-link
    :to="{
      name: 'maintenance-request-details',
      params: { id: request.requestId },
    }"
  >
    <div id="content">
      <div id="id">ID: {{ request.requestId }}</div>
      <div id="date-opened">Date Requested: {{ request.dateRequested }}</div>
      <div id="title">Title: {{ request.title }}</div>
      <div id="priority">Priority: {{ request.priority }}</div>
      <div id="repeat">Repeat Issue: {{ request.repeatIssue }}</div>
      <div id="worker">Assigned Maintenance:</div>
      <div id="status">Status: {{ request.status }}</div>
      <div id="date-completed">Date Completed: {{ request.dateCompleted }}</div>
    </div>
  </router-link>
</template>

<script>
export default {
  props: ["request"],
};
</script>

<style scoped>
#content {
  display: flex;
  gap: 2rem;
}
</style>