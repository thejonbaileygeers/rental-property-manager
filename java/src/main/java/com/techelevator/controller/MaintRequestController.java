package com.techelevator.controller;

import com.techelevator.dao.MaintRequestDAO;
import com.techelevator.dao.UserDao;
import com.techelevator.model.AssignMaintDto;
import com.techelevator.model.CreateMaintDto;
import com.techelevator.model.MaintRequest;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.time.LocalDate;
import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/maintenance")
@PreAuthorize("isAuthenticated()")
public class MaintRequestController {

    private MaintRequestDAO dao;
    private UserDao userDao;

    public MaintRequestController(MaintRequestDAO dao, UserDao userDao) {
        this.dao = dao;
        this.userDao = userDao;
    }

    @GetMapping
    public List<MaintRequest> getAll() {
        return dao.getAll();
    }

    @GetMapping("/{id}")
    public MaintRequest getById(@PathVariable int id) {
        return dao.getById(id);
    }

    @PostMapping
    public MaintRequest create(@RequestBody CreateMaintDto dto, Principal principal) {

        MaintRequest request = new MaintRequest();
        int userId = userDao.findIdByUsername(principal.getName());

        request.setRequesterId(userId);
        request.setPropertyId(dto.getPropertyId());
        request.setMaintenanceId(null);
        request.setDescription(dto.getDescription());
        request.setPriority(dto.getPriority());
        request.setRepeatIssue(dto.isRepeatIssue());
        request.setDateCompleted(null);
        request.setDateRequested(LocalDate.now());
        request.setStatus("pending");

        return dao.createRequest(request);
    }


    @PatchMapping("/{id}")
    public MaintRequest assignMaintenance(@PathVariable int id, @RequestBody AssignMaintDto dto) {
        MaintRequest request = dao.getById(id);
        request.setMaintenanceId(dto.getMaintenanceId());
        request.setStatus("in-progress");
        return dao.update(request);
    }

    @PatchMapping("/{id}/complete")
    public MaintRequest completeRequest(@PathVariable int id) {
        MaintRequest request = dao.getById(id);
        request.setStatus("complete");
        request.setDateCompleted(LocalDate.now());
        return dao.update(request);
    }


}
