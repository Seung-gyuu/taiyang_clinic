/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.ServiceDB;
import java.util.List;
import models.Appointment;
import models.Service;
/**
 *
 * @author Hussein
 */
public class ServiceService {
    private ServiceDB sdb;
    
    public ServiceService(){
        this.sdb=new ServiceDB();
    }
    
    public List<Service> getAll() throws Exception {
        return sdb.getAll();
    }
    public Service get(Integer serviceId) {
        return sdb.get(serviceId);
    }
    public String insert(Service service) throws Exception {
        String serviceName = service.getServiceName();
        String serviceDesc = service.getServiceDescription();
        if(serviceName==null || serviceName.equals("") || serviceDesc==null || serviceDesc.equals(""))
            return "Cannot leave any fields empty!";
        sdb.insert(service);
        return "Service inserted!";
    }
    public String update(Service service) throws Exception {
        String serviceName = service.getServiceName();
        String serviceDesc = service.getServiceDescription();
        if(serviceName==null || serviceName.equals("") || serviceDesc==null || serviceDesc.equals(""))
            return "Cannot leave any fields empty!";
        sdb.update(service);
        return "Update Successful!";
    }
    //deleting is a dangerous operation because of cascading. I am not sure how to handle service deletion.  Maybe only updates
    // and let the client know that ? But then if she updates, it will update all past and upcoming service stuff soooo...
    public String delete(Service service) throws Exception {
        Service s = sdb.get(service.getServiceid());
        if(s==null){
            return "No service exists";
        }
        List<Appointment> appts = s.getAppointmentList();
        if(appts.get(0)!=null)
            return "There are appointments with that service!";
        
        sdb.delete(service);
        return "Service deleted!";
    }
    
}
