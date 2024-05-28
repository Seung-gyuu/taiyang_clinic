import dataaccess.UserDB;
import models.User;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

public class tests {

    private UserDB userDB;

    @Before
    public void setUp() {
        userDB = new UserDB(); // Create an instance of UserDB
        // Set up any necessary database connection details here
    }

    @After
    public void tearDown() {
        // Clean up any resources after each test if needed
    }

    @Test
    public void testGetAll() throws Exception {
        // Call the getAll method and check if it returns a non-empty list
        assertFalse(userDB.getAll().isEmpty());
    }

    @Test
    public void testGetAllByFirstName() throws Exception {
        // Call the getAllByFirstName method with a specific first name
        String firstName = "seunggyu";
        assertTrue(userDB.getAllByFirstName(firstName).isEmpty());
    }

    @Test
    public void testGetAllByLastName() throws Exception {
        // Call the getAllByLastName method with a specific last name
        String lastName = "park";
        assertTrue(userDB.getAllByLastName(lastName).isEmpty());
    }

    @Test
    public void testGet() throws Exception {
        // Call the get method with a valid user ID
        int userId = 1;
        User user = userDB.get(userId);
        assertNotNull(user);
        assertEquals(userId, user.getUserid().intValue());
    }

    @Test
    public void testGetByEmail() throws Exception {
        // Call the getByEmail method with a valid email address
        String email = "gyu@example.com";
        User user = userDB.getByEmail(email);
        assertNotNull(user);
        assertEquals(email, user.getEmailAddress());
    }

    @Test
    public void testGetByPhone() throws Exception {
        // Call the getByPhone method with a valid phone number
        String phone = "1234567890";
        User user = userDB.getByPhone(phone);
        assertNotNull(user);
        assertEquals(phone, user.getPhoneNumber());
    }

    @Test
    public void testInsert() throws Exception {
        // Create a new User object and insert it into the database
        User user = new User();
        user.setFirstname("seunggyu");
        user.setLastname("park");
        user.setEmailAddress("gyu@example.com");
        user.setPhoneNumber("9876543210");
        user.setPassword("password");

        userDB.insert(user);

        // Retrieve the inserted user and check if it matches the original user
        User insertedUser = userDB.getByEmail("gyu@example.com");
        assertNotNull(insertedUser);
        assertEquals(user.getFirstname(), insertedUser.getFirstname());
        assertEquals(user.getLastname(), insertedUser.getLastname());
        assertEquals(user.getPhoneNumber(), insertedUser.getPhoneNumber());

        // Clean up: delete the inserted user
        userDB.delete(insertedUser);
        assertNull(userDB.getByEmail("jane@example.com"));
    }

    @Test
    public void testUpdate() throws Exception {
        // Retrieve a user from the database
        int userId = 1;
        User user = userDB.get(userId);
        assertNotNull(user);

        // Update the user's first name and last name
        user.setFirstname("UpdatedFirstName");
        user.setLastname("UpdatedLastName");

        // Update the user in the database
        userDB.update(user);

        // Retrieve the updated user and check if the changes were applied
        User updatedUser = userDB.get(userId);
        assertNotNull(updatedUser);
        assertEquals("UpdatedFirstName", updatedUser.getFirstname());
        assertEquals("UpdatedLastName", updatedUser.getLastname());
    }

    @Test
    public void testDelete() throws Exception {
        // Create a new User object and insert it into the database
        User user = new User();
        user.setFirstname("ToDelete");
        user.setLastname("ToDelete");
        user.setEmailAddress("toDelete@example.com");
        user.setPhoneNumber("1234567890");
        user.setPassword("password123");

        userDB.insert(user);

        // Retrieve the inserted user and check if it exists
        User insertedUser = userDB.getByEmail("toDelete@example.com");
        assertNotNull(insertedUser);

        // Delete the user from the database
        userDB.delete(insertedUser);

        // Check if the user is deleted and no longer exists
        assertNull(userDB.getByEmail("toDelete@example.com"));
    }
}
