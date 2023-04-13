import axios from 'axios';

export default {

    getAll() {
        return axios.get("/properties");
    },
    addProperty(property) {
        return axios.post("/properties", property);
    }
}