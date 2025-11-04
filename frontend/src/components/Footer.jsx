import { Box, Container, Typography, IconButton, Grid } from "@mui/material";
import FacebookIcon from "@mui/icons-material/Facebook";
import InstagramIcon from "@mui/icons-material/Instagram";
import TwitterIcon from "@mui/icons-material/Twitter";

const Footer = () => {
  return (
    <Box sx={{ backgroundColor: "#333", color: "white", py: 3 }}>
      <Container maxWidth="lg">
        <Grid container spacing={4}>
          <Grid
            item
            xs={12}
            sm={6}
            md={4}
            sx={{ textAlign: { xs: "center", sm: "left" } }}
          >
            <Typography variant="h6" gutterBottom>
              Contacto
            </Typography>
            <Typography variant="body2" sx={{ mt: 2 }}>
              Email: divinodiseno@gmail.com
            </Typography>
            <Typography variant="body2" sx={{ mt: 1 }}>
              Teléfono: +54 261 662 6117
            </Typography>

            {/* Redes sociales */}
            <Box sx={{ mt: 2 }}>
              <Typography variant="h6" gutterBottom>
                Síguenos
              </Typography>
              <Box
                sx={{
                  display: "flex",
                  justifyContent: { xs: "center", sm: "flex-start" },
                  gap: 1,
                }}
              >
                <IconButton
                  color="inherit"
                  href="https://facebook.com"
                  aria-label="Facebook"
                >
                  <FacebookIcon />
                </IconButton>
                <IconButton
                  color="inherit"
                  href="https://instagram.com"
                  aria-label="Instagram"
                >
                  <InstagramIcon />
                </IconButton>
                <IconButton
                  color="inherit"
                  href="https://twitter.com"
                  aria-label="Twitter"
                >
                  <TwitterIcon />
                </IconButton>
              </Box>
            </Box>
          </Grid>

          <Grid
            item
            xs={12}
            sm={6}
            md={4}
            sx={{ textAlign: { xs: "center", sm: "left" } }}
          >
            <Typography variant="h6" gutterBottom>
              Nuestro local
            </Typography>
            <Typography variant="body2" sx={{ mt: 2 }}>
              Horario de Atención: Lunes a Viernes: 9:00 a 13:00 - 16:30 a
              19:30hs y Sábados de 9:00 a 13:00
            </Typography>
            <Typography variant="body2" sx={{ mt: 1 }}>
              Dirección: Alvear 581, Luján de Cuyo
            </Typography>
            <Typography variant="body2" sx={{ mt: 3 }}>
              Para más información no dudes en contactarnos.
            </Typography>
          </Grid>
        </Grid>

        <Box sx={{ borderTop: "1px solid #555", pt: 3, mt: 4 }}>
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
