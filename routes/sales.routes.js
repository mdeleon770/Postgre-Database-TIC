const { Router } = require("express");
const salesController = require("../controllers/sales.controller");

const router = Router();

router.post("/", (req, res) => salesController.createSale(req, res));

router.put("/:id", (req, res) => salesController.updateSale(req, res));

module.exports = router;
