<template>
  <div id="overall" class="text-center">


    <form @submit.prevent="submitForm()">



      <div class="addPropertyContainer">

        <div v-if="errors.length > 0" id="error-container">
          <ul>
            <li v-for="(error, index) in errors" :key="index">{{ error }}</li>
          </ul>
        </div>

        <div class="addPropertyForm">
          <div id="propertyNameContainer">
            <div id="propertyNameItem">
              <label for="propertyName">Property Name</label>
              <input type="text" name="" id="" value="enter info" v-model="property.name" placeholder="Name">
            </div>

            <div class="featuresContainer">
              <div id="sqFootageContainer">
                <label for="sqFootage">ft 2</label>
                <input type="text" name="" id="" value="enter info" v-model="property.squareFootage">
              </div>

              <div id="bedroomsContainer">
                <label for="bedrooms">Bed</label>
                <select id="bedrooms" class="selectbox" v-model="property.bedrooms" required>
                  <option :value="'1'">1</option>
                  <option :value="'2'">2</option>
                  <option :value="'3'">3</option>
                  <option :value="'4'">4</option>
                  <option :value="'5'">5</option>
                  <option :value="'6'">6</option>
                  <option :value="'7'">7</option>
                  <option :value="'8'">8</option>
                  <option :value="'9'">9</option>
                </select>
              </div>
              <div id="bathroomsContainer">
                <label for="bathrooms">Bath</label>
                <select id="bathrooms" class="selectbox" v-model="property.bathrooms" required>
                  <option :value="'1'">1</option>
                  <option :value="'2'">2</option>
                  <option :value="'3'">3</option>
                  <option :value="'4'">4</option>
                  <option :value="'5'">5</option>
                  <option :value="'6'">6</option>
                  <option :value="'7'">7</option>
                  <option :value="'8'">8</option>
                  <option :value="'9'">9</option>
                </select>
              </div>
            </div>
          </div>
          <div id="addressLine1">
            <div id="streetAddressContainer">
              <label for="streetAddress">Street Address</label>
              <input type="text" name="" id="" value="enter info" v-model="property.streetAddress" placeholder="Street">
            </div>
            <div id="unitContainer">
              <label for="unit">Unit</label>
              <input type="text" name="" id="" value="enter info" v-model="property.unit" placeholder="Unit">
            </div>
          </div>
          <div id="addressLine2">
            <div id="cityContainer">
              <label for="city">City</label>
              <input type="text" name="" id="" value="enter info" v-model="property.city" placeholder="City">
            </div>
            <!-- <input type="text" name="" id="" value="enter info" v-model="property.state" placeholder="State Abbrev."> -->
            <div id="stateContainer">
              <label for="state">State</label>
              <select id="state" class="selectbox" v-model="property.state" required>
                <option :value="'AL'">AL</option>
                <option :value="'AK'">AK</option>
                <option :value="'AZ'">AZ</option>
                <option :value="'AR'">AR</option>
                <option :value="'AS'">AS</option>
                <option :value="'CA'">CA</option>
                <option :value="'CO'">CO</option>
                <option :value="'CT'">CT</option>
                <option :value="'DE'">DE</option>
                <option :value="'DC'">DC</option>
                <option :value="'FL'">FL</option>
                <option :value="'GA'">GA</option>
                <option :value="'HI'">HI</option>
                <option :value="'ID'">ID</option>
                <option :value="'IL'">IL</option>
                <option :value="'IN'">IN</option>
                <option :value="'IA'">IA</option>
                <option :value="'KS'">KS</option>
                <option :value="'KY'">KY</option>
                <option :value="'LA'">LA</option>
                <option :value="'ME'">ME</option>
                <option :value="'MD'">MD</option>
                <option :value="'MA'">MA</option>
                <option :value="'MI'">MI</option>
                <option :value="'MN'">MN</option>
                <option :value="'MS'">MS</option>
                <option :value="'MO'">MO</option>
                <option :value="'MT'">MT</option>
                <option :value="'NE'">NE</option>
                <option :value="'NV'">NV</option>
                <option :value="'NH'">NH</option>
                <option :value="'NJ'">NJ</option>
                <option :value="'NM'">NM</option>
                <option :value="'NY'">NY</option>
                <option :value="'NC'">NC</option>
                <option :value="'ND'">ND</option>
                <option :value="'OH'">OH</option>
                <option :value="'OK'">OK</option>
                <option :value="'OR'">OR</option>
                <option :value="'PA'">PA</option>
                <option :value="'PR'">PR</option>
                <option :value="'RI'">RI</option>
                <option :value="'SC'">SC</option>
                <option :value="'SD'">SD</option>
                <option :value="'TN'">TN</option>
                <option :value="'TX'">TX</option>
                <option :value="'UT'">UT</option>
                <option :value="'VT'">VT</option>
                <option :value="'VA'">VA</option>
                <option :value="'VI'">VI</option>
                <option :value="'WA'">WA</option>
                <option :value="'WV'">WV</option>
                <option :value="'WI'">WI</option>
                <option :value="'WY'">WY</option>
              </select>
            </div>
            <div id="zipContainer">
              <label for="zip">Zip</label>
              <input type="text" name="" id="" value="enter info" v-model="property.zip" placeholder="zip">
            </div>
          </div>
          <div id="descriptionContainer">
            <label for="description">Description</label>
            <textarea type="text" name="" id="" value="enter info" v-model="property.description" />
          </div>
          <div id="urlContainer">
            <ValidationProvider rules="required" id="urlContainer">
              <label for="url">Url</label>
              <input type="text" name="" id="" value="enter info" v-model="property.imgUrl" placeholder="url">
            </ValidationProvider>
          </div>
          <button type="submit"> Submit</button>
        </div>
      </div>
    </form>
  </div>
</template>

      <!-- // city, state, unit, zip, bathrooms, bedrooms, sqFootage, OwnerId, propertyName, description, ImgUrl -->

<script>
import propertyService from "../services/PropertyService";
import { ValidationProvider, extend } from 'vee-validate';
import { required } from 'vee-validate/dist/rules';


extend('required', {
  ...required,
  message: "Property field must not be blank. (actual)",
});


export default {
  name: "add-property-form",
  data() {
    return {
      errors: [],
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
        squareFootage: "",
        ownerId: this.$store.state.user.id,
        description: "",
        imgUrl: "",
      },
    };
  },
  components: {
    ValidationProvider
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
        squareFootage: this.property.sqFootage,
        description: this.property.description,
        imgUrl: this.property.imgUrl,
      };

      if (newProperty.propertyId === 0) {
        console.log('ok');
        propertyService
          .addProperty(newProperty)
          .then((response) => {
            if (response.status === 201 || response.status === 200) {
              this.$router.push(`/landlord-portal`);
              this.$store.commit("ADD_PROPERTY", newProperty);
            }
          })
          .catch((error) => {
            console.log("failed to add new property", error);
          });
      }
    },
  },
};
</script>

<style scoped>
.addPropertyForm {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-content: center;
  align-items: center;
  /* margin: 15em 25em; */
}


#overall {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  font-family: 'Roboto', Sans-serif;
  text-align: center;
}

.addPropertyContainer {
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  margin: auto;
  padding: 20px;
  background-color: white;
  box-shadow: 0.2rem 0.2rem 5px 0px grey;
  border-radius: 0.5em;
  max-width: 700px;
}

#app>div {
  margin: 10em 5em;

}

.addPropertyForm input {
  height: 2em;
  border-radius: 0.5em;
}

input {
  padding-left: 0.5em;
}

.addPropertyForm>div {
  padding-top: 2em;
}


#propertyNameContainer {
  display: flex;
  width: 100%;
  flex-direction: row;
}

#urlContainer {
  display: flex;
  width: 100%;
  flex-direction: column;
}

#propertyNameItem {
  display: flex;
  flex-direction: column;
  width: 100%;
}

.featuresContainer {
  display: flex;
  flex-direction: row;
  width: 40%;
  justify-content: right;
}


#sqFootageContainer {
  display: flex;
  flex-direction: column;
  width: 30%;
}

#bathroomsContainer,
#bedroomsContainer {
  display: flex;
  flex-direction: column;
  max-width: 15%;
  margin-left: 30px;
}

#streetAddressContainer {
  width: 80%;
}

#cityContainer {
  width: 60%;
}

#cityContainer input {
  display: flex;
  width: 90%;
  flex-direction: column;
}

/* bg-red-100 border border-red-400 text-red-700 px-4 py-3 mb-4 rounded" */
#error-container {
  border: red 1px solid;
  color: red;
}

#stateContainer {
  display: flex;
  flex-direction: column;
  max-width: 15%;
}

select {
  border: 2px solid black;
  border-radius: 0.5em;
  height: 100%;
  width: 100%;
}

select {
  text-align: center;
}


#zipContainer {
  display: flex;
  flex-direction: column;
  width: 20%;
}

#unitContainer {
  width: 10%;
}

.text-red {
  color: red;
}

#addressLine1,
#addressLine2 {
  display: flex;
  flex-direction: row;
  width: 100%;
  justify-content: space-between;
}


/* #bedroomsContainer, #bathroomsContainer {
  margin-bottom: 10px;
  color: red;
} */

#streetAddressContainer,
#unitContainer {
  display: flex;
  flex-direction: column;
}

label {
  font-weight: 700;
}

div.addPropertyForm {
  display: flex;
  flex-direction: column;
  padding-top: 5em;
}

#descriptionContainer {
  display: flex;
  flex-direction: column;
  width: 100%;
  height: 8em;
}

.input-label {
  margin-bottom: 0.5rem;
  margin-right: auto;
}

textarea {
  width: 99%;
  height: 8em;
  resize: none;
  border: 2px solid black;
}

button {
  margin: 3em 0;
}
</style>
