import axios from 'axios';

export default {

    getAll() {
        return axios.get("/properties");
    },
    addNew(property) {
        return axios.post("/properties", { property: property });
    }
}