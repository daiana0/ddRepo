const express = require("express");
const router = express.Router();
const path = require("path");
const multer = require("multer");
const categoriasController = require("../controllers/categorias.controller");
const {
  validatePagination,
  validateCategoriaCreate,
  validateCategoriaUpdate,
  validateCategoriaId,
} = require("../middleware/validation");

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, path.join(__dirname, "../uploads"));
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + path.extname(file.originalname));
  },
});

const upload = multer({ storage });

router.get("/", validatePagination, categoriasController.getCategorias);

router.get("/:id", validateCategoriaId, categoriasController.getCategoria);

router.get(
  "/:id/productos",
  validateCategoriaId,
  validatePagination,
  categoriasController.getProductosByCategoria
);

router.post(
  "/",
  upload.single("imagen"),
  validateCategoriaCreate,
  categoriasController.createCategoria
);

router.put(
  "/:id",
  validateCategoriaId,
  upload.single("imagen"),
  validateCategoriaUpdate,
  categoriasController.updateCategoria
);

router.delete(
  "/:id",
  validateCategoriaId,
  categoriasController.deleteCategoria
);

module.exports = router;
