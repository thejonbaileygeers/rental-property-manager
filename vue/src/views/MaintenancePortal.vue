<template>
  <div>
    <div class="header">
      <img src="../assets/skyline-crop-3.jpg" alt="Skyline" />
      <div class="title">
        <h1>
          Welcome,
          <span
            >{{ this.$store.state.user.firstName }}
            {{ this.$store.state.user.lastName }}</span
          >!
        </h1>
        <br />
        <p>View your assigned maintenance requests</p>
      </div>
    </div>
    <div id="black-bar" />
    <div id="content">
      <maintenance-request-list />
    </div>
  </div>
</template>

<script>
import MaintenanceRequestList from "../components/MaintenanceRequestList.vue";

export default {
  components: { MaintenanceRequestList },
};
</script>

<style scoped>
#content {
  display: grid;
  height: 100%;
  grid-template-columns: 1fr;
  gap: 2rem;
  padding: 0 1rem;
}

#black-bar {
  height: 0.2rem;
  background-color: black;
  margin-bottom: 1rem;
}

.content {
  display: flex;
  align-items: flex-start;
  justify-content: space-evenly;
  gap: 2rem;
  padding: 2rem 7rem;
}

.header h1,
.header p {
  color: white;
  text-align: center;
  align-content: center;
  font-weight: 500;
  text-shadow: 1px 1px 10px black;
}

.placeholder {
  color: white;
  text-align: center;
  align-content: center;
  font-weight: 500;
  text-shadow: 1px 1px 10px black;
}

.header h1 {
  font-size: 2.8rem;
}

.header p {
  font-size: 1.5rem;
}

.title {
  position: absolute;
  top: 9rem;
  left: 50%;
  transform: translate(-50%, 0%);
  width: 100%;
}

.header {
  height: 20rem;
  overflow: hidden;
}

img {
  max-width: 100%;
  display: block;
  height: auto;
}

.title span {
  font-style: italic;
}
</style>