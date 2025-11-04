const express = require("express");
const router = express.Router();
const administradoresController = require("../controllers/administradores.controller");

const {
  validatePagination,
  validateAdministradorCreate,
  validateAdministradorUpdate,
  validateAdministradorId,
} = require("../middleware/validation");

router.get(
  "/",
  validatePagination,
  administradoresController.getAdministradores
);

router.get(
  "/:id",
  validateAdministradorId,
  administradoresController.getAdministrador
);

router.post(
  "/",
  validateAdministradorCreate,
  administradoresController.createAdministrador
);

router.put(
  "/:id",
  validateAdministradorId,
  validateAdministradorUpdate,
  administradoresController.updateAdministrador
);

router.delete(
  "/:id",
  validateAdministradorId,
  administradoresController.deleteAdministrador
);

module.exports = router;
