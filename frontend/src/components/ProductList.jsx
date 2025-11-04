import { useEffect, useState } from "react";
import axios from "axios";
import ProductCard from "./ProductCard";
import Box from "@mui/material/Box";
import Pagination from "@mui/material/Pagination";
import Typography from "@mui/material/Typography";

const ProductList = ({ filters }) => {
  const [productos, setProductos] = useState([]);
  const [page, setPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    const fetchProductos = async () => {
      setLoading(true);
      try {
        const response = await axios.get(
          "http://localhost:3000/api/productos",
          {
            params: {
              page,
              limit: 12,
              nombre: filters.nombre || undefined,
              precioMin: filters.precioMin || undefined,
              precioMax: filters.precioMax || undefined,
              idCategoria: filters.idCategoria || undefined,
            },
          }
        );
        setProductos(response.data.data);
        setTotalPages(response.data.pagination.totalPages);
      } catch (error) {
        console.error("Error al obtener productos:", error);
      } finally {
        setLoading(false);
      }
    };

    fetchProductos();
  }, [page, filters]);

  const handlePageChange = (event, value) => {
    setPage(value);
    window.scrollTo({ top: 0, behavior: "smooth" });
  };

  return (
    <Box sx={{ py: 4 }}>
      {loading ? (
        <Typography variant="h6" textAlign="center" sx={{ py: 8 }}>
          Cargando productos...
        </Typography>
      ) : productos.length === 0 ? (
        <Typography variant="h6" textAlign="center" sx={{ py: 8 }}>
          No se encontraron productos
        </Typography>
      ) : (
        <>
          <Box
            sx={{
              display: "flex",
              flexWrap: "wrap",
              justifyContent: "center",
              gap: 1,
            }}
          >
            {productos.map((producto) => (
              <ProductCard key={producto.id} producto={producto} />
            ))}
          </Box>

          {totalPages > 1 && (
            <Box sx={{ display: "flex", justifyContent: "center", mt: 4 }}>
              <Pagination
                count={totalPages}
                page={page}
                onChange={handlePageChange}
                color="primary"
                size="large"
                showFirstButton
                showLastButton
              />
            </Box>
          )}
        </>
      )}
    </Box>
  );
};

export default ProductList;
