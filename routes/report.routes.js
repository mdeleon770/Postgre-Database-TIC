const { Router } = require("express");
const reportController = require("../controllers/report.controller");

const router = Router();

router.post("/", (req, res) => reportController.createReport(req, res));

router.put("/:id", (req, res) => reportController.updateReport(req, res));

module.exports = router;
