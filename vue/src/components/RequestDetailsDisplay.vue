<template>
  <div id="details-container">
    <div class="smallRowElement">
      <router-link :to="{ name: 'landlord-portal' }">
        <i id="back" class="fa-solid fa-circle-chevron-left fa-2xl" />
      </router-link>
    </div>
    <div id="details" class="card">
      <h1>Maintenance Request Details</h1>

      <h2>ID: {{ request.requestId }} {{ request.title }}</h2>
      <h2>
        Date Opened:
        {{ request.dateRequested }}
      </h2>
      <h3>Priority: {{ request.priority }}</h3>
      <h3>Status: {{ request.status }}</h3>
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
        Mark as Complete
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
      <article
        id="tenant-details"
        class="card"
        v-if="userRole != 'tenant' && tenant != undefined"
      >
        <h1>Tenant Information:</h1>
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
        <h1>Maintenance Information</h1>
        <h3>Assigned Maintenance Employee:</h3>
        <div v-if="!maintenance">No Employee has been assigned.</div>
        <div v-if="maintenance" class="maintenance-name">
          <i class="fa-solid fa-user"> </i>&nbsp;&nbsp;
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
      if (
        !confirm(
          "Are you sure you would like to mark this request as complete? This action cannot be undone."
        )
      ) {
        return;
      }
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
  box-shadow: 0.2rem 0.2rem 5px 0px grey;
}

.fa-circle-chevron-left {
  color: black;
  margin-top: 20px;
}

.back-button {
  display: inline-block;
  font-size: 16px;
  font-weight: bold;
  color: rgb(0, 0, 0);
  text-decoration: none;
  position: relative;
  padding-left: 20px;
}

.arrow {
  position: absolute;
  left: 0;
  top: 50%;
  color: black;
  width: 0;
  height: 0;
  border-top: 10px solid transparent;
  border-bottom: 10px solid transparent;
  border-right: 10px solid #333;
}

.card {
  box-shadow: 0.2rem 0.2rem 5px 0px grey;

  background-color: white;
  border: 1px solid black;
  border-radius: 5px;
  padding: 1rem;
}

.card h1 {
  margin-top: 0.4rem;
}

#user-details article {
  margin-bottom: 1rem;
}

#details {
  width: 60%;
  padding: 1rem;
  border: 1px solid black;
  border-radius: 4px;
  box-shadow: 0.2rem 0.2rem 5px 0px grey;
}

#maintenance-details input[type="submit"] {
  padding: 0.5rem 1rem;
  background-color: #007bff;
  color: rgb(255, 255, 255);
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

#maintenance-details input[type="submit"] {
  padding: 0.5rem 1rem;
  background-color: #007bff;
  color: rgb(255, 255, 255);
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

#user-details .landlord-name,
#user-details .tenant-name,
#user-details .maintenance-name {
  display: flex;
  align-items: center;
  margin-bottom: 0.5rem;
}

#user-details article {
  margin-bottom: 1rem;
}

#user-details h3 {
  font-size: 1rem;
  font-weight: bold;
  margin-bottom: 0.25rem;
}

#user-details h3 {
  font-size: 1rem;
  font-weight: bold;
  margin-bottom: 0.5rem;
}

#maintenance-details select {
  font-size: 1rem;
  padding: 0.3rem;
  gap: 0.5rem;
  margin-top: 0.5rem;
  margin-right: 0.5rem;
  margin-bottom: 0.5rem;
}

/* #details button {
  padding: 1rem;
  background-color: #007bff;
  color: rgb(255, 255, 255);
  border: none;
  border-radius: 1rem;
  cursor: pointer;
  margin-top: 1rem;
} */

#details button {
  padding: 0.5rem 1rem;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  margin-top: 1rem;
}

#maintenance-details h3 {
  margin-bottom: 0.8rem;
}

#maintenance-details input[type="submit"]:hover {
  background-color: #0069d9;
}

#maintenance-office {
  margin-top: 1rem;
}

#maintenance-office h3 {
  font-size: 1rem;
  font-weight: bold;
  margin-bottom: 0.8rem;
}
</style>