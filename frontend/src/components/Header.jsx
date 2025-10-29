import AppBar from "@mui/material/AppBar";
import Toolbar from "@mui/material/Toolbar";
import Typography from "@mui/material/Typography";
import IconButton from "@mui/material/IconButton";
import MenuIcon from "@mui/icons-material/Menu";
import ShoppingCartIcon from "@mui/icons-material/ShoppingCart";
import Avatar from "@mui/material/Avatar";
import Box from "@mui/material/Box";
import Container from "@mui/material/Container";
import Button from "@mui/material/Button";
import Menu from "@mui/material/Menu";
import MenuItem from "@mui/material/MenuItem";
import { useState } from "react";
import { useAuth } from "../contexts/Auth.context";
import { useCart } from "../contexts/Cart.context";
import LoginModal from "./LoginModal";
import CartModal from "./CartModal";
import { Badge } from "@mui/material";
import logo1 from "../assets/logo1.jpg";
import { Link } from "react-router-dom";
const Header = () => {
  const [anchorEl, setAnchorEl] = useState(null);
  const [loginModalOpen, setLoginModalOpen] = useState(false);
  const [cartModalOpen, setCartModalOpen] = useState(false);
  const { user, logout, isAuthenticated } = useAuth();
  const { getTotalItems } = useCart();
  const handleMenuOpen = (event) => {
    setAnchorEl(event.currentTarget);
  };
  const handleMenuClose = () => {
    setAnchorEl(null);
  };
  const handleLogout = () => {
    logout();
    handleMenuClose();
  };
  return (
    <>
      {/* Añadida la propiedad sx={{ borderRadius: 0 }} al AppBar 
        para anular cualquier radio de borde predeterminado.
      */}
      <AppBar position="static" color="secondary" sx={{ borderRadius: 0 }}>
        
        <Container>
          
          <Toolbar>
            
            {/*Logo y nombre */}
            <Box sx={{ flexGrow: 1, display: "flex", alignItems: "center" }}>
              
              {
                <Link to="/" style={{ textDecoration: "none" }}>
                  
                  <img
                    src={logo1}
                    alt="Logo de Divino Diseño"
                    style={{ height: 80, margin: 16 }}
                  />
                </Link>
              }
              <Typography variant="h6" component="div">
                
                Divino Diseño
              </Typography>
            </Box>
            <Box sx={{ display: "flex", alignItems: "center", ml: 2 }}>
              
              <IconButton
                color="inherit"
                onClick={() => setCartModalOpen(true)}
              >
                
                <Badge badgeContent={getTotalItems()} color="error">
                  
                  <ShoppingCartIcon />
                </Badge>
              </IconButton>
              {isAuthenticated ? (
                <>
                  
                  <IconButton color="inherit" onClick={handleMenuOpen}>
                    
                    <Avatar alt="Usuario" />
                  </IconButton>
                  <Menu
                    anchorEl={anchorEl}
                    open={Boolean(anchorEl)}
                    onClose={handleMenuClose}
                  >
                    
                    <MenuItem onClick={handleMenuClose}>
                      
                      {user?.email}
                    </MenuItem>
                    <MenuItem onClick={handleLogout}> Cerrar Sesión </MenuItem>
                  </Menu>
                </>
              ) : (
                <Button color="inherit" onClick={() => setLoginModalOpen(true)}>
                  
                  Iniciar Sesión
                </Button>
              )}
            </Box>
          </Toolbar>
        </Container>
      </AppBar>
      <LoginModal
        open={loginModalOpen}
        onClose={() => setLoginModalOpen(false)}
      />
      <CartModal open={cartModalOpen} onClose={() => setCartModalOpen(false)} />
    </>
  );
};
export default Header;