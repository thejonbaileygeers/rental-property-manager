<template>
  <div>
    <div class="#overall">
      <div id="add-maintenance-container">
        <form @submit.prevent="createrequest" id="maintenance-request-form">
          <div class="input-label">
            <label for="title">Title</label>
          </div>
          <input type="text" id="title" v-model="request.title" required />
          <div class="input-label">
            <label for="desc">Description</label>
          </div>
          <textarea id="desc" v-model="request.description" required />

          <div class="options-container">
            <div class="input-label">
              <label for="priority">Priority</label>
            </div>
            <select id="priority" v-model="request.priority" required>
              <option :value="'urgent'">urgent</option>
              <option :value="'medium'">medium</option>
              <option :value="'low'">low</option>
            </select>
            <div class="input-label">
              <label for="repeat">Repeat issue</label>
            </div>
            <input type="checkbox" id="repeat" v-model="request.repeatissue" />

          </div>

          <div class="buttons-container">
            <router-link :to="{ name: 'tenant-portal' }" id="cancel-btn">
              <button>Cancel</button>
            </router-link>
            <button type="submit" id="create-request">SUBMIT</button>
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

label {
  line-height: 
}

<style>
#overall {
  display: flex;
  justify-content: center;
  align-items: center;
  font-family: "Roboto", Sans-serif;
  height: 100%;
}

label {
  font-weight: 700;
}

input, select, textarea {
  border: solid 2px black;
  border-radius: 0.5em;
}



#add-maintenance-container {
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  margin: auto;
  padding: 20px;
  background-color: white;
  box-shadow: 0.2rem 0.2rem 5px 0px grey;
  border-radius: 0.5em;
  max-width: 700px;
  height: 100%;

}

#add-maintenance-container > div {
  margin-top: 0.5em;
}

#maintenance-request-form {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-content: center;
  width: 70%;
  margin: auto;

}

textarea {
  width: 99%;
  height: 8em;
  resize: none;
}


.buttons-container * {
  width: 100%;
}


.input-label {
  margin-top: 1em;
}

.buttons-container {
  display: flex;
  flex-direction: row;
  justify-content: right;
}

#cancel-btn {
  width: 25%;
}

#create-request {
  width: 25%;
}

</style>