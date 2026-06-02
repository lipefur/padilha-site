# padilha.site

Site pessoal pra publicar **páginas avulsas** (planejamentos, brincadeiras, coisas que eu crio e mando pros amigos). Cada página vive num path: `padilha.site/<slug>`.

## No ar agora

- `/` — landing que lista as páginas
- `/rockinrio` — planejamento de compra do Rock in Rio 2026

## Como funciona

- Arquivos estáticos servidos por **nginx** (container), build a partir do `Dockerfile`.
- Hospedado no **Coolify** (projeto isolado **"Padilha Pessoal"**), domínio `padilha.site`, **SSL automático** (Let's Encrypt via Traefik).
- **Roteamento por path**: cada pasta `public/<slug>/index.html` vira `padilha.site/<slug>`. Um único registro DNS cobre todas as páginas — nunca precisa mexer no DNS pra adicionar página nova.

## Adicionar uma página nova

1. Crie a pasta e jogue o HTML como `index.html`:
   ```bash
   mkdir -p public/<slug>
   cp /caminho/da/pagina.html public/<slug>/index.html
   ```
2. (Opcional) adicione um card em [`public/index.html`](public/index.html) apontando pra `/<slug>/`.
3. Commit + push:
   ```bash
   git add . && git commit -m "add <slug>" && git push
   ```
4. O Coolify rebuilda e publica em ~30s.

> **Estrutura:** tudo que é servido fica em `public/`. O `Dockerfile` e o `nginx.conf` são a infra e **não** aparecem no site.

## Arquivos

| Arquivo | Papel |
|---|---|
| `public/index.html` | Landing (lista de páginas) |
| `public/404.html` | Página 404 |
| `public/<slug>/index.html` | Cada página avulsa |
| `Dockerfile` | Imagem nginx que serve `public/` |
| `nginx.conf` | Roteamento limpo, gzip, cache, 404 |
