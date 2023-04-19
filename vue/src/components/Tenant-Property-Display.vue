<template>
  <div id="display">
    <section id="header">
      <h1>Residence Details</h1>
    </section>
    <div class="card">
      <img
        :src="property.imgUrl"
        onerror="this.onerror=null; this.src='https://www.hopkinsmedicine.org/sebin/o/i/noimageavailable.png'"
      />
      <div class="text">
        <div id="property-details">
          <h3>Property Info:</h3>
          <p><span class="label">Name:</span>&nbsp; {{ property.name }}</p>
          <p>
            <span class="label">Address:</span>&nbsp;
            {{ property.streetAddress }}
            {{ property.unit ? "Unit #" + property.unit : "" }},
            {{ property.city }}, {{ property.state }}, {{ property.zip }}
          </p>
          <p>
            <span
              >{{ property.bedrooms }} &nbsp;<i class="fa-solid fa-bed" /></span
            ><span
              >{{ property.bathrooms }} &nbsp;<i class="fa-solid fa-bath"
            /></span>
            <span>{{ property.squareFootage }} Sq Ft</span>
          </p>
        </div>

        <div id="owner-info">
          <h3>Owner Contact Info:</h3>
          <div class="owner-name">
            <span class="label">Name:</span>&nbsp;&nbsp;&nbsp;
            <span class="owner-info"
              >{{ owner.firstName }} {{ owner.lastName }}</span
            >
          </div>
          <div class="owner-contact-info">
            <span class="label">Phone:</span>&nbsp;&nbsp;&nbsp;<span
              class="owner-info"
              >{{ owner.phone }}</span
            >
          </div>
        </div>

        <h3>Lease Info:</h3>
        <div id="lease-details">
          <div class="lease-text">
            <p>
              <span class="label">Start Date:</span>&nbsp;
              {{ currentLease.startDate }}
            </p>
            <p>
              <span class="label">End Date:</span>&nbsp;
              {{ currentLease.endDate }}
            </p>
            <p>
              <span class="label">Rent:</span>&nbsp;${{
                currentLease.rentAmount
              }}
              /mo.
            </p>
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
    currentLease() {
      return this.$store.state.leases.find((lease) => {
        return lease.tenantId == this.$store.state.user.id;
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
#header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  box-shadow: 0.2rem 0.2rem 5px 0px grey;
  background-color: white;
  border-radius: 2rem;
  margin: auto;
  margin-bottom: 1rem;
  padding: 0;
  width: 100%;
}

.card {
  display: inline-block;
  width: 100%;
  margin-bottom: 1rem;
  box-shadow: 0.2rem 0.2rem 5px 0px grey;
  border-radius: 2rem;
  overflow: hidden;
  font-size: 20px;
  transition: all 0.1s cubic-bezier(0, 0, 0.5, 1);
  background-color: white;
  padding-bottom: 1rem;
}

.card img {
  width: 100%;
  height: 150px;
  object-fit: cover;
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

.owner-contact-info {
  margin-top: 1rem;
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

#display {
  width: 100%;
}

.label {
  font-weight: 600;
  vertical-align: bottom;
  line-height: 19px;
}

i {
  margin-right: 0.5rem;
}

#header h1 {
  margin: 1rem 1.5rem;
  font-size: 1.8rem;
}
</style>