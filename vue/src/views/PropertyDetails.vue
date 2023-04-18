<template>
  <div>
    <div id="overall" class="text-center">
      <form @submit.prevent="updateForm()">
        <div class="addPropertyContainer">
          <div id="tippytop">
            <div id="buttonWrapper">
              <router-link :to="{ name: 'landlord-portal' }">
                <i id="back" class="fa-solid fa-circle-chevron-left fa-2xl" />
              </router-link>
            </div>
            <h1>Update Property</h1>
          </div>
          <div class="addPropertyForm">
            <div id="propertyNameContainer">
              <div id="propertyNameItem">
                <label for="propertyName">Property Name</label>
                <input
                  type="text"
                  name=""
                  id=""
                  v-model="property.name"
                  placeholder="Name"
                />
              </div>

              <div class="featuresContainer">
                <div id="sqFootageContainer">
                  <label for="sqFootage">Sq Ft</label>
                  <input
                    type="text"
                    name=""
                    id=""
                    value="enter info"
                    v-model="property.squareFootage"
                  />
                </div>

                <div id="bedroomsContainer">
                  <label for="bedrooms">Bed</label>
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
                  <label for="bathrooms">Bath</label>
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
                <label for="streetAddress">Street Address</label>
                <input
                  type="text"
                  name=""
                  id=""
                  value="enter info"
                  v-model="property.streetAddress"
                  placeholder="Street"
                />
              </div>
              <div id="unitContainer">
                <label for="unit">Unit</label>
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
                <label for="city">City</label>
                <input
                  type="text"
                  name=""
                  id=""
                  value="enter info"
                  v-model="property.city"
                  placeholder="City"
                />
              </div>
              <!-- <input type="text" name="" id="" value="enter info" v-model="property.state" placeholder="State Abbrev."> -->
              <div id="stateContainer">
                <label for="state">State</label>
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
                <label for="zip">Zip</label>
                <input
                  type="text"
                  name=""
                  id=""
                  value="enter info"
                  v-model="property.zip"
                  placeholder="zip"
                />
              </div>
            </div>
            <div id="descriptionContainer">
              <label for="description">Description</label>
              <textarea
                type="text"
                name=""
                id=""
                value="enter info"
                v-model="property.description"
              />
            </div>
            <div id="urlContainer">
              <ValidationProvider rules="required" id="urlContainer">
                <label for="url">Image URL</label>
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
            <button type="submit">Submit</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import propertyService from "../services/PropertyService";
// import addPropertyForm from "./addPropertyForm";

export default {
  name: "update-property-form",
  data() {
    return {
      property: {},
      updatedProperty: {
        propertyId: "",
        name: "",
        streetAddress: "",
        ownerId: "",
        city: "",
        state: "",
        unit: "",
        zip: "",
        bathrooms: "",
        bedrooms: "",
        squareFootage: "",
        description: "",
        imgUrl: "",
      },
    };
  },
  created() {
    const prop = this.$store.state.properties.find((property) => {
      console.log(property);
      return this.$route.params.id == property.propertyId;
    });
    console.log(prop);

    this.property = prop;
  },

  components: {
    // addPropertyForm,
  },
  methods: {
    updateForm() {
      propertyService
        .updateProperty(this.property.propertyId, this.property)
        .then((response) => {
          console.log(response);
          this.$store.commit("UPDATE_PROPERTY", this.property);
          this.$router.push({ name: "landlord-portal" });
        })
        .catch((error) => {
          console.log("failed to add new property", error);
        });
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
  font-family: "Roboto", Sans-serif;
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

#app > div {
  margin: 10em 5em;
}

.addPropertyForm input {
  height: 2em;
  border-radius: 0.5em;
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
  /* padding-top: 5em; */
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

#back {
  color: black;
  order: -1;
}

#tippytop {
  display: flex;
  justify-content: space-between;
  align-items: center;
  /* flex-grow: 1; */
}

#buttonWrapper {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-right: auto;
  margin-left: 20px;
}

h1 {
  margin: 0;
  text-align: center;
  flex: 1;
  margin-left: -64;
}
</style>