# padilha.site — servidor estático (nginx) para páginas avulsas.
# Build/deploy gerenciado pelo Coolify (projeto isolado "Padilha Pessoal").
FROM nginx:1.27-alpine

# Substitui a config padrão pela nossa (roteamento limpo + 404 + gzip + cache).
RUN rm -f /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/padilha.conf

# Conteúdo servido. Cada página vive em public/<slug>/index.html
COPY public/ /usr/share/nginx/html/

EXPOSE 80
