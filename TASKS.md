# Tasks - Cartola de Ações (Dia Atual)

## Decisões Finais
- Frontend: Cloudflare Pages (Vite React + TS, Tailwind v4, shadcn/ui, Redux Toolkit + RTK Query, React Hook Form)
- Backend: NestJS em Oracle Cloud Always Free (integra Supabase Postgres + Supabase Auth)
- Worker: Go (cron) rodando em Oracle VM (Docker)
- DB & Auth: Supabase (Postgres + Auth) com RLS desde o início

## Frontend
- [ ] Configurar Redux store + RTK Query base
- [ ] Criar tema Tailwind + shadcn/ui (cores, tipografia)
- [ ] Páginas: Home, Login, Leaderboard (placeholders)
- [ ] Componente de formulário com React Hook Form
- [ ] Pipeline: Deploy automático no Cloudflare Pages

## Backend (NestJS)
- [ ] Scaffold NestJS (controllers: health, auth, leagues, portfolio, scores)
- [ ] Validar JWT de Supabase (guard) e mapear `user_id`
- [ ] OpenAPI (Swagger) e padrão de erros
- [ ] Client Supabase (service-role apenas no backend)
- [ ] CI: build/test e deploy para Oracle VM

## Worker (Go)
- [ ] Projeto Go com módulo `worker-go/`
- [ ] Job EOD: fetch Yahoo/brapi, normalizar, upsert em Supabase
- [ ] Idempotência, retry/backoff; logs JSON
- [ ] Dockerfile + cron provisioning na Oracle VM
- [ ] Script de backfill por intervalo de datas

## Banco de Dados (Supabase)
- [ ] Esquema inicial (rascunho): `stocks`, `prices_eod`, `leagues`, `memberships`, `portfolios`, `transactions`, `scores`
- [ ] Habilitar RLS e políticas mínimas por tabela
- [ ] Índices para consultas do leaderboard e histórico

## Infra, Segurança e Observabilidade
- [ ] DNS Cloudflare; proxy/reverse (Caddy/Nginx) na Oracle VM
- [ ] `.env` por módulo; sem commits de segredos
- [ ] UptimeRobot (backend) e Sentry (erros) free
- [ ] Correlation IDs entre frontend → backend → worker

## Comandos Úteis
```bash
# Frontend
cd cartola-de-acoes-vite-frontend
pnpm dev

# Backend (placeholder)
# nest new backend  # ou scaffold manual

# Worker (placeholder)
# mkdir worker-go && go mod init top-hat-company/cartola-worker && go run ./...
```

## Próximo Checkpoint
- Validar scaffold do backend e worker
- Definir o esquema mínimo e RLS inicial em Supabase
