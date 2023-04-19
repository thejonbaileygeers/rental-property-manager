<template>
  <div id="overview">
    <header id="title" class="card">
      <router-link :to="{ name: 'home' }">
        <i id="back" class="fa-solid fa-circle-chevron-left fa-2xl" />
      </router-link>
      <div>
        <h1 class="property-name">{{ property.name }}</h1>
        <h2 class="address">
          {{ property.streetAddress }}
          <span v-if="property.unit"
            >Unit #{{ property.unit }}, {{ property.city }},
            {{ property.state }} {{ property.zip }}</span
          >
        </h2>
      </div>
    </header>

    <div id="center">
      <img
        :src="property.imgUrl"
        onerror="this.onerror=null; this.src='https://www.hopkinsmedicine.org/sebin/o/i/noimageavailable.png'"
        class="card"
      />

      <article id="owner-details" class="card">
        <p>Contact for availability and pricing:</p>
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
      </article>
    </div>

    <div id="property-details">
      <article id="property-description" class="card">
        <h2>Details:</h2>
        <h3 class="info">
          <span
            >{{ property.bedrooms }}&nbsp;<i
              class="fa-solid fa-bed"
            />&nbsp;&nbsp;</span
          ><span
            >{{ property.bathrooms }}&nbsp;<i
              class="fa-solid fa-bath"
            />&nbsp;&nbsp;</span
          >
          <span>{{ property.squareFootage }} Sq Ft</span>
        </h3>
        <p class="description">{{ property.description }}</p>
      </article>
    </div>
  </div>
</template>

<script>
export default {
  props: ["property", "owner"],
  mounted() {
    let tag = document.createElement("script");
    tag.setAttribute("src", "https://kit.fontawesome.com/ae58b87c40.js");
    document.head.appendChild(tag);
  },
};
</script>

<style scoped>
img {
  max-width: 50vw;
  max-height: 800px;
  object-fit: scale-down;
  display: inline;
}

#back {
  color: black;
}

#owner-details {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 0.5em;
  width: 18em;
  min-height: 14em;
  border-radius: 2rem;
}

#owner-details p {
  margin: 0;
}

#owner-details i {
  color: #0087ff;
}
#property-details {
  display: flex;
  gap: 0.5em;
}

#center {
  display: flex;
  align-items: center;
  justify-content: space-evenly;
  gap: 0.5rem;
}

#property-description {
  flex: 1;
  padding: 0.5rem 2rem;
  border-radius: 2rem;
}

img {
  width: 100%;
  margin: 0.5em;
  margin-top: 0.75em;
  border-radius: 2rem;
}

#overview {
  margin: 0em;
  padding: 1rem 7rem;
  background-color: #e6e6e6;
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

#title {
  padding: 0.5rem 2rem;
  border-radius: 2rem;
  display: flex;
  align-items: center;
  justify-content: flex-start;
  gap: 2rem;
}

.address {
  font-weight: 500;
}

.card {
  /* Parameters: x-offset, y-offset, blur-radius, spread-radius, color */
  box-shadow: 0.2rem 0.2rem 5px 0px grey;
  background-color: white;
}
</style>