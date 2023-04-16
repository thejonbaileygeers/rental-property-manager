import axios from "axios";

export default {
    getAll() {
        return axios.get('/leases');
    },

    createLease(lease) {
        return axios.post('/leases', lease)
    },

    updateLease(leaseId, lease) {
        return axios.put(`/leases/${leaseId}`, lease);
    }
}