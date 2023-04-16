<template>
  <div>
    <div id="register" class="text-center">
      <div class="register-container">
        <form @submit.prevent="register">
          <img
            src="../assets/templatelogo.png"
            alt="Logo"
            class="registerlogo"
          />
          <h1>Create Account</h1>
          <p class="subheading">Start your journey!</p>
          <div role="alert" v-if="registrationErrors">
            {{ registrationErrorMsg }}
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
          <div class="form-input-group">
            <div class="input-label">
              <label for="confirmPassword">Confirm Password</label>
            </div>
            <input
              type="password"
              id="confirmPassword"
              v-model="user.confirmPassword"
              required
            />
          </div>
          <div class="form-input-group">
            <div class="input-label">
              <label for="phone">Phone</label>
            </div>
            <input type="tel" id="phone" v-model="user.phone" required />
          </div>
          <div class="form-input-group">
            <div class="input-label">
              <label for="first-name">First Name</label>
            </div>
            <input
              type="text"
              id="first-name"
              v-model="user.firstName"
              required
            />
          </div>
          <div class="form-input-group">
            <div class="input-label">
              <label for="last-name">Last Name</label>
            </div>
            <input
              type="text"
              id="last-name"
              v-model="user.lastName"
              required
            />
          </div>
          <div class="form-input-group">
            <div class="input-label">
              <!--DROPDOWN FOR TYPE-->
              <label for="type">User Type</label>
            </div>
            <select id="type" v-model="user.type" required>
              <option :value="'tenant'">Tenant</option>
              <option :value="'landlord'">Landlord</option>
              <option :value="'maintenance'">Maintenance</option>
            </select>
          </div>
          <button type="submit">Create Account</button>
          <p>
            <router-link :to="{ name: 'login' }"
              >Already have an account? Log in.</router-link
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
  name: "register",
  data() {
    return {
      user: {
        username: "",
        password: "",
        confirmPassword: "",
        role: "user",
        phone: "",
        firstName: "",
        lastName: "",
        type: "",
      },
      registrationErrors: false,
      registrationErrorMsg: "There were problems registering this user.",
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = "Password & Confirm Password do not match.";
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.login();
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = "Bad Request: Validation Errors";
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = "There were problems registering this user.";
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
  },
};
</script>

<style scoped>
#register {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  font-family: "Roboto", sans-serif;
  text-align: center;
  margin: 10rem 0;
}

.form-input-group {
  margin-bottom: 1rem;
  display: flex;
  flex-direction: column;
}

.input-label {
  margin-bottom: 0.5rem;
  margin-right: auto;
}

.register-container {
  /* border: 1px solid black; */
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  padding: 20px;
  background-color: white;
  box-shadow: 0.2rem 0.2rem 5px 0px grey;
  border-radius: 0.5em;
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
  font-size: 15px;
  margin-bottom: 30px;
}

.registerlogo {
  max-width: 20%;
  height: auto;
  border-radius: 20%;
  margin-left: 35px;
}
</style>
