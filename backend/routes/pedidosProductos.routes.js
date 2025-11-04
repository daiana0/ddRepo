const express = require("express");
const router = express.Router();

const pedidosProductosController = require("../controllers/pedidosProductos.controller");

router.get("/", pedidosProductosController.getPedidosProductos);

router.get("/:id", pedidosProductosController.getPedidoProductoById);

router.post("/", pedidosProductosController.createPedidoProducto);

router.put("/:id", pedidosProductosController.updatePedidoProducto);

router.delete("/:id", pedidosProductosController.deletePedidoProducto);

module.exports = router;
