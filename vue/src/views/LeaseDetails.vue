<template>
  <div>
    <form @submit.prevent="deleteLease">
      <div class="input-label">
        <label for="tenant">Tenant</label>
      </div>
      <select v-model="lease.tenantId" :disabled="newLease == false">
        <option v-if="currentTenant" :value="currentTenant.id">
          {{ currentTenant.firstName }} {{ currentTenant.lastName }} ({{
            currentTenant.username
          }})
        </option>
        <option v-for="user in freeUsers" :key="user.id" :value="user.id">
          {{ user.firstName }} {{ user.lastName }} ({{ user.username }})
        </option>
      </select>
      <div class="input-label">
        <label for="start">Start Date</label>
      </div>
      <input type="date" id="start" v-model="lease.startDate" />
      <div class="input-label">
        <label for="date">End Date</label>
      </div>
      <input type="date" id="date" v-model="lease.endDate" />
      <div class="input-label">
        <label for="rent">Rent Price</label>
      </div>
      <input type="money" id="rent" v-model="lease.rentAmount" />
      <input type="submit" value="KILL LEASE" />
    </form>
  </div>
</template>

<script>
import LeaseService from "../services/LeaseService";

export default {
  data() {
    return {
      lease: {},
      newLease: false,
      propertyId: -1,
    };
  },
  created() {
    this.propertyId = parseInt(this.$route.params.id);
    let currentLease = this.$store.state.leases.find((ls) => {
      return ls.propertyId == this.propertyId;
    });
    if (currentLease) {
      this.lease = currentLease;
    } else {
      this.newLease = true;
    }

    this.lease.propertyId = this.propertyId;
  },
  methods: {
    createLease() {
      LeaseService.createLease(this.lease);
    },
    deleteLease() {
      LeaseService.deleteLease(this.lease.leaseId)
        .then((response) => {
          if (response.status) {
            this.$store.commit("DELETE_LEASE", this.lease.propertyId);
            this.newLease = true;
            this.lease = { propertyId: this.propertyId };
          }
        })
        .catch((error) => {
          //Todo: Appropriate Error Handling
          console.log(error);
        });
    },
  },
  computed: {
    freeUsers() {
      const leasedUserIds = this.$store.state.leases.map((ls) => {
        return ls.tenantId;
      });

      return this.$store.state.users.filter((user) => {
        return user.type == "tenant" && !leasedUserIds.includes(user.id);
      });
    },
    currentTenant() {
      return this.$store.state.users.find((usr) => {
        return usr.id == this.lease.tenantId;
      });
    },
  },
};
</script>

<style>
</style>