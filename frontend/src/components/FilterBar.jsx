import { Box, Button } from "@mui/material";
import { Link } from "react-router-dom";

const menuItems = [
  { label: "Categorías", path: "/categorias" },
  { label: "Nosotros", path: "/nosotros" },
  { label: "Contacto", path: "/contacto" },
  { label: "Docentes", path: "/docentes" }
];

const FilterBar = () => {
  return (
    <Box
      sx={{
        display: "flex",
        justifyContent: "center", // centra los botones
        alignItems: "center",
        width: "100%",             
        mx: "auto",               
        gap: 5,                   
        backgroundColor: "info.main", 
        py: 1,                    
      }}
    >
      {menuItems.map((item, i) => (
        <Button
          key={i}
          variant="text"
          color="secondary"
          sx={{ 
            minWidth: 80,          
            fontSize: "1rem",      
            fontWeight: "bold",    
          }}
          component={Link}
          to={item.path}
        >
          {item.label}
        </Button>
      ))}
    </Box>
  );
};

export default FilterBar;
