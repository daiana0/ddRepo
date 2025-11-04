const express = require("express");
const router = express.Router();
const carritosProductosController = require("../controllers/carritosProductos.controller");

router.get("/", carritosProductosController.getCarritosProductos);

router.get("/:id", carritosProductosController.getCarritoProductoById);

router.post("/", carritosProductosController.createCarritoProducto);

router.put("/:id", carritosProductosController.updateCarritoProducto);

router.delete("/:id", carritosProductosController.deleteCarritoProducto);

module.exports = router;
