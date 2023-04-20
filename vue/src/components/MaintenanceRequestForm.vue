<template>
  <div>
    <div id="request-maintenance" class="text-center">
      <div id="add-maintenance-container">
        <form @submit.prevent="createRequest" id="maintenance-request-form">
          <div id="logo-container">
            <img
              src="../assets/templatelogo.png"
              alt="Logo"
              class="registerlogo"
            />
          </div>
          <h1>New Maintenance Request</h1>
          <p class="subheading">Help is on the way!</p>
          <div class="form-input-group">
            <div class="input-label">
              <label for="title">Title</label>
            </div>
            <input type="text" id="title" v-model="request.title" required />
          </div>
          <div class="form-input-group">
            <div class="input-label">
              <label for="desc">Description</label>
            </div>
            <textarea id="desc" v-model="request.description" required />
          </div>
          <div class="form-input-group">
            <div class="input-label">
              <label for="priority">Priority</label>
            </div>
            <select id="priority" v-model="request.priority" required>
              <option :value="'urgent'">urgent</option>
              <option :value="'medium'">medium</option>
              <option :value="'low'">low</option>
            </select>
          </div>
          <div class="form-input-group">
            <div class="input-label">
              <label for="repeat">Repeat issue</label>
            </div>
            <input type="checkbox" id="repeat" v-model="request.repeatissue" />
          </div>
          <div id="button-container">
            <router-link :to="{ name: 'tenant-portal' }" id="cancel-btn">
              <button>Cancel</button>
            </router-link>
            <button type="submit" id="create-request">Submit</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import MaintRequestService from "../services/MaintRequestService";

export default {
  data() {
    return {
      request: {
        title: "",
        description: "",
        priority: "",
        repeatIssue: false,
      },
    };
  },
  methods: {
    createRequest() {
      MaintRequestService.create(this.request)
        .then((response) => {
          this.$store.commit("ADD_REQUEST", response.data);
          this.$router.push({ name: "tenant-portal" });
        })
        .catch((error) => {
          //Todo: Add proper error handling
          console.log(error);
        });
    },
  },
  props: ["propertyId"],
  created() {
    this.request.propertyId = this.propertyId;
  },
};
</script>


<style scoped>
#request-maintenance {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  font-family: "Roboto", sans-serif;
  text-align: center;
  margin: 10rem 0;
}

#add-maintenance-container {
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  padding: 20px;
  background-color: white;
  box-shadow: 0.2rem 0.2rem 5px 0px grey;
  border-radius: 0.5em;
  width: 30rem;
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
  display: flex;
  max-width: 20%;
  height: auto;
  border-radius: 20%;
}

textarea {
  width: 99%;
  height: 8em;
  resize: none;
}

#logo-container {
  display: flex;
  justify-content: center;
}

.registerlogo {
  display: flex;
  max-width: 20%;
  height: auto;
  border-radius: 20%;
}

.options-container {
  display: flex;
  flex-direction: column;
  align-self: flex-start;
  align-items: flex-start;
  width: 25%;
}

#repeat {
  align-self: flex-start;
}

#button-container {
  display: flex;
  justify-content: center;
  gap: 1rem;
}

button {
  width: 100px;
}
</style>
