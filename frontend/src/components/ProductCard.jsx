import Card from "@mui/material/Card";
import CardContent from "@mui/material/CardContent";
import CardMedia from "@mui/material/CardMedia";
import Typography from "@mui/material/Typography";
import Button from "@mui/material/Button";
import CardActions from "@mui/material/CardActions";
import Box from "@mui/material/Box";

import { useNavigate } from "react-router-dom";
import { useContext } from "react";
import { CuponContext } from "../contexts/Cupon.context";
import { useCart } from "../contexts/Cart.context";

const ProductCard = ({ producto, votos }) => {
  const { cupon } = useContext(CuponContext);
  const { addToCart, isInCart, getItemQuantity } = useCart();
  const navigate = useNavigate();

  const tieneOferta = producto.oferta;

  const descuentoProducto = producto.descuento || 0;
  const descuentoCupon = cupon?.porcentajeDescuento || 0;

  const mejorDescuento = Math.max(descuentoProducto, descuentoCupon);

  const precioFinal =
    producto.precio - (producto.precio * mejorDescuento) / 100;

  const tieneDescuentoAplicado = mejorDescuento > 0;

  const handleAddToCart = (e) => {
    e.stopPropagation();
    addToCart(producto);
  };

  const productInCart = isInCart(producto.id);
  const quantity = getItemQuantity(producto.id);
  return (
    <Card
      onClick={() => navigate(`/producto/${producto.id}`)}
      sx={{
        cursor: "pointer",
        borderRadius: "2px",
        width: 300,
        height: 420,
        display: "flex",
        flexDirection: "column",
        justifyContent: "space-between",
        m: 2,
        border: tieneOferta ? "2px solid #fd00d3de" : "1px solid #ccc",
        position: "relative",
      }}
    >
      {tieneOferta && (
        <Box
          sx={{
            position: "absolute",
            top: 8,
            left: 8,
            backgroundColor: "#fd00d3de",
            color: "white",
            px: 1,
            py: 0.5,
            fontSize: "0.75rem",
            borderRadius: "2px",
            zIndex: 1,
          }}
        >
          ¡OFERTA!
        </Box>
      )}

      <CardMedia
        component="img"
        height="300"
        image={(() => {
          let imagenes = [];

          try {
            if (typeof producto.imagenes === "string") {
              imagenes = JSON.parse(producto.imagenes);
            } else if (Array.isArray(producto.imagenes)) {
              imagenes = producto.imagenes;
            } else if (producto.imagen) {
              imagenes = [producto.imagen];
            }
          } catch (error) {
            console.warn("Error parseando imágenes:", error);
          }

          if (imagenes.length > 0) {
            const primera = imagenes[0];
            return primera.startsWith("http")
              ? primera
              : `http://localhost:3000/uploads/${primera}`;
          } else {
            return "https://placehold.co/300x200?text=Sin+Imagen";
          }
        })()}
        alt={producto.nombre}
        sx={{
          pt: 1,
          objectFit: "cover",

          width: "70%",
          maxHeight: 250,

          margin: "0 auto",

          display: "block",
        }}
      />

      <CardContent sx={{ flexGrow: 1 }}>
        <Typography variant="subtitle1" noWrap>
          {producto.nombre}
        </Typography>

        {tieneDescuentoAplicado ? (
          <>
            <Typography
              variant="body2"
              color="text.secondary"
              sx={{ textDecoration: "line-through" }}
            >
              ${producto.precio.toFixed(2)}
            </Typography>
            <Typography variant="h6" fontWeight="bold" color="#fd00d3de">
              ${precioFinal.toFixed(2)}
            </Typography>
          </>
        ) : (
          <Typography variant="h6" fontWeight="bold" sx={{ mt: 1 }}>
            ${producto.precio.toFixed(2)}
          </Typography>
        )}

        {votos !== undefined && (
          <Typography variant="h6" fontWeight="bold" sx={{ mt: 1 }}>
            Votos: {votos}
          </Typography>
        )}
      </CardContent>

      <CardActions sx={{ display: "flex", justifyContent: "center", pt: 2 }}>
        <Button
          size="small"
          variant="contained"
          color={productInCart ? "success" : "secondary"}
          onClick={handleAddToCart}
        >
          {productInCart ? `En carrito (${quantity})` : "Agregar al carrito"}
        </Button>
      </CardActions>
    </Card>
  );
};

export default ProductCard;
