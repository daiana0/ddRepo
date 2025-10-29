import { Box, Container, Typography, Link, IconButton, Grid } from "@mui/material";
import FacebookIcon from "@mui/icons-material/Facebook";
import InstagramIcon from "@mui/icons-material/Instagram";
import TwitterIcon from "@mui/icons-material/Twitter";

const Footer = () => {
  return (
    <Box sx={{ backgroundColor: "#333", color: "white", py: 3 }}>
      <Container maxWidth="lg">
        {/* Uso de Grid para organizar el contenido en columnas */}
        <Grid container spacing={30}>
          
          {/* Columna 1: Contacto (Existente) */}
          <Grid item xs={12} sm={4}>
            <Typography variant="h6" gutterBottom >
              Contacto
            </Typography>
            <Typography variant="body2" sx={{ mt: 2 }}>
              Email: divinodiseno@gmail.com
            </Typography>
            <Typography variant="body2" sx={{ mt: 1}}>
              Teléfono: +54 261 662 6117
            </Typography>
            
            
            {/* Redes sociales (Movidas dentro de Contacto para mejor organización) */}
            <Box sx={{ mt: 2 }}>
                <Typography variant="h6" gutterBottom>Síguenos</Typography>
                <IconButton color="inherit" href="https://facebook.com" aria-label="Facebook">
                    <FacebookIcon />
                </IconButton>
                <IconButton color="inherit" href="https://instagram.com" aria-label="Instagram">
                    <InstagramIcon />
                </IconButton>
                <IconButton color="inherit" href="https://twitter.com" aria-label="Twitter">
                    <TwitterIcon />
                </IconButton>
            </Box>
          </Grid>
          
                   
          {/* Columna 3: Legal e Información (Nuevo) */}
          <Grid item xs={12} sm={4}>
            <Typography variant="h6" gutterBottom>
              Nuestro local
            </Typography>
            <Typography variant="body2" sx={{ mt: 2 }}>
              Horario de Atención: Lunes a Viernes: 9:00 a 13:00 - 16:30 a 19:30hs Y Sábados de 9:00 a 13:00
            </Typography>
            <Typography variant="body2" sx={{ mt: 1 }}>
              Dirección: Alvear 581, Luján de Cuyo
            </Typography>
            <Typography variant="body2" sx={{ mt: 3 }}>
              Para más información no dudes en contactarnos.
            </Typography>
          </Grid>
        </Grid>

        {/* --- Separador y Copyright --- */}
        <Box sx={{ borderTop: '1px solid #555', pt: 3, mt: 4 }}>
            <Typography
                variant="body2"
                color="inherit" 
                sx={{ textAlign: "center" }}
            >
                © 2025 Divino Diseño - Todos los derechos reservados.
            </Typography>
        </Box>
        
      </Container>
    </Box>
  );
};

export default Footer;