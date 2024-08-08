const { Router } = require("express");
const interactionController = require("../controllers/interaction.controller");

const router = Router();

router.get("/", (req, res) => interactionController.getInteractions(req, res));
router.post("/", (req, res) => interactionController.createInteraction(req, res));

router.get("/:id", (req, res) => interactionController.getInteractionById(req, res));
router.put("/:id", (req, res) => interactionController.updateInteraction(req, res));

module.exports = router;
