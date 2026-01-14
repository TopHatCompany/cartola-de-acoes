
create table jobs (
  id uuid primary key default gen_random_uuid(),
  type text not null,
  payload jsonb not null,
  status text not null default 'pending',
  attempts int not null default 0,
  error text,
  run_at timestamptz not null default now(),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index jobs_pending_idx
  on jobs (status, run_at)
  where status = 'pending';
