// Import required modules
const { faker } = require('@faker-js/faker'); // Importing the latest Faker version
const sequelize = require('../config/sequelize'); // Your Sequelize instance
const User = require('../models/user.model'); // Your User model

// Number of fake users to generate
const numberOfUsers = 100; // Adjust the number as needed

// Function to generate fake user data
async function generateFakeUsers() {

  // Synchronize all models with the database
  await sequelize.sync(); // Creates tables if they don't exist

  const fakeUsers = [];

  for (let i = 0; i < numberOfUsers; i++) {
    
    const user = {
      username: faker.internet.userName(),
      password: faker.internet.password(),
      email: faker.internet.email(),
      role: faker.helpers.arrayElement(['admin', 'seller', 'user']),
      firstName: faker.person.firstName(),
      lastName: faker.person.lastName(),
      avatar: faker.image.avatar(), // Generate a fake avatar image URL
    };

    fakeUsers.push(user);
  }

  try {
    // Bulk insert fake users into the database
    await User.bulkCreate(fakeUsers, { validate: true });
    console.log('Fake users inserted successfully!');
  } catch (error) {
    console.error('Error inserting fake users:', error);
  } finally {
    // Close the database connection
    await sequelize.close();
  }
}

// Run the function to generate and insert users
generateFakeUsers();