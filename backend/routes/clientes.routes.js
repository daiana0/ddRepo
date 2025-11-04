const express = require("express");
const router = express.Router();

const clientesController = require("../controllers/clientes.controller");
const {
  validateClienteCreate,
  validateClienteUpdate,
  validateClienteId,
  validatePagination,
} = require("../middleware/validation");

router.get("/", validatePagination, clientesController.getClientes);

router.get("/:id", validateClienteId, clientesController.getCliente);

router.post("/", validateClienteCreate, clientesController.createCliente);

router.put(
  "/:id",
  validateClienteId,
  validateClienteUpdate,
  clientesController.updateCliente
);

router.delete("/:id", validateClienteId, clientesController.deleteCliente);

module.exports = router;
