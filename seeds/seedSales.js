// Import required modules
const { faker } = require('@faker-js/faker'); // Importing the latest Faker version
const sequelize = require('../config/sequelize'); // Your Sequelize instance
const Sale = require('../models/sales.model'); // Your Sale model
const Contact = require('../models/contact.model'); // Your Contact model

// Number of fake sales to generate
const numberOfSales = 100; // Adjust the number as needed

// Function to generate fake sales data
async function generateFakeSales() {

  // Synchronize all models with the database
  await sequelize.sync(); // Creates tables if they don't exist

  const fakeSales = [];

  // Fetch all contacts to associate sales with them
  const contacts = await Contact.findAll();

  for (let i = 0; i < numberOfSales; i++) {
    const randomContact = contacts[Math.floor(Math.random() * contacts.length)];

    const sale = {
      contactId: randomContact.id,
      saleId: faker.string.uuid(),
      product: faker.commerce.productName(),
      amount: faker.commerce.price(),
      date: faker.date.recent(),
      notes: faker.lorem.sentence(),
      productImage: faker.image.urlLoremFlickr({ category: 'apartment' }), // Generate a fake product image URL
    };

    fakeSales.push(sale);
  }

  try {
    // Bulk insert fake sales into the database
    await Sale.bulkCreate(fakeSales, { validate: true });
    console.log('Fake sales inserted successfully!');
  } catch (error) {
    console.error('Error inserting fake sales:', error);
  } finally {
    // Close the database connection
    await sequelize.close();
  }
}

// Run the function to generate and insert sales
generateFakeSales();