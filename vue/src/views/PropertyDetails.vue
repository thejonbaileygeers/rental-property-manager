<template>
  <div>
    <div id="overall" class="text-center">
      <form @submit.prevent="updateForm()">
        <div class="addPropertyContainer">
          <div id="logo-container">
            <img
              src="../assets/templatelogo.png"
              alt="Logo"
              class="registerlogo"
            />
          </div>
          <div id="h1-container">
            <h1>Update Property</h1>
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
                  v-model="property.name"
                  placeholder="Name"
                />
              </div>
              <div class="featuresContainer">
                <div id="sqFootageContainer">
                  <div class="input-label">
                    <label for="sqFootage">Sq Ft</label>
                  </div>
                  <input
                    type="text"
                    name=""
                    id=""
                    value="enter info"
                    v-model="property.squareFootage"
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
                />
              </div>
              <div id="unitContainer">
                <div class="input-label">
                  <label for="unit">Unit</label>
                </div>
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
                <div class="input-label">
                  <label for="city">City</label>
                </div>
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
  padding: 20px;
  background-color: white;
  box-shadow: 0.2rem 0.2rem 5px 0px grey;
  border-radius: 0.5em;
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
  text-align: center;
  height: 100%;
  width: 100%;
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

#streetAddressContainer,
#unitContainer {
  display: flex;
  flex-direction: column;
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
}

#h1-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 21.44px;
}

h1 {
  margin: 0;
  text-align: center;
  width: 100%;
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
}

#button-container {
  display: flex;
  justify-content: center;
  gap: 1rem;
}

button {
  width: 100px;
}
</style>