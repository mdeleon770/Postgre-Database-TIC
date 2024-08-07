// Import required modules
const { faker } = require('@faker-js/faker'); // Importing the latest Faker version
const sequelize = require('./config/sequelize'); // Your Sequelize instance
const Contact = require('./models/contact.model'); // Your Contact model

// Number of fake contacts to generate
const numberOfContacts = 100; // Adjust the number as needed

// Function to generate fake contact data
async function generateFakeContacts() {

  // Synchronize all models with the database
  await sequelize.sync(); // Creates tables if they don't exist
     
  const fakeContacts = [];

  for (let i = 0; i < numberOfContacts; i++) {
    
    const contact = {
      firstName: faker.person.firstName(),
      lastName: faker.person.lastName(),
      email: faker.internet.email(),
      phoneNumber: faker.phone.number(),
      address: faker.location.streetAddress()
    };

    fakeContacts.push(contact);
  }

  try {
    // Bulk insert fake contacts into the database
    await Contact.bulkCreate(fakeContacts, { validate: true });
    console.log('Fake contacts inserted successfully!');
  } catch (error) {
    console.error('Error inserting fake contacts:', error);
  } finally {
    // Close the database connection
    await sequelize.close();
  }
}

// Run the function to generate and insert contacts
generateFakeContacts();