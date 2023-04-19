<template>
  <div>
    <div id="form-container">
      <div id="lease-details-form">

        <div id="logo-container">
          <img src="../assets/templatelogo.png" alt="Logo" class="registerlogo" />

          <h1>Lease Details</h1>
        </div>
        <form @submit.prevent="newLease ? createLease() : deleteLease()">
          <div class="form-top">
            <div class="input-label">
              <label for="tenant">Tenant</label>
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
            </div>
            <div class="input-label">
              <label for="start">Start Date</label>
              <input type="date" id="start" v-model="lease.startDate" :disabled="newLease == false" required />
            </div>
            <div class="input-label">
              <label for="date">End Date</label>
              <input type="date" id="date" v-model="lease.endDate" :disabled="newLease == false" required />
            </div>
            <div class="input-label">
              <label for="rent">Rent Price</label>
              <input type="money" id="rent" v-model="lease.rentAmount" :disabled="newLease == false" required />
            </div>
          </div>

          <div class="buttons-container">
            <router-link id="cancel-container" :to="{ name: 'landlord-portal' }">
              <button>Cancel</button>
            </router-link>
            <button type="submit">{{ buttonText }}</button>

          </div>
        </form>
      </div>
    </div>
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
      if (!confirm("Create new lease?")) {
        return;
      }
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
      this.$router.push({ name: "landlord-portal" });
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

<style scoped>
#form-container {
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  margin: auto;
  background-color: white;
  box-shadow: 0.2rem 0.2rem 5px 0px grey;
  border-radius: 0.5em;
  margin-top: 200px;
  height: 70vh;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 30em;
}

#form-container {
  height: 25em;
}

#lease-details-form {
  display: flex;
  flex-direction: column;
  width: 90%;
}

select {
  height: 1.7em;
}

form {
  display: flex;
  flex-direction: column;
  align-items: center;
}

input[type="money"] {
  height: 1rem;
}

label {
  font-weight: 700;
}

.input-label {
  display: flex;
  flex-direction: column;
  margin-top: 2em;
}

#form-container {
  height: 40em; 
}

.form-top {
  display: flex;
  flex-direction: column;
  width: 50%;
  justify-content: space-around;
}

.buttons-container {
  display: flex;
  width: 100%;
  justify-content: center;
  margin-top: 2em;
}

#cancel-container {
  margin-right: 1em;
}

#logo-container {
  display: flex;
  align-items: center;
  flex-direction: column;
}

.registerlogo {
  display: flex;
  /* max-width: 20%; */
  height: auto;
  border-radius: 20%;
  width: 80px;
}
</style>
