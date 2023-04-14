<template>
  <div>
    <div id="login">
      <div class="login-container">
        <form @submit.prevent="login">
          <img src="../assets/templatelogo.png" alt="Logo" class="loginlogo" />
          <h1>Login to your account</h1>
          <p class="subheading">
            Welcome back! Please enter your account information to login.
          </p>
          <div role="alert" v-if="invalidCredentials">
            Invalid username and password!
          </div>
          <div role="alert" v-if="this.$route.query.registration">
            Thank you for registering, please sign in.
          </div>
          <div class="form-input-group">
            <div class="input-label">
              <label for="username">Username</label>
            </div>
            <input
              type="text"
              id="username"
              v-model="user.username"
              required
              autofocus
            />
          </div>
          <div class="form-input-group">
            <div class="input-label">
              <label for="password">Password</label>
            </div>
            <input
              type="password"
              id="password"
              v-model="user.password"
              required
            />
          </div>
          <button type="submit">Sign in</button>
          <p>
            <router-link :to="{ name: 'register' }"
              >Need an account? Sign up.</router-link
            >
          </p>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: "",
      },
      invalidCredentials: false,
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then((response) => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push(this.getDestinationPage());
          }
        })
        .catch((error) => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    },
    getDestinationPage() {
      const userType = this.$store.state.user.type;
      let destination = "";
      switch (userType) {
        case "tenant":
          destination = "tenant-portal";
          break;
        case "landlord":
          destination = "landlord-portal";
          break;
        case "maintenance":
          destination = "maintenance-portal";
          break;
        default:
          destination = "/";
          break;
      }

      return destination;
    },
  },
};
</script>

<style scoped>
#login {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  font-family: "Roboto", sans-serif;
  text-align: center;
}

.form-input-group {
  margin-bottom: 1rem;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.login-container {
  /* border: 1px solid black; */
  /* box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); */
  padding: 20px;
  width: 30rem;
  background-color: white;
  box-shadow: 0.2rem 0.2rem 5px 0px grey;
  border-radius: 0.5rem;
}

.input-label {
  padding-left: 6px;
}

label {
  margin-right: 6.5rem;
}

h1 {
  text-align: center;
  font: 36px;
  margin-bottom: 20px;
}

.subheading {
  text-align: center;
  font-size: 10px;
  margin-bottom: 30px;
}

.loginlogo {
  max-width: 6rem;
  height: auto;
  border-radius: 20%;
  display: block;
  margin: auto;
}

button {
  display: block;
  margin: auto;
}

p {
  text-align: center;
}
</style>