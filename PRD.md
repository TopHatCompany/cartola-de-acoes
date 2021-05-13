# Product Requirements Document - Cartola de Ações

## 1. Overview

### 1.1 Product Name
**Cartola de Ações** (Stock Fantasy Game)

### 1.2 Vision
A fantasy stock market game for friends where players compete using virtual money, forming portfolios of real stocks, scored over custom seasons.

### 1.3 Core Principles
- **Fun-first** with incidental learning
- **No gambling** - No real money, fantasy money only
- **No real-time trading** - End-of-day prices only
- **Fairness over realism** - Same assumptions for everyone
- **Open-source** side project

### 1.4 Target Audience
- Dev friends
- People interested in stocks and friendly competition
- Users comfortable with web interfaces

---

## 2. Core Functionality

### 2.1 Portfolio Management

#### Starting Capital
- Every player starts with a **fixed virtual capital** amount
- Capital is reset at the beginning of each season

#### Trading Rules
- **Whole shares only** - No fractional shares
- **No draft system** - Same stock can be owned by everyone
- **Portfolio changes only at defined intervals** (e.g., weekly)
- Players can buy and sell during trading windows

#### Stock Availability
- Only markets we can automatically track
- Only stocks with reliable data sources

### 2.2 Scoring System

#### Score Calculation
- **Score = Absolute Return**
  - Price appreciation (share price changes)
  - Dividends received
- Simple, transparent calculation

#### Special Cases
- If a company is **delisted or goes bankrupt**: heavy penalty or zero value
- All players use the same assumptions:
  - Broker fees (standardized)
  - Taxes (standardized)
  - Market hours
  - Holidays

### 2.3 Seasons & Competition

#### Season Structure
- **Custom-length seasons** (defined by league admin)
- Rankings **reset every season**
- No historical replay (not in MVP)

#### Rewards System
- At season end: **Global ranking** calculated
- **Top 10 players** gain rewards/advantages for next season
- F1-style championship format

### 2.4 Leagues & Social

#### League Types
- **Public leagues** - Anyone can join
- **Private leagues** - Invite-only

#### Visibility
- Players can see:
  - Rankings (leaderboard)
  - Other players' portfolios
  - Performance metrics

#### Communication
- **Weekly summaries** (email/dashboard)
- **No chat** - No trash talk features
- Keeps moderation and complexity at zero

---

## 3. Technical Requirements

### 3.1 Platform
- **Web-first** application
- **Mobile-friendly UI** (responsive design)
- PWA maybe later
- **No native apps** (intentionally out of scope)

### 3.2 Architecture
- Open-source codebase
- Backend-heavy design
- Technology stack to be chosen (see [TECH_ASSESSMENT.md](TECH_ASSESSMENT.md) for detailed evaluation)

### 3.3 Market Data
- **End-of-day prices only** (no real-time)
- Automated data ingestion
- Reliable price source for:
  - Stock prices
  - Dividends
  - Corporate actions (splits, delistings)

---

## 4. MVP Scope

### 4.1 ✅ MVP INCLUDES

**User Management**
- User account creation and authentication
- User profile management

**League Management**
- League creation (public/private)
- Join/leave leagues
- League settings (season length, intervals, starting capital)

**Portfolio Management**
- Fixed starting capital per season
- Buy/sell stocks at fixed intervals
- View portfolio composition and value
- Transaction history

**Data & Scoring**
- End-of-day price ingestion
- Automatic scoring calculation
- Dividend tracking

**Rankings & Competition**
- Real-time ranking calculation
- Leaderboard display
- Season end processing
- Season reset functionality

**Notifications**
- Weekly summary (dashboard view minimum)
- Season end notifications

### 4.2 ❌ MVP EXCLUDES (Intentionally Out of Scope)

**Trading Features**
- Real-time prices
- Draft system
- Captain stocks / boosts / wildcards
- Fractional shares
- Short selling
- Options/derivatives

**Advanced Features**
- Historical replay of past seasons
- Advanced risk metrics (Sharpe ratio, beta, etc.)
- Portfolio analysis tools
- AI recommendations

**Social Features**
- Chat functionality
- Trash talk features
- Social feeds
- Achievements/badges

**Platform**
- Mobile native apps (iOS/Android)
- Desktop applications

**Financial**
- Any real-money mechanics
- Real trading integration
- Financial advice

---

## 5. User Stories

### 5.1 As a Player

**Account & Setup**
- I want to create an account so I can play the game
- I want to join a league so I can compete with friends
- I want to see my starting capital so I know my budget

**Trading**
- I want to search for stocks so I can find companies to invest in
- I want to buy stocks during trading windows so I can build my portfolio
- I want to sell stocks I own so I can reallocate my capital
- I want to see my transaction history so I can track my decisions

**Performance**
- I want to see my current portfolio value so I know how I'm doing
- I want to see my ranking in the league so I know my position
- I want to see other players' portfolios so I can learn from them
- I want to receive weekly summaries so I stay engaged

**Season Management**
- I want to see when the season ends so I can plan accordingly
- I want to see my final rank at season end so I know how I performed
- I want to start a new season so I can compete again

### 5.2 As a League Admin

**League Creation**
- I want to create a private league so I can play with specific friends
- I want to set season length so the game fits our schedule
- I want to set trading intervals so players can plan their time
- I want to set starting capital so we have consistent rules

**Management**
- I want to invite players to my private league so friends can join
- I want to start a new season so we can keep playing
- I want to see league-wide statistics so I can share highlights

---

## 6. Data Model (Preliminary)

### 6.1 Core Entities

**User**
- id, email, username, password_hash
- created_at, updated_at

**League**
- id, name, is_public, admin_user_id
- starting_capital, trading_interval
- created_at, updated_at

**Season**
- id, league_id, season_number
- start_date, end_date, status (active/completed)
- created_at, updated_at

**Portfolio**
- id, user_id, season_id
- current_cash, total_value
- last_updated

**Position**
- id, portfolio_id, stock_symbol
- quantity, average_price
- created_at, updated_at

**Transaction**
- id, portfolio_id, stock_symbol
- type (buy/sell), quantity, price
- transaction_date, created_at

**Stock**
- symbol, name, exchange
- last_price, last_updated

**StockPrice** (historical)
- stock_symbol, date
- open, close, high, low, volume
- dividends

---

## 7. Non-Functional Requirements

### 7.1 Performance
- Dashboard load time: < 2 seconds
- Price ingestion: Daily automated job
- Ranking calculation: < 5 seconds for 100 players

### 7.2 Scalability
- Support 1000 concurrent users (initial target)
- Support 100 players per league
- Support 50+ stocks per portfolio

### 7.3 Reliability
- 99% uptime for web application
- Automated data ingestion with retry logic
- Data backup daily

### 7.4 Security
- Secure authentication (password hashing)
- No financial data stored
- Rate limiting on API endpoints

---

## 8. Future Considerations (Post-MVP)

### 8.1 Phase 2 Features (Potential)
- Historical season replay and analysis
- More sophisticated reward systems
- Portfolio analytics and insights
- Mobile PWA optimization
- Multiple market support (B3, NYSE, etc.)

### 8.2 Advanced Features (Maybe)
- Captain stock (double scoring)
- Bench slots (owned but not scoring)
- Wildcard (free rebalance once per season)
- Risk metrics and educational content
- Portfolio sharing and comparisons

### 8.3 Community Features (If Needed)
- Public leaderboards across all leagues
- Community-curated stock lists
- Seasonal tournaments

---

## 9. Success Metrics

### 9.1 Engagement
- Weekly active users
- Average sessions per week
- Season completion rate

### 9.2 Adoption
- Number of leagues created
- Average players per league
- User retention season-over-season

### 9.3 Technical
- System uptime
- Data ingestion success rate
- Average response time

---

## 10. Tech Stack

Technology choices are intentionally kept out of the PRD. See [TECH_ASSESSMENT.md](TECH_ASSESSMENT.md) for the full evaluation (options include Node.js, Go, Python, Kotlin, Clojure/Datomic, AWS Lambda, and hosting trade-offs). The PRD focuses on product scope; final tech decisions remain open.

---

## 11. Open Questions & Decisions Needed

### 11.1 Data Source
- [ ] Which market(s) to support first? (B3 for Brazilian stocks?)
- [ ] Which API/service for price data? (Recommendation: Start with Yahoo Finance + Brapi.dev)
- [ ] How to handle dividends and corporate actions? (Get from API or manual update)

### 11.2 Game Mechanics
- [ ] Exact starting capital amount? (Suggestion: R$ 100,000 virtual)
- [ ] Trading interval default (weekly, bi-weekly)? (Suggestion: Weekly)
- [ ] Penalty amount for delisted stocks? (Suggestion: -100% value)
- [ ] Exact rewards for top 10 (what advantages)? (Suggestion: Bonus starting capital for next season)

### 11.3 Technical
- [ ] Choose backend and frontend stack (see TECH_ASSESSMENT.md)
- [ ] Choose database and hosting (see TECH_ASSESSMENT.md)
- [ ] Authentication approach (JWT + password hashing recommended)
- [ ] Price ingestion schedule (daily at what time)? (Suggestion: 8 PM BRT, after market close)

---

## 12. Timeline (Rough Estimate)

### Phase 1: Foundation (Weeks 1-4)
- [ ] Core domain model
- [ ] Authentication & user management
- [ ] Basic league creation
- [ ] Database setup (PostgreSQL on Supabase/Railway)
- [ ] CI/CD pipeline (GitHub Actions)

### Phase 2: Trading (Weeks 5-8)
- [ ] Stock data ingestion (Yahoo Finance/Brapi integration)
- [ ] Portfolio management
- [ ] Buy/sell functionality
- [ ] Frontend basic UI (chosen framework setup)

### Phase 3: Scoring (Weeks 9-10)
- [ ] Scoring engine
- [ ] Ranking calculation
- [ ] Leaderboards
- [ ] Deploy to Railway + Vercel

### Phase 4: Polish (Weeks 11-12)
- [ ] Weekly summaries (email integration)
- [ ] Season management
- [ ] UI/UX improvements
- [ ] Testing & bug fixes

---

## 13. Related Documents

- [TECH_ASSESSMENT.md](TECH_ASSESSMENT.md) - Detailed technical stack evaluation with 6 complete recommendations

---

## 14. Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2026-01-12 | Initial | Created from ChatGPT conversation refinement |
| 1.1 | 2026-01-12 | Initial | Added zero-budget tech stack recommendations |
| 1.2 | 2026-01-12 | Update | Removed tech stack assumptions, made generic for all options |
| 1.3 | 2026-01-13 | Update | Added Clojure/Datomic, AWS Lambda serverless, and updated Fly.io allowance notes |
| 1.4 | 2026-01-13 | Update | Removed detailed tech stack from PRD; deferred to TECH_ASSESSMENT |
