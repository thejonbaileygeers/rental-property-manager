import axios from 'axios';

export default {

    getAll() {
        return axios.get("/maintenance");
    },

    create(request) {
        return axios.post("/maintenance", request);
    }
}