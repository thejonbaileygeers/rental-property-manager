import axios from 'axios';

export default {

    getAll() {
        return axios.get("/maintenance");
    },

    create(request) {
        return axios.post("/maintenance", request);
    },

    assignMaintenance(requestID, maintenanceId) {
        return axios.patch(`/maintenance/${requestID}`, { maintenanceId });
    },

    completeRequest(requestID) {
        return axios.patch(`/maintenance/${requestID}/complete`);
    }
}