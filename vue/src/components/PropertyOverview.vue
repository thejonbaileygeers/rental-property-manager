<template>
  <div id="overview">
    <h1 class="property-name">{{ property.name }}</h1>
    <h2 class="address">
      {{ property.streetAddress }}
      <span v-if="property.unit"
        >Unit #{{ property.unit }}, {{ property.state }}
        {{ property.zip }}</span
      >
    </h2>

    <img :src="property.imgUrl" />

    <div id="property-details">
      <div id="property-description">
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
      </div>

      <div id="owner-details">
        <p>Contact for availability and pricing:</p>
        <div class="owner-name">
          <i class="fa-solid fa-user"></i>&nbsp;&nbsp;{{ owner.firstName }}
          {{ owner.lastName }}
        </div>
        <div class="owner-contact-info">
          <i class="fa-solid fa-phone"></i>&nbsp;&nbsp;{{ owner.phone }}
        </div>
      </div>
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
#owner-details {
  border: black 1px solid;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 0.5em;
  width: 18em;
}

#owner-details p {
  margin: 0px;
}

#property-details {
  display: flex;
  gap: 0.5em;
  margin-top: 0.5em;
}

#property-description {
  flex: 1;
  border: black 1px solid;
}

img {
  width: 100%;
}

#overview {
  margin: 1em;
}
</style>