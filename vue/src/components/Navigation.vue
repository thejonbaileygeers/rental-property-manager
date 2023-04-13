<template>
  <nav id="nav">
    <!--Left Side Of Nav-->
    <router-link id="home-link" v-bind:to="{ name: 'home' }"
      ><img src="../../src/assets/templatelogo.png" class="logo" />
    </router-link>

    <!--Right Side Of Nav-->
    <div id="right-nav">
      <router-link
        id="portal-link"
        :to="{ name: 'tenant-portal' }"
        v-show="isLoggedIn"
        ><span class="link">My Dashboard</span></router-link
      >

      <span class="divider" v-show="isLoggedIn">&nbsp;|&nbsp;</span>

      <router-link id="log-link" v-bind:to="getDestination()"
        ><span class="link">{{ getLoginText() }}</span></router-link
      >

      <span class="divider" v-show="!isLoggedIn">&nbsp;|&nbsp;</span>

      <router-link
        id="log-link"
        v-bind:to="{ name: 'register' }"
        v-show="!isLoggedIn"
        ><span class="link">Sign Up</span></router-link
      >
    </div>
  </nav>
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
  height: 5em;
  background-color: #000;
  font-family: futura-pt, sans-serif;
  position: relative;
  margin-bottom: 10px;
  gap: 0.5em;
}

#right-nav {
  display: flex;
  margin-left: auto;
  gap: 0.5em;
  margin-right: 0.5em;
}

.logo {
  margin-left: 10px;
  height: 100%;
  border-radius: 20%;
  height: 100%;
}

span {
  color: white;
  font-size: 0.9rem;
  font-weight: 600;
}

.link:hover {
  color: #0087ff;
  text-decoration: none;
}

#portal-link,
#home-link,
#log-link {
  text-decoration: none;
}

/* #nav button {
  margin: 0;
  background-color: #0087ff;
  height: 2em;
  width: 8em;
  color: white;
  border: none;
  border-radius: 10px;
  box-shadow: 0px 0px 2px 2px rgb(0, 0, 0);
} */

#home-link {
  height: 100%;
}
</style>