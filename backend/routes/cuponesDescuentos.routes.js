const express = require("express");
const router = express.Router();

const cuponesController = require("../controllers/cuponesDescuentos.controller");

router.get("/validar/:codigo", cuponesController.validarCupon);

router.get("/", cuponesController.getCupones);

router.get("/:id", cuponesController.getCupon);

router.post("/", cuponesController.createCupon);

router.put("/:id", cuponesController.updateCupon);

router.delete("/:id", cuponesController.deleteCupon);

module.exports = router;
