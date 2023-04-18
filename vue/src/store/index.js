import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem('token')
const currentUser = JSON.parse(localStorage.getItem('user'));

if (currentToken != null) {
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {
    token: currentToken || '',
    user: currentUser || {},
    properties: [],
    requests: [],
    leases: []
  },
  mutations: {
    SET_AUTH_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem('token', token);
      axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    },
    SET_USER(state, user) {
      state.user = user;
      localStorage.setItem('user', JSON.stringify(user));
    },
    LOGOUT(state) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      state.token = '';
      state.user = {};
      axios.defaults.headers.common = {};
    },
    SET_PROPERTIES(state, properties) {
      state.properties = properties;
    },
    SET_USERS(state, users) {
      state.users = users;
    },
    ADD_PROPERTY(state, property) {
      state.properties.push(property);
    },
    UPDATE_PROPERTY(state, property) {

      const match = state.properties.find((prop) => {
        return prop.propertyId == property.propertyId;
      });
      const index = state.properties.indexOf(match);
      state.properties.splice(index, 1, property);

    },
    SET_REQUESTS(state, requests) {
      state.requests = requests;
    },
    SET_LEASES(state, leases) {
      state.leases = leases;
    },
    ADD_REQUEST(state, request) {
      state.requests.push(request);
    },
    UPDATE_REQUEST(state, request) {
      const match = state.requests.find((req) => {
        return req.requestId == request.requestId;
      });
      const index = state.requests.indexOf(match);
      state.requests.splice(index, 1, request);
    },
    DEACTIVATE_LEASE(state, lease) {
      const index = state.leases.indexOf(state.leases.find((ls) => {
        return ls.leaseId == lease.leaseId;
      }));
      lease.active = false;
      state.index.splice(index, 1, lease);
    },
    CREATE_LEASE(state, lease) {
      state.leases.push(lease);
    }
  },
  getters: {
    getPropertyById() {
      return null;
    }
    // (state) => (id) => {
    //   return state.properties.find((property) => {
    //     return id === property.propertyId;
    //   });
    // }
  }
})
