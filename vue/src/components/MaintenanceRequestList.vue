<template>
  <div>
    <router-link
      v-if="userRole != 'maintenance'"
      :to="{ name: 'maintenance-request' }"
    >
      <button>Make New Request</button>
    </router-link>
    <table>
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

<style>
</style>