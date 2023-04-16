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
      <form
        @submit.prevent="assignMaintenance()"
        v-if="userRole == 'landlord' && request.status != 'complete'"
      >
        <select v-model="maintenanceId">
          <option
            v-for="user in maintenanceUsers"
            :key="user.id"
            :value="user.id"
          >
            {{ user.firstName }} {{ user.lastName }}
          </option>
        </select>
        <input type="submit" value="Assign Maintenance" />
      </form>
      <p>{{ request.description }}</p>
      <button
        @click="completeRequest()"
        v-if="userRole == 'maintenance' && request.status != 'complete'"
      >
        Request Complete
      </button>
    </div>
  </div>
</template>

<script>
import MaintRequestService from "../services/MaintRequestService";

export default {
  data() {
    return {
      maintenanceId: -1,
    };
  },
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
          this.$router.push({ name: "tenant-portal" });
        })
        .catch((error) => {
          console.log(error);
          //Todo: Add Appropriate Error Handling
        });
    },
    assignMaintenance() {
      MaintRequestService.assignMaintenance(
        this.request.requestId,
        this.maintenanceId
      )
        .then((response) => {
          this.$store.commit("UPDATE_REQUEST", response.data);
          this.$router.push({ name: "tenant-portal" });
        })
        .catch((error) => {
          console.log("ERROR" + error);
          //Todo: Add Appropriate Error Handling
        });
    },
  },
};
</script>

<style>
</style>