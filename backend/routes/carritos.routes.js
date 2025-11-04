const express = require("express");
const router = express.Router();
const carritosController = require("../controllers/carritos.controller");

router.get("/", carritosController.getCarritos);

router.get("/:id", carritosController.getCarritoById);

router.post("/", carritosController.createCarrito);

router.put("/:id", carritosController.updateCarrito);

router.delete("/:id", carritosController.deleteCarrito);

module.exports = router;
