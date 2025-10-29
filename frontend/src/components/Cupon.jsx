import React, { useContext } from "react";
import { CuponContext } from "../contexts/Cupon.context";
import { Box, Input, Button, Typography } from "@mui/material";

function Cupon() {
  const {
    codigoIngresado,
    setCodigoIngresado,
    validarCupon,
    cupon,
    quitarCupon,
    mensaje,
  } = useContext(CuponContext);

  return (
    <Box sx={{  p: 1, backgroundColor: "#6A0DAD"  }}>
      <Input
        sx={{ m: 1, pl: 2, backgroundColor: "white" }}
        type="text"
        placeholder="Ingrese cupón"
        value={codigoIngresado}
        onChange={(e) => setCodigoIngresado(e.target.value)}
      />
      <Button variant="contained" onClick={validarCupon}>
        Aplicar Cupón
      </Button>
      {cupon && (
        <Button variant="contained" onClick={quitarCupon}>
          Quitar Cupón
        </Button>
      )}
      <Typography>{mensaje}</Typography>
    </Box>
  );
}

export default Cupon;
