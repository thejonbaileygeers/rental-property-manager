<template>
  <form>
    <!-- // city, state, unit, zip, bathrooms, bedrooms, sqFootage, OwnerId, propertyName, description, ImgUrl -->
    <div class="addPropertyForm">
      <label for="city">city</label>
      <input
        type="text"
        name=""
        id=""
        value="enter info"
        v-model="property.city"
      >

      <label for="state">state</label>
      <input
        type="text"
        name=""
        id=""
        value="enter info"
        v-model="property.state"
      >

      <label for="unit">unit</label>
      <input
        type="text"
        name=""
        id=""
        value="enter info"
        v-model="property.unit"
      >

      <label for="zip">zip</label>
      <input
        type="text"
        name=""
        id=""
        value="enter info"
        v-model="property.zip"
      >

      <label for="bathrooms">bathrooms</label>
      <input
        type="text"
        name=""
        id=""
        value="enter info"
        v-model="property.bathrooms"
      >

      <label for="bedrooms">bedrooms</label>
      <input
        type="text"
        name=""
        id=""
        value="enter info"
        v-model="property.bedrooms"
      >

      <label for="sqFootage">Square Footage</label>
      <input
        type="text"
        name=""
        id=""
        value="enter info"
        v-model="property.sqFootage"
      >

      <label for="propertyName">Property Name</label>
      <input
        type="text"
        name=""
        id=""
        value="enter info"
        v-model="property.name"
      >

      <label for="streetAddress">Street Address</label>
      <input
        type="text"
        name=""
        id=""
        value="enter info"
        v-model="property.streetAddress"
      >

      <label for="description">Description</label>
      <input
        type="text"
        name=""
        id=""
        value="enter info"
        v-model="property.description"
      >
      <button @click.prevent="submitForm()">Submit</button>
    </div>
  </form>
</template>
        <!-- // city, state, unit, zip, bathrooms, bedrooms, sqFootage, OwnerId, propertyName, description, ImgUrl -->

<script>
import propertyService from "../services/PropertyService";
export default {
  name: "add-property-form",
  data() {
    return {
      property: {
        name: "",
        streetAddress: "",
        propertyId: 0,
        city: "",
        state: "",
        unit: "",
        zip: "",
        bathrooms: "",
        bedrooms: "",
        sqFootage: "",
        ownerId: this.$store.state.user.id,
        description: "",
        imgUrl: "",
      },
    };
  },
  methods: {
    submitForm() {
      const newProperty = {
        propertyId: this.property.propertyId,
        name: this.property.name,
        streetAddress: this.property.streetAddress,
        ownerId: this.$store.state.user.id,
        city: this.property.city,
        state: this.property.state,
        unit: this.property.unit,
        zip: this.property.zip,
        bathrooms: this.property.bathrooms,
        bedrooms: this.property.bedrooms,
        sqFootage: this.property.sqFootage,
        description: this.property.description,
        imgUrl: this.property.imgUrl,
      };

      if (newProperty.propertyId === 0) {
        propertyService
          .addProperty(newProperty)
          .then((response) => {
            console.log('it tried to add');
            if (response.status === 201 || response.status === 200) {
              this.$router.push(`/property/${newProperty.id}`);
            }
          })
          .catch((error) => {
            console.log("it messed up", error);
          });
      }
    },
    // handleErrorResponse(error, verb) {
    //   if (error.response) {
    //     this.errorMsg = `Error ${verb} property. Response received: ${error.response.statusText}`;
    //   } 
      // else if (error.request) {
      //   this.errorMsg = `Error ${verb} property. Server could not be reached`;
      // } 
      // else {
      //   this.errorMsg = `Error ${verb} property. Request could not be created`;
      // }
    // },
  },
};
</script>

<style>
</style>