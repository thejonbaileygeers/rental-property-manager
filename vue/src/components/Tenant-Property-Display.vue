<template>
  <div>
    <div class="card">
      <img :src="property.imgUrl" />
      <div class="text">
        <h2 id="name">{{ property.name }}</h2>
        <span id="address"
          >{{ property.streetAddress }}, {{ property.city }},
          {{ property.state }} {{ property.zip }}</span
        >
        <p>
          <span
            >{{ property.bedrooms }} &nbsp;<i class="fa-solid fa-bed" /></span
          ><span
            >{{ property.bathrooms }} &nbsp;<i class="fa-solid fa-bath"
          /></span>
          <span>{{ property.squareFootage }} Sq Ft</span>
        </p>

        <div id="owner-info">
          <h3>Owner Contact Info:</h3>
          <div class="owner-name">
            <i class="fa-solid fa-user"></i>&nbsp;&nbsp;
            <span class="owner-info"
              >{{ owner.firstName }} {{ owner.lastName }}</span
            >
          </div>
          <div class="owner-contact-info">
            <i class="fa-solid fa-phone"></i>&nbsp;&nbsp;<span
              class="owner-info"
              >{{ owner.phone }}</span
            >
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["property"],
  computed: {
    owner() {
      return this.$store.state.users.find((ele) => {
        return ele.id == this.property.ownerId;
      });
    },
  },
  mounted() {
    let tag = document.createElement("script");
    tag.setAttribute("src", "https://kit.fontawesome.com/ae58b87c40.js");
    document.head.appendChild(tag);
  },
};
</script>

<style scoped>
.card {
  display: inline-block;
  width: 100%;
  height: 100%;
  margin-bottom: 20px;
  box-shadow: 0.2rem 0.2rem 5px 0px grey;
  border-radius: 2rem;
  overflow: hidden;
  font-size: 20px;
  transition: all 0.1s cubic-bezier(0, 0, 0.5, 1);
  background-color: white;
}

.card img {
  width: 100%;
  height: 150px;
  object-fit: cover;
}

.card:hover {
  transform: scale(1.05);
  transition: all 0.3s cubic-bezier(0, 0, 0.5, 1);
}

.card #name,
.card #address {
  display: block;
  text-align: left;
  margin: 10px 0;
}

.card #name {
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

.card h2,
.card span {
  margin: 0;
}

/* Spacing and alignment of the bed/bath/sqft */
.card p {
  margin-bottom: 0;
  text-align: left;
  justify-content: space-between;
}

/* Spacing between bed/bath/sqft */
.card p span {
  margin-right: 10px;
}

.text {
  padding: 0 1.2em;
  padding-bottom: 1em;
}

#owner-info i {
  color: #0087ff;
}
</style>