const express = require("express");
const router = express.Router();

const enviosController = require("../controllers/envios.controller");

router.get("/", enviosController.getEnvios);

router.get("/:id", enviosController.getEnvio);

router.post("/", enviosController.createEnvio);

router.put("/:id", enviosController.updateEnvio);

router.delete("/:id", enviosController.deleteEnvio);

module.exports = router;
