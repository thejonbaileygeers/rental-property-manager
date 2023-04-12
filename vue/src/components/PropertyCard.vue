<template>
  <div class="property-card" @click="$router.push({ name: 'property', params: { id: property.propertyId } })">
    <img :src="property.imgUrl" />
    <div class="text">
      <h2 id="name">{{ property.name }}</h2>
      <span id="address">{{ property.streetAddress }}</span>
      <p>
        <span>{{ property.bedrooms }}</span
        ><span>{{ property.bathrooms }}</span>
        <span>{{ property.squareFootage }}</span>
      </p>
    </div>
  </div>
</template>

<script>
export default {
  props: ["property"],
};
</script>

<style>
.property-card {
  display: inline-block;
  width: 100%;
  max-width: 400px;
  margin-bottom: 20px;
  margin-right: 20px;
  border: 2px solid #ccc;
  border-radius: 5px;
  overflow: hidden;
  font-size: 14px;
}

.property-card:last-child,
.property-card:nth-child(3n) {
  margin-right: 0;
}

.property-card img{
  width: 100%;
  height: 150px;
  object-fit: cover;
}

.property-card #name,
.property-card #address {
  display: block;
  text-align: center;
  margin: 10px 0;
}

.property-card #name {
  text-align: center;
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

/* Spacing  */
.property-card p {
  margin-bottom: 10px 0;
  text-align: center;
  justify-content: space-between;
}
 

 /* Spacing between bed/bath/sqft */
.property-card p span {
  margin: 0 15px;
}
</style>