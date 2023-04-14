package com.techelevator.dao;

import com.techelevator.model.MaintRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcMaintRequestDao implements MaintRequestDAO {

    private final JdbcTemplate jdbcTemplate;

    public JdbcMaintRequestDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<MaintRequest> getAll() {
        String sql = "SELECT request_id, property_id, maintenance_id, requester_id, description, priority, repeat_issue, date_requested, date_completed, status\n" +
                "\tFROM maintenance_requests;";
        List<MaintRequest> requests = new ArrayList<>();

        SqlRowSet rs = jdbcTemplate.queryForRowSet(sql);
        while (rs.next()) {
            requests.add(mapRowToRequest(rs));
        }
        return requests;
    }

    @Override
    public MaintRequest getById(int id) {
        String sql = "SELECT request_id, property_id, maintenance_id, requester_id, description, priority, repeat_issue, date_requested, date_completed, status\n" +
                "\tFROM maintenance_requests WHERE request_id = ?;";

        MaintRequest request = null;

        SqlRowSet rs = jdbcTemplate.queryForRowSet(sql, id);

        if (rs.next()) {
            request = mapRowToRequest(rs);
        }

        return request;
    }

    @Override
    public MaintRequest update(MaintRequest request) {
        String sql = "UPDATE maintenance_requests\n" +
                "\tSET property_id=?, maintenance_id=?, requester_id=?, description=?, priority=?, " +
                "repeat_issue=?, date_requested=?, date_completed=?, status=?\n" +
                "\tWHERE request_id=? RETURNING request_id";

        Integer id = jdbcTemplate.queryForObject(sql, Integer.class, request.getPropertyId(), request.getMaintenanceId(), request.getRequesterId(), request.getDescription(), request.getPriority(),
                request.isRepeatIssue(), request.getDateRequested(), request.getDateCompleted(), request.getStatus(), request.getRequestId());

        return getById(id);
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM maintenance_requests\n" +
                "\tWHERE request_id = ?;";

        return jdbcTemplate.update(sql, id) > 0;
    }

    @Override
    public MaintRequest createRequest(MaintRequest request) {
        String sql = "INSERT INTO maintenance_requests(\n" +
                "\t property_id, maintenance_id, requester_id, description, priority, repeat_issue, date_requested, date_completed, status)\n" +
                "\tVALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?) RETURNING request_id;";

        Integer id = jdbcTemplate.queryForObject(sql, Integer.class, request.getPropertyId(), request.getMaintenanceId(), request.getRequesterId(), request.getDescription(), request.getPriority(),
                request.isRepeatIssue(), request.getDateRequested(), null, request.getStatus());

        return (id == null) ? null : getById(id);
    }

    private MaintRequest mapRowToRequest(SqlRowSet rs) {
        MaintRequest request = new MaintRequest();

        request.setRequestId(rs.getInt("request_id"));
        request.setPropertyId(rs.getInt("property_id"));

        int maintenanceId = rs.getInt("maintenance_id");
        request.setMaintenanceId((maintenanceId == 0) ? null : maintenanceId);

        request.setRequesterId(rs.getInt("requester_id"));
        request.setDescription(rs.getString("description"));
        request.setPriority(rs.getString("priority"));
        request.setRepeatIssue(rs.getBoolean("repeat_issue"));
        if (rs.getDate("date_requested") != null) {
            request.setDateRequested(rs.getDate("date_requested").toLocalDate());
        }
        if (rs.getDate("date_completed") != null) {
            request.setDateCompleted(rs.getDate("date_completed").toLocalDate());
        }
        request.setStatus(rs.getString("status"));

        return request;
    }
}
