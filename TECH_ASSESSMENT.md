# Technical Assessment - Cartola de Ações

## 1. Assessment Overview

### 1.1 Purpose
Evaluate technology options for building a zero-budget fantasy stock market game with the following constraints:
- **Budget:** $0/month (strict requirement)
- **Scale:** 100-1000 users initially
- **Team:** Solo developer / small dev team
- **Timeline:** ~12 weeks to MVP
- **Priority:** Learning, fun, and functionality over perfection

### 1.2 Key Technical Requirements
- End-of-day stock price ingestion (automated)
- User authentication and authorization
- League and portfolio management
- Daily scoring calculations
- Weekly email summaries
- Web-first, mobile-friendly UI
- Open-source friendly

---

## 2. Backend Stack Assessment

### 2.1 Language & Framework Comparison

| Criteria | Kotlin + Spring Boot | Node.js + Express | Python + FastAPI | Go + Gin | Clojure + Ring/Pedestal | AWS Lambda (Node/Python/Go/Java/.NET/custom) |
|----------|---------------------|-------------------|------------------|----------|------------------------|--------------------------|
| **Learning Curve** | Medium-High | Low-Medium | Low | Medium | High | Low-Medium |
| **Development Speed** | Medium | Fast | Very Fast | Medium | Fast (REPL-driven) | Fast |
| **Performance** | High | Medium | Medium | Very High | Medium-High | Medium |
| **Memory Usage** | High (200-500MB) | Low (50-150MB) | Medium (100-200MB) | Very Low (20-50MB) | Medium (100-300MB) | Per-function (128MB-10GB) |
| **Cold Start** | Slow (2-5s) | Fast (<1s) | Fast (1-2s) | Very Fast (<0.5s) | Slow (1-3s) | Medium (0.5-2s) |
| **Type Safety** | Excellent | Good (with TS) | Fair (with hints) | Excellent | Dynamic (spec/malli) | Good (with TS) |
| **Ecosystem** | Large | Huge | Large | Medium | Small but focused | Huge (JS/Python) |
| **Stock Market Libraries** | Good | Good | Excellent | Fair | Good (Java interop) | Good |
| **Job Scheduler** | Built-in | node-cron | APScheduler | Built-in | quartzite | EventBridge |
| **Free Hosting Fit** | Fair | Excellent | Good | Excellent | Fair | Excellent |
| **Community** | Large | Huge | Very Large | Large | Small but dedicated | Huge |
| **Database Fit** | Any | Any | Any | Any | Datomic (natural) | DynamoDB (native) |

### 2.2 Backend Recommendation Matrix

**Choose Kotlin/Spring Boot if:**
- You want enterprise-grade architecture
- You're comfortable with JVM ecosystem
- You want strong typing and null safety
- Memory isn't a concern (Railway $5 credit can handle it)
- You value structure and convention

**Choose Node.js/TypeScript if:**
- You want fast development iteration
- You prefer JavaScript ecosystem
- You need minimal resource usage
- You want the same language as frontend (optional)
- You value flexibility

**Choose Python/FastAPI if:**
- You want excellent stock market libraries (yfinance, pandas)
- You need rapid prototyping
- You might add ML features later
- You want automatic API documentation
- You're most comfortable with Python

**Choose Go if:**
- You prioritize performance and low memory
- You want compiled binaries (easy deployment)
- You like explicit error handling
- You're willing to write more boilerplate
- You want to learn Go

**Choose Clojure if:**
- You value functional programming and immutability
- You want REPL-driven development (live coding)
- You're comfortable with Lisp syntax
- You want access to Java ecosystem
- You want Datomic's immutable database model
- You value data-oriented design

**Choose AWS Lambda if:**
- You want true pay-per-use (no servers to manage)
- You need automatic scaling (0 to 1000s)
- You want to minimize DevOps overhead
- Your workload is event-driven or bursty
- You want generous free tier (1M requests/month)
- You can use AWS-supported runtimes: Node.js, Python, Go, Java, .NET, Ruby, or custom runtimes/containers

### 2.3 Database Comparison

| Database | Free Tier | Best For | Complexity |
|----------|-----------|----------|------------|
| **PostgreSQL** | 500MB-3GB | Structured data, ACID | Low |
| **MySQL** | Similar | Traditional apps | Low |
| **MongoDB** | 512MB | Flexible schema | Medium |
| **SQLite** | Unlimited | Simple apps, local dev | Very Low |
| **Datomic** | Free (with limits) | Immutable data, time-travel | High |
| **DynamoDB** | 25GB + 25 WCU/RCU | Key-value, serverless | Medium |

**Recommendation:** PostgreSQL (or Datomic if using Clojure)
- **PostgreSQL**: Best balance of features and reliability
  - Excellent JSON support (JSONB)
  - Great for time-series data (stock prices)
  - Most free hosting options support it
  - Industry standard for financial data
- **Datomic** (Clojure-specific):
  - Immutable data model (perfect for audit trails)
  - Built-in time-travel queries
  - Datalog query language
  - Free tier available (Datomic Cloud Starter)
  - Natural fit with Clojure's philosophy

---

## 3. Frontend Stack Assessment

### 3.1 Framework Comparison

| Criteria | React | Svelte | Vue 3 | Solid.js |
|----------|-------|--------|-------|----------|
| **Learning Curve** | Medium | Low | Low-Medium | Medium |
| **Bundle Size** | 40-80KB | 10-20KB | 30-50KB | 15-25KB |
| **Performance** | Good | Excellent | Very Good | Excellent |
| **Ecosystem** | Huge | Small | Medium | Very Small |
| **Component Libraries** | Many | Few | Some | Very Few |
| **State Management** | Many options | Built-in | Built-in/Pinia | Built-in |
| **TypeScript Support** | Excellent | Good | Excellent | Excellent |
| **Job Market** | Excellent | Fair | Good | Emerging |
| **SSR/SSG** | Next.js | SvelteKit | Nuxt | SolidStart |

### 3.2 Frontend Recommendation Matrix

**Choose React if:**
- You want the largest ecosystem
- You need many third-party components
- You want transferable skills
- Bundle size isn't critical
- You prefer flexibility in patterns

**Choose Svelte if:**
- You want the best performance
- You value simple, elegant code
- You want fast learning curve
- You like batteries-included approach
- Bundle size matters

**Choose Vue if:**
- You want good documentation
- You like template syntax
- You want progressive enhancement
- You need middle ground between React/Svelte
- You value convention over configuration

**Choose Solid if:**
- You want React-like but faster
- You need fine-grained reactivity
- You're willing to pioneer
- Performance is top priority
- Small community doesn't bother you

### 3.3 UI Component Library Assessment

| Library | Framework | Bundle Impact | Customization | Components | Free |
|---------|-----------|---------------|---------------|------------|------|
| **shadcn/ui** | React/Svelte/Vue | Small | Excellent | ~40 | Yes |
| **DaisyUI** | All (Tailwind) | Small | Good | ~50 | Yes |
| **MUI** | React | Large | Good | Many | Yes |
| **Ant Design** | React | Large | Medium | Many | Yes |
| **PrimeVue** | Vue | Medium | Good | ~80 | Yes |
| **Radix UI** | React | Small | Excellent | ~30 | Yes |

**Recommendation:** shadcn/ui or DaisyUI
- Both are Tailwind-based (no runtime CSS-in-JS)
- Small bundle size
- Highly customizable
- Modern design
- Free and open-source

---

## 4. Hosting & Infrastructure Assessment

### 4.1 Backend Hosting Comparison

| Provider | Free Tier | RAM | Storage | Bandwidth | Cold Starts | Deploy |
|----------|-----------|-----|---------|-----------|-------------|--------|
| **Railway** | $5 credit/mo | 512MB | 1GB | ~500 hrs | Rare | Easy |
| **Render** | 750 hrs/mo | 512MB | - | 100GB | Yes (15min) | Easy |
| **Fly.io** | One-time $5 trial* | 256MB | 3GB | 160GB | Rare | Medium |
| **Vercel** | Generous | 1GB | - | 100GB | Rare | Very Easy |
| **AWS Lambda** | 1M reqs/mo | 128MB-10GB | - | - | Yes (varies) | Medium |
| **Oracle Cloud** | 2 VMs | 1GB | 200GB | 10TB | Never | Hard |
| **Self-hosted (local Docker)** | N/A | Your machine | Your disk | Your uplink | Never | Medium |

*Fly.io gives a one-time ~$5 trial credit for new accounts; afterward it is pure PAYG. Bills under ~$5 are often waived as a courtesy. Requires credit card.

Self-hosted (local Docker):
- $0 infra cost if you run on your own machine
- Must keep the machine on and connected
- You manage security, backups, monitoring, and uptime

**Recommendation for Backend:**
1. **Railway** (Best DX, reasonable free tier, no surprises)
2. **AWS Lambda** (Best for true serverless, 1M requests free)
3. **Fly.io** (PAYG with one-time ~$5 trial credit; requires card; sub-$5 bills often waived)
4. **Render** (Easy but cold starts are annoying)

### 4.4 Zero-Cost Hybrid: BFF + Self-Hosted Workers

Goal: keep a lightweight "frontend/BFF" always-online at $0 while running data ingestion and report generation on a self-hosted box you control.

Architecture summary:
- Module A – Frontend/BFF (always up, $0):
  - Serves the web UI and exposes a thin read-only API for the app.
  - Pulls pre-computed data from the database; no heavy compute here.
  - Caches frequently-read data in-memory or at the edge.
  - Hosting options (free):
    - Cloudflare Pages + Functions/Workers (best fit for $0, global edge, great limits)
    - Vercel Free (excellent DX; keep functions light)
    - Netlify Free (similar to Vercel)

- Module B – Self-hosted Worker (cron + ETL + reports):
  - Runs scheduled jobs to fetch market data, perform ETL, compute scores, and generate reports.
  - Pushes results into the shared database and/or publishes static artifacts.
  - Runs on your own hardware (Docker/Compose). Outbound-only networking; no public ingress required.
  - Scheduling options: system cron, Docker cron container, or a single long-lived process with an internal scheduler (e.g., APScheduler/node-cron/quartz).

- Shared Data Layer (free tier):
  - Primary: PostgreSQL (Neon 3GB free or Supabase 500MB free).
  - Artifacts: avoid object storage initially; store compact JSON/CSV in Postgres, or publish static pages to the frontend host (Pages/Vercel) during CI.
  - Optional cache/queue: Upstash Redis free tier (for small pub/sub or job signals), or skip and rely on DB polling.

Data flow:
1) Worker fetches EOD quotes from Yahoo Finance/brapi.dev, computes aggregates/scores.
2) Worker upserts normalized rows into Postgres (idempotent writes).
3) BFF queries Postgres and serves pre-computed views to the UI with aggressive caching.

Security & ops:
- Use a service account for the worker with least-privilege DB role.
- Keep the DB endpoint public but protected by strong auth; if available, restrict by IP range or use Neon/Supabase network controls.
- Secrets via .env on the worker host; rotate periodically.
- Monitoring: UptimeRobot for the BFF, provider logs for functions; simple local logs for the worker.

Cost profile ($0 target):
- Frontend/BFF on Cloudflare Pages/Vercel: $0 within free limits.
- Database on Neon/Supabase free tier: $0 while under storage/connection quotas.
- Self-hosted worker: $0 cloud spend (uses your machine and power).

Trade-offs:
- Your machine’s uptime becomes the source-of-truth for new data; the site remains online even if the worker is offline, but data will lag.
- No managed scheduler/queues at first; simpler but fewer guarantees.
- Free DB tiers have storage/connection limits—design queries and indexes accordingly.

Scale/migration path:
- Move the worker to a hosted scheduler when needed (choices: Railway cron, Fly.io Machines, GitHub Actions nightly, or AWS EventBridge + Lambda). BFF stays unchanged.
- Add a queue later (Upstash Redis → paid; AWS SQS → minimal cost) if you need retries and DLQs.
- Introduce object storage/CDN when report artifacts get large.

### 4.2 Database Hosting Comparison

| Provider | Free Tier | Storage | Connections | Backups | Uptime SLA |
|----------|-----------|---------|-------------|---------|------------|
| **Supabase** | 500MB | 500MB | Unlimited API | Daily | None |
| **Neon** | 3GB | 3GB | Limited | Point-in-time | None |
| **Railway** | Included | 1GB | Varies | Manual | None |
| **PlanetScale** | Was free | - | - | - | Discontinued |
| **CockroachDB** | 5GB | 5GB | Good | Auto | None |

**Recommendation:**
1. **Neon** (Best free tier - 3GB)
2. **Supabase** (Great features, Auth included)
3. **Railway** (Keep everything in one place)

### 4.3 Frontend Hosting Comparison

| Provider | Free Tier | Bandwidth | Build Minutes | Custom Domain | Edge |
|----------|-----------|-----------|---------------|---------------|------|
| **Vercel** | 100GB | 100GB | 6000 min | Yes | Yes |
| **Netlify** | 100GB | 100GB | 300 min | Yes | Yes |
| **Cloudflare Pages** | Unlimited | Unlimited | 500 builds/mo | Yes | Yes |
| **GitHub Pages** | 100GB | 100GB | N/A | Yes | No |

**Recommendation:** Vercel or Cloudflare Pages
- Vercel: Best DX for React/Next.js
- Cloudflare Pages: Best if you need more builds

---

## 5. Stock Market Data API Assessment

### 5.1 Free Data Sources Comparison

| Provider | Free Tier | Markets | Data Types | Delay | API Key | Reliability |
|----------|-----------|---------|------------|-------|---------|-------------|
| **Yahoo Finance** | Unlimited* | Global | Price, dividends | 15min | No | High |
| **Brapi.dev** | 500 req/day | B3 only | Price, fundamentals | EOD | Yes | Medium |
| **Alpha Vantage** | 25 req/day | Global | Price, fundamentals | EOD | Yes | High |
| **Twelve Data** | 800 req/day | Global | Price, forex, crypto | 15min | Yes | Medium |
| **Finnhub** | 60 req/min | Global | Price, news, sentiment | Real-time | Yes | High |
| **Polygon.io** | Limited | US only | Price, options | 15min | Yes | High |

*Yahoo Finance has no official API, accessed via libraries

### 5.2 Data Source Strategy

**Recommended Approach:**
```
Primary: Yahoo Finance (via yfinance or node library)
├─ No API key needed
├─ Global coverage including B3
├─ Historical data available
└─ Most reliable for MVP

Backup: Brapi.dev (for B3 validation)
├─ Brazilian-focused
├─ 500 requests = 100 stocks × 5 times/day
└─ Good for cross-validation

Future: Alpha Vantage (when scaling)
├─ More structured API
├─ Better documentation
└─ Can rotate multiple API keys
```

**Data Caching Strategy:**
- Fetch end-of-day prices once daily (8 PM BRT)
- Cache for 24 hours
- 50 stocks × 1 request/day = 50 requests/day (well within limits)

---

## 6. Email Service Assessment

| Provider | Free Tier | Daily Limit | Monthly Limit | API Quality | SMTP |
|----------|-----------|-------------|---------------|-------------|------|
| **MailerSend** | 12k/month | 400/day | 12,000 | Excellent | Yes |
| **Resend** | 3k/month | 100/day | 3,000 | Excellent | Yes |
| **SendGrid** | 100/day | 100 | 3,000 | Good | Yes |
| **Brevo** | 300/day | 300 | 9,000 | Good | Yes |
| **Mailgun** | 5k/month | - | 5,000 | Good | Yes |

**Calculation for 100 users:**
- Weekly summaries: 100 users × 4 weeks = 400 emails/month
- Season notifications: ~200 emails/season
- Total: ~600-800 emails/month

**Recommendation:** MailerSend or Resend
- Both have modern APIs
- Excellent deliverability
- Good free tiers
- Great documentation

---

## 7. Development Tools Assessment

### 7.1 Essential Tools (All Free)

| Category | Tool | Purpose | Free Tier |
|----------|------|---------|-----------|
| **Version Control** | GitHub | Code repository | Unlimited public |
| **CI/CD** | GitHub Actions | Automation | 2,000 min/mo |
| **Monitoring** | UptimeRobot | Uptime checks | 50 monitors |
| **Errors** | Sentry | Error tracking | 5k events/mo |
| **Logs** | BetterStack | Log aggregation | 1GB/mo |
| **Analytics** | Plausible / Umami | Privacy-first | Self-hosted free |
| **API Docs** | Swagger/Redoc | API documentation | Self-hosted |

### 7.2 Optional Tools

| Tool | Purpose | Free? | Worth It? |
|------|---------|-------|-----------|
| **Postman** | API testing | Yes | For manual testing |
| **k6** | Load testing | Yes | Before launch |
| **Docker** | Containerization | Yes | Deployment consistency |
| **Grafana** | Dashboards | Yes | When scaling |
| **Redis** | Caching | Railway addon | Post-MVP |

---

## 8. Recommended Tech Stack Combinations

### 8.1 Option A: "Modern Full-Stack JS"
**Best for:** Fast development, one language, great DX

```
Frontend: React + Vite + shadcn/ui + Tailwind
Backend:  Node.js + Express + TypeScript + Prisma
Database: PostgreSQL (Neon)
Data:     Yahoo Finance (via node library)
Host:     Vercel (frontend) + Railway (backend)
Email:    MailerSend
```

**Pros:**
- Fast development (same language)
- Huge ecosystem
- Great free hosting options
- Familiar to most devs

**Cons:**
- Less structured than Spring Boot
- TypeScript adds some complexity
- Not as type-safe as Kotlin/Go

### 8.2 Option B: "Performance First"
**Best for:** Learning Go, optimal resource usage

```
Frontend: Svelte + SvelteKit + DaisyUI
Backend:  Go + Gin + sqlc
Database: PostgreSQL (Neon)
Data:     Yahoo Finance (via go library)
Host:     Vercel (frontend) + Fly.io (backend)
Email:    Resend
```

**Pros:**
- Excellent performance
- Very low memory usage
- Fast cold starts
- Compiled binaries (easy deploy)

**Cons:**
- More verbose Go code
- Smaller ecosystem
- Steeper learning curve

### 8.3 Option C: "Python Data Focus"
**Best for:** Stock data manipulation, rapid prototyping

```
Frontend: Vue 3 + Vite + PrimeVue
Backend:  Python + FastAPI + SQLAlchemy
Database: PostgreSQL (Supabase)
Data:     yfinance + pandas
Host:     Netlify (frontend) + Railway (backend)
Email:    Brevo
```

**Pros:**
- Excellent data libraries
- Fast prototyping
- Great for stock analysis
- Auto-generated API docs

**Cons:**
- Async support still maturing
- Slower than Go/Node
- Type hints optional

### 8.4 Option D: "Enterprise Ready"
**Best for:** Structure, maintainability, learning Spring

```
Frontend: React + Next.js + Radix UI + Tailwind
Backend:  Kotlin + Spring Boot + Exposed/jOOQ
Database: PostgreSQL (Railway)
Data:     Yahoo Finance (via kotlin library)
Host:     Vercel (frontend) + Railway (backend)
Email:    MailerSend
```

**Pros:**
- Strong architecture patterns
- Excellent type safety
- Great for large codebases
- Spring ecosystem

**Cons:**
- Higher memory usage
- Slower cold starts
- More boilerplate

### 8.5 Option E: "Functional & Immutable"
**Best for:** Functional programming enthusiasts, data-first design, audit trails

```
Frontend: Reagent (ClojureScript) or React + Vite
Backend:  Clojure + Ring/Pedestal + Reitit
Database: Datomic Cloud Starter (or PostgreSQL)
Data:     Yahoo Finance (via Java interop)
Host:     Railway or AWS (if using Datomic Cloud)
Email:    MailerSend
```

**Pros:**
- Immutable data structures (perfect for financial data)
- REPL-driven development (live coding)
- Datomic time-travel queries (audit any historical state)
- Datalog queries (powerful data modeling)
- Simple, data-oriented design
- Java interop (access entire JVM ecosystem)

**Cons:**
- Steeper learning curve (Lisp syntax)
- Smaller community and ecosystem
- Harder to hire developers
- Slower cold starts
- Limited hosting options for Datomic

### 8.6 Option F: "Serverless AWS"
**Best for:** Minimal ops, auto-scaling, pay-per-use

```
Frontend: React + Vite + shadcn/ui (S3 + CloudFront)
Backend:  AWS Lambda (Node.js/Python/Go/Java/.NET or custom runtime) + API Gateway
Database: DynamoDB or Aurora Serverless
Data:     Yahoo Finance (via Lambda function)
Host:     AWS (all services)
Email:    SES (Simple Email Service)
Scheduler: EventBridge (cron jobs)
```

**Pros:**
- True serverless (zero server management)
- Generous free tier (1M Lambda requests/month)
- Auto-scales from 0 to massive
- Pay only for what you use
- Native AWS integrations

**Cons:**
- Vendor lock-in to AWS
- Cold starts for Lambda functions
- More complex architecture (many services)
- DynamoDB requires different data modeling
- Harder to test locally

---

## 9. Decision Framework

### 9.1 Choose Based On Your Goals

**If you want to learn:**
- Go → Option B (Performance First)
- Modern JS → Option A (Full-Stack JS)
- Data Science → Option C (Python Focus)
- Enterprise patterns → Option D (Spring Boot)
- Functional programming → Option E (Clojure + Datomic)
- Serverless architecture → Option F (AWS Lambda)

**If you want speed to MVP:**
- Fastest: Option A, C, or F
- Most structured: Option D
- Best performance: Option B
- Most innovative: Option E (REPL-driven)

**If you prioritize free tier fit:**
- Best fit: Option A or F (lowest cost)
- Most headroom: Option B (Go uses least resources)
- Most integrated: Option C (Supabase) or F (AWS ecosystem)
- Best for scaling: Option F (serverless auto-scales)

**If you value specific paradigms:**
- Immutability & time-travel: Option E (Datomic)
- Event-driven: Option F (Lambda + EventBridge)
- Traditional OOP: Option D (Spring Boot)
- Data-first: Option C (Python + pandas) or E (Clojure)

### 9.2 Risk Assessment

| Risk | Mitigation |
|------|------------|
| **Free tier limits exceeded** | Monitor usage, cache aggressively, use multiple services |
| **Data source becomes unreliable** | Implement fallback sources, daily validation |
| **Cold starts affect UX** | Choose Railway/AWS Lambda provisioned concurrency, or use cron jobs to keep warm |
| **Scaling beyond free tier** | Design for vertical scaling, all options scale well |
| **Time to MVP exceeds estimate** | Start with most familiar stack, don't learn everything new |
| **Vendor lock-in (AWS)** | Use abstraction layers, consider multi-cloud from start, or accept trade-off for simplicity |
| **Datomic learning curve** | Start with PostgreSQL, migrate later if needed |

---

## 10. Final Recommendations

### 10.1 For This Project Specifically

**Recommended: Option A (Modern Full-Stack JS)**

**Reasoning:**
1. **Speed to MVP:** TypeScript/Node.js is fastest to develop
2. **Free tier fit:** Low memory usage, works great on Railway
3. **Stock data:** Good libraries available (yahoo-finance2)
4. **One language:** Easier context switching
5. **Ecosystem:** Largest, most resources for any problem
6. **Deployment:** Simplest path to production

**Stack:**
```yaml
Frontend:
  - Framework: React + Vite
  - UI: shadcn/ui + Tailwind CSS
  - State: Zustand or TanStack Query
  - Forms: React Hook Form
  - Routing: React Router

Backend:
  - Runtime: Node.js 20 LTS
  - Framework: Express + TypeScript
  - ORM: Prisma
  - Validation: Zod
  - Auth: JWT + bcrypt

Database:
  - Engine: PostgreSQL 15
  - Host: Neon (3GB free)
  - Migrations: Prisma Migrate

Infrastructure:
  - Backend: Railway ($5 credit/month)
  - Frontend: Vercel (free tier)
  - Email: MailerSend (12k emails/month)
  - Data: Yahoo Finance (unlimited)
  - Monitoring: UptimeRobot (50 monitors)

Development:
  - VCS: GitHub
  - CI/CD: GitHub Actions
  - Package Manager: pnpm
  - Code Quality: ESLint + Prettier
  - Testing: Vitest + Playwright
```

### 10.2 Alternative if You Prefer Kotlin

If you prefer Kotlin/Spring Boot, use:
- Frontend: React + Vite (same as above)
- Backend: Kotlin + Spring Boot + Exposed
- Database: PostgreSQL on Railway (keep it simple)
- Everything else same as Option A

**Trade-off:** Higher memory usage but more structured code.

---

## 11. Implementation Phases

### Phase 1: Foundation (Week 1-2)
- [ ] Set up monorepo structure
- [ ] Configure database (Neon/Railway)
- [ ] Basic auth (register/login/JWT)
- [ ] Deploy pipeline (GitHub Actions)

### Phase 2: Core Features (Week 3-6)
- [ ] Stock data ingestion job
- [ ] Portfolio CRUD
- [ ] League management
- [ ] Buy/sell functionality

### Phase 3: Scoring (Week 7-8)
- [ ] Daily scoring calculation
- [ ] Ranking algorithm
- [ ] Leaderboard UI

### Phase 4: Polish (Week 9-12)
- [ ] Email summaries
- [ ] Season management
- [ ] UI/UX refinement
- [ ] Testing & bug fixes

---

## 12. Cost Projection

### 12.1 Free Tier Limits

**Option A/B/C/D (Traditional Hosting):**
| Service | Free Tier | Expected Usage | Headroom |
|---------|-----------|----------------|----------|
| Railway | $5 credit | ~$3-4/month | Good |
| Neon DB | 3GB | ~100MB | Excellent |
| Vercel | Unlimited | 10GB/month | Excellent |
| MailerSend | 12k/month | 800/month | Excellent |
| Stock Data | Varies | 50 req/day | Excellent |

**Total Cost: $0/month** (stays within all free tiers)

**Option E (Clojure + Datomic):**
| Service | Free Tier | Expected Usage | Headroom |
|---------|-----------|----------------|----------|
| Railway | $5 credit | ~$3-4/month | Good |
| Datomic Cloud Starter | Free | Small DB | Good |
| Vercel | Unlimited | 10GB/month | Excellent |
| MailerSend | 12k/month | 800/month | Excellent |

**Total Cost: $0/month** (Datomic Starter is free but limited)

**Option F (AWS Serverless):**
| Service | Free Tier | Expected Usage | Headroom |
|---------|-----------|----------------|----------|
| Lambda | 1M requests/mo | ~100k/month | Excellent |
| API Gateway | 1M requests/mo | ~100k/month | Excellent |
| DynamoDB | 25GB + 25 WCU/RCU | ~1GB + low traffic | Excellent |
| S3 | 5GB | ~100MB | Excellent |
| CloudFront | 1TB + 10M requests | Low | Excellent |
| SES | 62k emails/mo* | 800/month | Excellent |

*When called from EC2/Lambda. Note: Requires verification and reputation building.

**Total Cost: $0/month** (stays within generous AWS free tier)

### 12.2 Scaling Triggers

**Traditional Hosting (Options A-E):**
- **100+ users**: Still free
- **500+ users**: Might need Railway Pro ($5/month) or switch to Fly.io
- **1000+ users**: Need paid DB ($25/month for Neon Pro)
- **5000+ users**: Need CDN, caching (~$50/month total)

**AWS Serverless (Option F):**
- **100+ users**: Still free (excellent auto-scaling)
- **500+ users**: Still likely free (~$0-5/month)
- **1000+ users**: ~$10-20/month (Lambda + DynamoDB)
- **5000+ users**: ~$50-100/month (still cheaper than traditional at scale)

**Datomic Considerations (Option E):**
- Datomic Cloud Starter is free but limited
- Datomic Cloud Production starts at ~$50/month
- Consider PostgreSQL for MVP, migrate to Datomic later if desired

---

## 13. Next Steps

1. **Choose your stack** (Options: A=JS, B=Go, C=Python, D=Kotlin, E=Clojure, F=AWS Lambda)
2. **Set up development environment**
3. **Create database schema**
4. **Build authentication**
5. **Start with stock data ingestion**

**Decision Timeline:**
- Stack choice: Now
- Setup complete: Week 1
- First feature: Week 2
- MVP: Week 12

**Key Considerations for Choice:**
- **Familiarity**: Choose what you know best for speed
- **Learning goals**: Pick what you want to learn
- **Budget sensitivity**: All options are $0/month for MVP
- **Long-term vision**: Consider maintenance and scaling
- **Philosophy**: FP (Clojure), OOP (Kotlin), pragmatic (Node/Python), performance (Go), serverless (Lambda)

---

## 14. Resources & References

### Documentation
- [Railway Docs](https://docs.railway.app/)
- [Neon Docs](https://neon.tech/docs)
- [Vercel Docs](https://vercel.com/docs)
- [Prisma Docs](https://www.prisma.io/docs)
- [AWS Lambda Docs](https://docs.aws.amazon.com/lambda/)
- [Datomic Docs](https://docs.datomic.com/)
- [Clojure Guides](https://clojure.org/guides/getting_started)
- [Fly.io Docs](https://fly.io/docs/)

### Libraries
**Node.js:**
- [yahoo-finance2](https://github.com/gadicc/node-yahoo-finance2)
- [Brapi.dev API](https://brapi.dev/)

**Clojure:**
- [Ring](https://github.com/ring-clojure/ring) - Web server
- [Reitit](https://github.com/metosin/reitit) - Routing
- [next.jdbc](https://github.com/seancorfield/next-jdbc) - Database
- [Datomic Cloud](https://docs.datomic.com/cloud/)
- [clj-http](https://github.com/dakrone/clj-http) - HTTP client

**AWS Lambda:**
- [Serverless Framework](https://www.serverless.com/)
- [AWS SAM](https://aws.amazon.com/serverless/sam/)
- [AWS CDK](https://aws.amazon.com/cdk/)

**Frontend:**
- [shadcn/ui](https://ui.shadcn.com/)
- [Reagent](https://reagent-project.github.io/) - ClojureScript + React

### Learning Resources
- [Node.js Best Practices](https://github.com/goldbergyoni/nodebestpractices)
- [System Design Primer](https://github.com/donnemartin/system-design-primer)
- [Clojure for the Brave and True](https://www.braveclojure.com/)
- [Learn Datomic Today](https://www.learndatalogtoday.org/)
- [AWS Serverless Workshops](https://aws.amazon.com/serverless/workshops/)
- [The Clojure Style Guide](https://github.com/bbatsov/clojure-style-guide)
