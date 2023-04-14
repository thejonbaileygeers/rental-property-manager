<template>
  <div>
    <form @submit.prevent="createRequest">
      <div class="input-label">
        <label for="title">Title</label>
      </div>
      <input type="text" id="title" v-model="request.title" required />
      <div class="input-label">
        <label for="desc">Description</label>
      </div>
      <textarea id="desc" v-model="request.description" required />
      <div class="input-label">
        <label for="priority">Priority</label>
      </div>
      <select id="priority" v-model="request.priority" required>
        <option :value="'urgent'">Urgent</option>
        <option :value="'medium'">Medium</option>
        <option :value="'low'">Low</option>
      </select>
      <div class="input-label">
        <label for="repeat">Repeat Issue</label>
      </div>
      <input
        type="checkbox"
        id="repeat"
        v-model="request.repeatIssue"
        required
      />
      <router-link :to="{ name: 'tenant-portal' }">
        <button>Cancel</button>
      </router-link>
      <button type="submit">Create Request</button>
    </form>
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

<style>
</style>