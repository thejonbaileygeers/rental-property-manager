<template>
  <div
    class="property-card"
    @click="
      $router.push({ name: 'property', params: { id: property.propertyId } })
    "
  >
    <img
      :src="property.imgUrl"
      onerror="this.onerror=null; this.src='https://www.hopkinsmedicine.org/sebin/o/i/noimageavailable.png'"
    />
    <div class="text">
      <h2 id="name">{{ property.name }}</h2>
      <span id="address"
        >{{ property.streetAddress }}, {{ property.city }},
        {{ property.state }} {{ property.zip }}</span
      >
      <p>
        <span>{{ property.bedrooms }} &nbsp;<i class="fa-solid fa-bed" /></span
        ><span
          >{{ property.bathrooms }} &nbsp;<i class="fa-solid fa-bath"
        /></span>
        <span>{{ property.squareFootage }} Sq Ft</span>
      </p>
    </div>
  </div>
</template>

<script>
export default {
  props: ["property"],
  mounted() {
    let tag = document.createElement("script");
    tag.setAttribute("src", "https://kit.fontawesome.com/ae58b87c40.js");
    document.head.appendChild(tag);
  },
};
</script>

<style scoped>
.property-card {
  display: inline-block;
  width: 100%;
  max-width: 400px;
  height: 100%;
  margin-bottom: 20px;
  box-shadow: 0.2rem 0.2rem 5px 0px grey;
  border-radius: 2rem;
  overflow: hidden;
  font-size: 20px;
  transition: all 0.1s cubic-bezier(0, 0, 0.5, 1);
  background-color: white;
}

.property-card img {
  width: 100%;
  height: 150px;
  object-fit: cover;
}

.property-card:hover {
  transform: scale(1.05);
  transition: all 0.3s cubic-bezier(0, 0, 0.5, 1);
}

.property-card #name,
.property-card #address {
  display: block;
  text-align: left;
  margin: 10px 0;
}

.property-card #name {
  text-align: left;
}

.property .text {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100%;
  padding: 10px;
}

.property-card h2,
.property-card span {
  margin: 0;
}

/* Spacing and alignment of the bed/bath/sqft */
.property-card p {
  margin-bottom: 0;
  text-align: left;
  justify-content: space-between;
}

/* Spacing between bed/bath/sqft */
.property-card p span {
  margin-right: 10px;
}

.text {
  padding: 0 1.2em;
}
</style>