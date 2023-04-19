<template>
  <div>
    <div id="overall" class="text-center">
      <form @submit.prevent="submitForm()">
        <div class="addPropertyContainer">
          <div id="logo-container">
            <img
              src="../assets/templatelogo.png"
              alt="Logo"
              class="registerlogo"
            />
          </div>

          <div class="row">
            <h1 class="mainRowElement">Add New Property</h1>
            <div class="smallRowElement"></div>
          </div>
          <div v-if="errors.length > 0" id="error-container">
            <ul>
              <li v-for="(error, index) in errors" :key="index">{{ error }}</li>
            </ul>
          </div>

          <div class="addPropertyForm">
            <div id="propertyNameContainer">
              <div id="propertyNameItem">
                <div class="input-label">
                  <label for="propertyName">Property Name</label>
                </div>
                <input
                  type="text"
                  name=""
                  id=""
                  value="enter info"
                  v-model="property.name"
                  placeholder="Name"
                  required
                />
              </div>

              <div class="featuresContainer">
                <div id="sqFootageContainer">
                  <div class="input-label">
                    <label for="sqFootage">Sq Ft</label>
                  </div>
                  <input
                    type="number"
                    name=""
                    id=""
                    value="enter info"
                    v-model="property.squareFootage"
                    required
                  />
                </div>

                <div id="bedroomsContainer">
                  <div class="input-label">
                    <label for="bedrooms">Bed</label>
                  </div>
                  <select
                    id="bedrooms"
                    class="selectbox"
                    v-model="property.bedrooms"
                    required
                  >
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
                  <div class="input-label">
                    <label for="bathrooms">Bath</label>
                  </div>
                  <select
                    id="bathrooms"
                    class="selectbox"
                    v-model="property.bathrooms"
                    required
                  >
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
                <div class="input-label">
                  <label for="streetAddress">Street Address</label>
                </div>
                <input
                  type="text"
                  name=""
                  id=""
                  value="enter info"
                  v-model="property.streetAddress"
                  placeholder="Street"
                  required
                />
              </div>
              <div id="unitContainer">
                <div class="input-label"><label for="unit">Unit</label></div>
                <input
                  type="text"
                  name=""
                  id=""
                  value="enter info"
                  v-model="property.unit"
                  placeholder="Unit"
                />
              </div>
            </div>
            <div id="addressLine2">
              <div id="cityContainer">
                <div class="input-label"><label for="city">City</label></div>
                <input
                  type="text"
                  name=""
                  id=""
                  value="enter info"
                  v-model="property.city"
                  placeholder="City"
                  required
                />
              </div>
              <!-- <input type="text" name="" id="" value="enter info" v-model="property.state" placeholder="State Abbrev."> -->
              <div id="stateContainer">
                <div class="input-label"><label for="state">State</label></div>
                <select
                  id="state"
                  class="selectbox"
                  v-model="property.state"
                  required
                >
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
                <div class="input-label"><label for="zip">Zip</label></div>
                <input
                  type="text"
                  name=""
                  id=""
                  value="enter info"
                  v-model="property.zip"
                  placeholder="zip"
                  required
                />
              </div>
            </div>
            <div id="descriptionContainer">
              <div class="input-label">
                <label for="description">Description</label>
              </div>
              <textarea
                type="text"
                name=""
                id=""
                value="enter info"
                v-model="property.description"
                required
              />
            </div>
            <div id="urlContainer">
              <ValidationProvider rules="required" id="urlContainer">
                <div class="input-label">
                  <label for="url">Image URL</label>
                </div>
                <input
                  type="text"
                  name=""
                  id=""
                  value="enter info"
                  v-model="property.imgUrl"
                  placeholder="url"
                />
              </ValidationProvider>
            </div>
            <div id="button-container">
              <router-link :to="{ name: 'tenant-portal' }" id="cancel-btn">
                <button>Cancel</button>
              </router-link>
              <button type="submit" id="submit">Submit</button>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</template>

      <!-- // city, state, unit, zip, bathrooms, bedrooms, sqFootage, OwnerId, propertyName, description, ImgUrl -->

<script>
import propertyService from "../services/PropertyService";
import { ValidationProvider, extend } from "vee-validate";
import { required } from "vee-validate/dist/rules";

extend("required", {
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
    ValidationProvider,
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
        squareFootage: this.property.squareFootage,
        description: this.property.description,
        imgUrl: this.property.imgUrl,
      };

      if (newProperty.propertyId === 0) {
        console.log("ok");
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

  mounted() {
    let tag = document.createElement("script");
    tag.setAttribute("src", "https://kit.fontawesome.com/ae58b87c40.js");
    document.head.appendChild(tag);
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
}

#overall {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  font-family: "Roboto", Sans-serif;
  text-align: left;
}

.addPropertyContainer {
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  /* margin: auto; */
  padding: 20px;
  background-color: white;
  box-shadow: 0.2rem 0.2rem 5px 0px grey;
  border-radius: 0.5em;
  /* max-width: 1000px; */
}

#app > div {
  margin: 10em 5em;
}

input {
  padding-left: 0.5em;
}

.addPropertyForm > div {
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
  padding-top: 0px;
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
  width: 40%;
}

#bathroomsContainer,
#bedroomsContainer {
  display: flex;
  flex-direction: column;
  max-width: 30%;
  margin-left: 10px;
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
  /* border: 2px solid black; */
  /* border-radius: 0.5em; */
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
  padding: 0px;
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

/* delete to conform to registration form */
/* label {
  font-weight: 700;
} */

div.addPropertyForm {
  display: flex;
  flex-direction: column;
  /* padding-top: 5em; */
}

#descriptionContainer {
  display: flex;
  flex-direction: column;
  width: 100%;
  height: 8em;
  padding-top: 0px;
}

.input-label {
  margin-bottom: 0.5rem;
  margin-top: 0.7rem;
  margin-right: auto;
}

textarea {
  width: 99%;
  height: 8em;
  resize: none;
  /* border: 2px solid black; */
}

#button-container {
  padding-top: 1em;
  margin: 0px;
  display: flex;
  justify-items: center;
  gap: 2rem;
}

button {
  margin: 0em 0;
  width: 8rem;
}

#back {
  color: black;
  order: -1;
}

.row {
  display: flex;
  justify-content: space-between;
  align-items: center;

  margin-top: 21.44px;
  /* flex-grow: 1; */
}

.smallRowElement {
  /* display: flex; */
  /* justify-content: center;
  align-items: center;
  margin-right: auto;
  margin-left: 20px; */
  flex: 1 1 auto;
  max-width: 32px;
}

.mediumRowElement {
  flex: 1 1 auto;
  max-width: px;
}

.mainRowElement {
  margin: 0;
  text-align: center;
  width: 100%;
  /* margin-left: -64px; */
}

#logo-container {
  display: flex;
  justify-content: center;
}

.registerlogo {
  display: flex;
  max-width: 20%;
  height: auto;
  border-radius: 20%;
  margin-left: 35px;
}

/* #smallRowElement
 {
  flex: 1 1 auto;
  max-width: 32px;
} */
</style>
