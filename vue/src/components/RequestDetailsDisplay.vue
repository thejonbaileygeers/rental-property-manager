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
import MaintRequestService from "../services/MaintRequestService";

export default {
  props: ["request"],
  computed: {
    userRole() {
      return this.$store.state.user.type;
    },
    maintenanceUsers() {
      return this.$store.state.users.filter((user) => {
        return user.type == "maintenance";
      });
    },
    isAssignedMaintenance() {
      return this.request.maintenanceId == this.$store.state.user.id;
    },
  },
  methods: {
    completeRequest() {
      MaintRequestService.completeRequest(this.request.requestId)
        .then((response) => {
          this.$store.commit("UPDATE_REQUEST", response.data);
        })
        .catch((error) => {
          console.log(error);
          //Todo: Add Appropriate Error Handling
        });
    },
    assignMaintenance(maintenanceId) {
      MaintRequestService.assignMaintenance(
        this.request.requestId,
        maintenanceId
      )
        .then((response) => {
          this.$store.commit("UPDATE_REQUEST", response.data);
        })
        .catch((error) => {
          console.log(error);
          //Todo: Add Appropriate Error Handling
        });
    },
  },
};
</script>

<style>
</style>