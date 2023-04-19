<template>
  <div>
    <div class="maintenance-request-container">
      <div id="header">
        <h1 class="maintenance-request-title">Maintenance Requests</h1>
        <router-link
          v-if="userRole != 'maintenance'"
          :to="{ name: 'maintenance-request' }"
        >
          <button class="new-request-button">Make New Request</button>
        </router-link>
      </div>
      <h2 v-if="requests.length == 0" id="none">
        There are no requests to display
      </h2>
      <table v-if="requests.length > 0" class="maintenance-request-table">
        <thead>
          <tr>
            <th>ID</th>
            <th>Title</th>
            <th v-if="userRole != 'tenant'">Address</th>
            <th>Date Opened</th>
            <th>Priority</th>
            <th v-if="userRole == 'landlord'">Repeat Issue</th>
            <th>Status</th>
            <th>Date Complete</th>
            <th></th>
          </tr>
        </thead>
        <tr v-for="request in requests" :key="request.requestId">
          <td>{{ request.requestId }}</td>
          <td>{{ request.title }}</td>
          <td v-if="userRole != 'tenant'">
            {{ requestProperty(request).streetAddress }}, Unit #
            {{ requestProperty(request).unit }},
            {{ requestProperty(request).city }},
            {{ requestProperty(request).state }}
            {{ requestProperty(request).zip }}
          </td>
          <td>{{ request.dateRequested }}</td>
          <td>{{ request.priority }}</td>
          <td v-if="userRole == 'landlord'">{{ request.repeatIssue }}</td>
          <td>{{ request.status }}</td>
          <td>{{ dateCompletedText(request) }}</td>
          <td>
            <router-link
              :to="{
                name: 'maintenance-request-details',
                params: { id: request.requestId },
              }"
              ><button>View Details</button></router-link
            >
          </td>
        </tr>
      </table>
      <div id="padder" v-if="requests.length > 0" />
      <div id="nothing-padder" v-if="requests.length == 0" />
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      requests: [],
    };
  },
  computed: {
    userRole() {
      return this.$store.state.user.type;
    },
  },
  methods: {
    dateCompletedText(req) {
      return req.dateCompleted ? req.dateCompleted : "N/A";
    },
    requestProperty(request) {
      return this.$store.state.properties.filter((prop) => {
        return prop.propertyId == request.propertyId;
      })[0];
    },
    tenantRequests(allRequests) {
      let propertyId = this.$store.state.leases.filter((lease) => {
        return lease.tenantId == this.$store.state.user.id;
      })[0].propertyId;

      console.log(propertyId);

      return allRequests.filter((req) => {
        return req.propertyId == propertyId;
      });
    },
    landlordRequests(allRequests) {
      let landlordProps = this.$store.state.properties.filter((prop) => {
        return prop.ownerId == this.$store.state.user.id;
      });
      let propIds = landlordProps.map((prop) => {
        return prop.propertyId;
      });
      return allRequests.filter((req) => {
        return propIds.includes(req.propertyId);
      });
    },
    workerRequests(allRequests) {
      return allRequests.filter((req) => {
        return req.maintenanceId == this.$store.state.user.id;
      });
    },
  },
  created() {
    let allRequests = this.$store.state.requests;
    if (this.userRole == "tenant") {
      this.requests = this.tenantRequests(allRequests);
    } else if (this.userRole == "landlord") {
      this.requests = this.landlordRequests(allRequests);
    } else if (this.userRole == "maintenance") {
      this.requests = this.workerRequests(allRequests);
    }
  },
};
</script>

<style scoped>
.maintenance-request-container {
  text-align: center;
  background-color: #f8f9fa; /* set background color for container */
  box-shadow: 0.2rem 0.2rem 5px 0px grey;
  border-radius: 2rem;
}

#header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin: auto;
  padding: 0;
  width: 100%;
}

#header button {
  margin-right: 1rem;
  margin-bottom: 0.5rem;
}

.maintenance-request-title {
  font-weight: bold;
  margin-bottom: 1rem;
  display: inline-block;
  margin: 1rem 1.5rem;
  font-size: 1.8rem;
}

h2 {
  text-align: left;
  margin-left: 1.5rem;
}

.new-request-button {
  padding: 6px 12px;
  border-radius: 4px;
  border: none;
  background-color: #007bff;
  color: #fff;
  cursor: pointer;
  float: right; /* align the button to the right */
  margin-top: 0.3rem; /* adjust margin-top to align with the top of the table */
}

.maintenance-request-table {
  border-collapse: collapse;
  margin-left: 0.5rem;
  margin-right: 0.5rem;
  background-color: #fff; /* set background color for table */
}

.maintenance-request-table th,
.maintenance-request-table td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

.maintenance-request-table th {
  background-color: #f2f2f2;
  color: #333;
  font-weight: bold;
}

.maintenance-request-table tr:hover {
  background-color: #f5f5f5;
}

.maintenance-request-table td:first-child {
  width: 10%;
}

.maintenance-request-table td:nth-child(2) {
  width: 20%;
}

.maintenance-request-table td:nth-child(3) {
  width: 30%;
}

.maintenance-request-table td:nth-child(4) {
  width: 10%;
}

.maintenance-request-table td:nth-child(5) {
  width: 10%;
}

.maintenance-request-table td:nth-child(6) {
  width: 10%;
}

.maintenance-request-table td:nth-child(7) {
  width: 10%;
}

.maintenance-request-table td:last-child {
  width: 10%;
  text-align: center;
}

button {
  padding: 6px 12px;
  border-radius: 4px;
  border: none;
  background-color: #007bff;
  color: #fff;
  cursor: pointer;
}

button:hover {
  background-color: #0069d9;
}

#padder {
  height: 2rem;
}

#nothing-padder {
  height: 0.1rem;
}
</style>