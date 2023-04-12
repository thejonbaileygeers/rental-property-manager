<template>
  <div id="nav">
    <img src="../../src/assets/templatelogo.png" class="logo" />
    <router-link id="home-link" v-bind:to="{ name: 'home' }" v-show="!isHome"
      ><button>Home</button></router-link
    >
    <router-link
      id="portal-link"
      :to="{ name: 'tenant-portal' }"
      v-show="!isPortal && isLoggedIn"
      ><button>My Dashboard</button></router-link
    >
    <router-link
      id="log-link"
      v-bind:to="{ name: 'logout' }"
      v-show="!isLogPage"
      ><button>{{ getLoginText() }}</button></router-link
    >
  </div>
</template>

<script>
export default {
  data() {
    return {};
  },
  computed: {
    isLoggedIn() {
      //Logged out user does not have a token
      return this.$store.state.token != "";
    },
    isHome() {
      return this.$route.name == "home";
    },
    isPortal() {
      return (
        this.$route.name == "tenant-portal" ||
        this.$route.name == "landlord-portal" ||
        this.$route.name == "maintenance-portal"
      );
    },
    isLogPage() {
      return this.$route.name == "login" || this.$route.name == "logout";
    },
  },
  methods: {
    getLoginText() {
      return this.isLoggedIn ? "Logout" : "Login";
    },
    getDestination() {
      return this.isLoggedIn ? { name: "logout" } : { name: "login" };
    },
  },
};
</script>

<style scoped>
#nav {
  display: flex;
  justify-content: flex-start;
  align-items: center;
  min-height: 8vh;
  height: 100%;
  background-color: #002f69;
  font-family: "Roboto";
  position: relative;
  margin-bottom: 10px;
  gap: 0.5em;
}

.logo {
  margin-left: 10px;
  max-width: 5%;
  height: auto;
  border-radius: 20%;
}

#nav button {
  margin: 0;
  background-color: #0087ff;
  height: 2em;
  width: 8em;
  color: white;
  border: none;
  border-radius: 10px;
  box-shadow: 0px 0px 2px 2px rgb(0, 0, 0);
}

#log-link {
  margin-right: 1.5em;
}

#portal-link {
  margin-left: auto;
}
</style>