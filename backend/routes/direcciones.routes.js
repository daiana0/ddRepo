const express = require("express");
const router = express.Router();

const direccionesController = require("../controllers/direcciones.controller");

router.get("/", direccionesController.getDirecciones);

router.get("/:id", direccionesController.getDireccion);

router.post("/", direccionesController.createDireccion);

router.put("/:id", direccionesController.updateDireccion);

router.delete("/:id", direccionesController.deleteDireccion);

module.exports = router;
