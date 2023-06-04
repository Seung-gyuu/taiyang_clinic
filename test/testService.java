import dataaccess.ServiceDB;
import models.Service;
import java.util.List;

public class testService {
    public static void main(String[] args) {
        try {
            // Create a new ServiceDB instance
            ServiceDB serviceDB = new ServiceDB();

            // Retrieve all services
            List<Service> services = serviceDB.getAll();
            System.out.println("All Services:");
            for (Service service : services) {
                System.out.println(service);
            }

            // Get a specific service by ID
            int serviceId = 1; // Replace with the desired service ID
            Service service = serviceDB.get(serviceId);
            System.out.println("Service with ID " + serviceId + ":");
            System.out.println(service);

            // Create a new service
            Service newService = new Service();
            newService.setServiceid(2); // Replace with the desired service ID
            newService.setServiceName("New Service");
            newService.setServiceDescription("Description of the new service");
            serviceDB.insert(newService);
            System.out.println("New Service has been created.");

            // Update an existing service
            Service existingService = serviceDB.get(serviceId);
            if (existingService != null) {
                existingService.setServiceDescription("Updated service description");
                serviceDB.update(existingService);
                System.out.println("Service with ID " + serviceId + " has been updated.");
            }

            // Delete a service
            Service serviceToDelete = serviceDB.get(serviceId);
            if (serviceToDelete != null) {
                serviceDB.delete(serviceToDelete);
                System.out.println("Service with ID " + serviceId + " has been deleted.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
