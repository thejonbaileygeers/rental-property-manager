import axios from 'axios';

export default {

    getAll() {
        return axios.get("/properties");
    },
    addProperty(property) {
        return axios.post("/properties", property);
    },
    updateProperty(propertyId, property) {
        return axios.put(`/properties/${propertyId}`, property);
    },
    deleteProperty(propertyId) {
        return axios.delete(`/properties/${propertyId}`);
    } 
}