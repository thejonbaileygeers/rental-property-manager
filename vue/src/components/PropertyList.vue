<template>
  <div class="list">
    <div class="header">
      <div class="title">
        <h1>Embark on a <span>Quest</span> for Excellence</h1>
        <br />
        <p>Now serving multiple communities in the Queen City</p>
      </div>
      <img src="../assets/skyline-crop-3.jpg" alt="" />
    </div>
    <div id="black-bar" />
    <div class="card"><h2>Explore Rentals in Cincinnati, OH</h2></div>

    <div class="property-grid">
      <property-card
        v-for="property in this.$store.state.properties"
        :key="property.propertyId"
        :property="property"
      />
    </div>
  </div>
</template>

<script>
import PropertyCard from "./PropertyCard.vue";
export default {
  components: { PropertyCard },
};
</script>

<style scoped>
.property-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-gap: 20px;
  justify-items: center;
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
  background: rgba(0, 0, 0, 1);
}

.title span {
  font-style: italic;
}

#black-bar {
  height: 0.2rem;
  background-color: black;
}

h2 {
  text-align: center;
  margin: 0;
}

.card {
  box-shadow: 0.2rem 0.2rem 5px 0px grey;
  background-color: white;
  width: 25rem;
  border-radius: 2rem;
  margin: auto;
  padding: 0 2rem;
  justify-content: center;
  padding: 0.6rem 2rem;
  margin-top: 2rem;
}
</style>