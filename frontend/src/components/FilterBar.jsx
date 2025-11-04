import { Box, Button, IconButton, Menu, MenuItem } from "@mui/material";
import { Link } from "react-router-dom";
import MenuIcon from "@mui/icons-material/Menu";
import { useState } from "react";

const menuItems = [
  { label: "Categorías", path: "/categorias" },
  { label: "Nosotros", path: "/nosotros" },
  { label: "Contacto", path: "/contacto" },
  { label: "Docentes", path: "/docentes" },
];

const FilterBar = () => {
  const [anchorEl, setAnchorEl] = useState(null);

  const handleMenuOpen = (event) => setAnchorEl(event.currentTarget);
  const handleMenuClose = () => setAnchorEl(null);

  return (
    <Box
  sx={{
    display: "flex",
    justifyContent: { xs: "flex-start", sm: "center" },
    alignItems: "center",
    width: "100%",
    mx: "auto",
    gap: 5,
    backgroundColor: "info.main",
    py: 1,
    px: 2,
  }}
>
 
  <Box sx={{ display: { xs: "none", sm: "flex" }, gap: 3 }}>
    {menuItems.map((item, i) => (
      <Button
        key={i}
        variant="text"
        color="secondary"
        sx={{
          minWidth: 80,
          fontSize: { xs: "0.8rem", sm: "1rem" },
          fontWeight: "bold",
        }}
        component={Link}
        to={item.path}
      >
        {item.label}
      </Button>
    ))}
  </Box>


  <Box sx={{ display: { xs: "flex", sm: "none" } }}>
    <IconButton color="inherit" onClick={handleMenuOpen}>
      <MenuIcon />
    </IconButton>
    <Menu
      anchorEl={anchorEl}
      open={Boolean(anchorEl)}
      onClose={handleMenuClose}
      keepMounted
    >
      {menuItems.map((item, i) => (
        <MenuItem
          key={i}
          component={Link}
          to={item.path}
          onClick={handleMenuClose}
        >
          {item.label}
        </MenuItem>
      ))}
    </Menu>
  </Box>
</Box>

  );
};

export default FilterBar;
