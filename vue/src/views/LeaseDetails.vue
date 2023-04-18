<template>
  <div>
    <router-link :to="{ name: 'home' }">
      <i id="back" class="fa-solid fa-circle-chevron-left fa-2xl" />
    </router-link>
    <form @submit.prevent="newLease ? createLease() : deleteLease()">
      <div class="input-label">
        <label for="tenant">Tenant</label>
      </div>
      <select v-model="lease.tenantId" :disabled="newLease == false" required>
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
      <input
        type="date"
        id="start"
        v-model="lease.startDate"
        :disabled="newLease == false"
        required
      />
      <div class="input-label">
        <label for="date">End Date</label>
      </div>
      <input
        type="date"
        id="date"
        v-model="lease.endDate"
        :disabled="newLease == false"
        required
      />
      <div class="input-label">
        <label for="rent">Rent Price</label>
      </div>
      <input
        type="money"
        id="rent"
        v-model="lease.rentAmount"
        :disabled="newLease == false"
        required
      />
      <input type="submit" :value="buttonText" />
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
      LeaseService.createLease(this.lease)
        .then((response) => {
          if (response.status) {
            this.$store.commit("CREATE_LEASE", response.data);
            this.newLease = false;
          }
        })
        .catch((error) => {
          //Todo: Appropriate Error Handling
          console.log(error);
        });
    },
    deleteLease() {
      if (
        !confirm(
          "Are you sure you would like to deactivate this lease? This action cannot be undone."
        )
      ) {
        return;
      }
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
    buttonText() {
      return this.newLease ? "Create New Lease" : "Deactivate Lease";
    },
  },
  mounted() {
    let tag = document.createElement("script");
    tag.setAttribute("src", "https://kit.fontawesome.com/ae58b87c40.js");
    document.head.appendChild(tag);
  },
};
</script>

<style>
</style>