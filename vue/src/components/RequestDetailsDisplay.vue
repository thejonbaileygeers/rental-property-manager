<template>
  <div id="details-container">
    <div id="details" class="card">
      <h1>Maintenance Request Details:</h1>

      <h2>
        ID: {{ request.requestId }} {{ request.title }} Date Opened:
        {{ request.dateRequested }}
      </h2>
      <h3>Priority: {{ request.priority }} Status: {{ request.status }}</h3>
      <h3>Request Details:</h3>
      <p>{{ request.description }}</p>
      <h3>
        <span v-show="request.dateCompleted != null"
          >Date Completed: {{ request.dateCompleted }}</span
        >
      </h3>
      <button
        @click="completeRequest()"
        v-if="userRole == 'maintenance' && request.status != 'complete'"
      >
        Request Complete
      </button>
    </div>
    <div id="user-details">
      <article id="landlord-details" class="card" v-if="userRole != 'landlord'">
        <p>Property Owner Details:</p>
        <div class="landlord-name">
          <i class="fa-solid fa-user"></i>&nbsp;&nbsp;
          <span class="landlord-info"
            >{{ landlord.firstName }} {{ landlord.lastName }}</span
          >
        </div>
        <div class="landlord-contact-info">
          <i class="fa-solid fa-phone"></i>&nbsp;&nbsp;<span
            class="landlord-info"
            >{{ landlord.phone }}</span
          >
        </div>
      </article>
      <article id="tenant-details" class="card" v-if="userRole != 'tenant'">
        <p>Tenant Information:</p>
        <div class="tenant-name">
          <i class="fa-solid fa-user"></i>&nbsp;&nbsp;
          <span class="tenant-info"
            >{{ tenant.firstName }} {{ tenant.lastName }}</span
          >
        </div>
        <div class="tenant-contact-info">
          <i class="fa-solid fa-phone"></i>&nbsp;&nbsp;<span
            class="tenant-info"
            >{{ tenant.phone }}</span
          >
        </div>
      </article>
      <article
        v-if="userRole != 'maintenance'"
        id="maintenance-details"
        class="card"
      >
        <p>Maintenance Information:</p>
        <div v-if="maintenance" class="maintenance-name">
          <h3>Assigned Maintenance Employee:</h3>
          <i class="fa-solid fa-user"></i>&nbsp;&nbsp;
          <span class="maintenance-info"
            >{{ maintenance.firstName }} {{ maintenance.lastName }}</span
          >
        </div>
        <div v-if="maintenance" class="maintenance-contact-info">
          <i class="fa-solid fa-phone"></i>&nbsp;&nbsp;<span
            class="maintenance-info"
            >{{ maintenance.phone }}</span
          >
        </div>
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
        <div id="maintenance-office">
          <h3>24/7 Maintenance Hotline:</h3>
          <div class="maintenance-contact-info">
            <i class="fa-solid fa-phone"></i>&nbsp;&nbsp;<span
              class="maintenance-info"
              >(808) 555-2310</span
            >
          </div>
        </div>
      </article>
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
  props: ["request", "landlord", "tenant", "maintenance", "property"],
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
  mounted() {
    let tag = document.createElement("script");
    tag.setAttribute("src", "https://kit.fontawesome.com/ae58b87c40.js");
    document.head.appendChild(tag);
  },
};
</script>

<style scoped>
  #details-container {
    display: flex;
    justify-content: center;
    align-items: flex-start;
    height: 100vh;
    padding: 2rem;
    gap: 2rem;
    font-family: "Roboto", sans-serif;
  }

  .card {
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    background-color: white;
    border: 1px solid black;
    border-radius: 5px;
    padding: 20px;
    width: 100%;
  }

  #details {
    flex: 2;
  }

  #user-details {
    display: flex;
    flex-direction: column;
    gap: 1rem;
    flex: 1;
  }

  h1,
  h2,
  h3 {
    margin-bottom: 1rem;
  }

  #maintenance-office {
    margin-top: 1rem;
  }
</style>