const express = require("express");
const router = express.Router();

const varianteController = require("../controllers/variantes.controller");

router.get("/", varianteController.getVariantes);

router.get("/producto/:productoId", varianteController.getVariantesByProducto);

router.get("/:id", varianteController.getVariante);

router.post("/", varianteController.createVariante);

router.put("/:id", varianteController.updateVariante);

router.delete("/:id", varianteController.deleteVariante);

module.exports = router;
