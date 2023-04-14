package com.techelevator.dao;

import com.sun.tools.javac.Main;
import com.techelevator.model.MaintRequest;

import java.util.List;

public interface MaintRequestDAO {

    public List<MaintRequest> getAll();

    public MaintRequest getById(int id);

    public MaintRequest update(MaintRequest request);

    public boolean delete(int id);

    public MaintRequest createRequest(MaintRequest request);
}
