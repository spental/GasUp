-- Run once in Supabase SQL Editor. Authentication > Email should be enabled.
create extension if not exists pgcrypto;

create table if not exists public.drivers (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references auth.users(id) on delete cascade,
  name text not null check (length(trim(name)) between 1 and 100),
  created_at timestamptz not null default now(),
  unique (id, account_id)
);
create index if not exists drivers_by_owner on public.drivers(account_id);

create table if not exists public.trips (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null references auth.users(id) on delete cascade,
  driver_id uuid not null,
  trip_date date not null,
  purpose text not null check (length(trim(purpose)) between 1 and 140),
  miles numeric(12,2) not null check (miles > 0 and miles <= 99999),
  start_odometer numeric(12,2),
  end_odometer numeric(12,2),
  notes text not null default '' check (length(notes) <= 2000),
  source text not null default 'manual' check (source in ('manual','gps')),
  created_at timestamptz not null default now(),
  constraint odometer_pair check ((start_odometer is null and end_odometer is null) or (start_odometer is not null and end_odometer is not null and end_odometer > start_odometer)),
  foreign key (driver_id, account_id) references public.drivers(id, account_id) on delete cascade
);
create index if not exists trips_owner_date on public.trips(account_id, trip_date desc);
create index if not exists trips_driver_date on public.trips(driver_id, trip_date desc);

alter table public.drivers enable row level security;
alter table public.trips enable row level security;

-- Users can only read and modify their own account's records.
create policy "drivers_select_own" on public.drivers for select to authenticated using (account_id = (select auth.uid()));
create policy "drivers_insert_own" on public.drivers for insert to authenticated with check (account_id = (select auth.uid()));
create policy "drivers_update_own" on public.drivers for update to authenticated using (account_id = (select auth.uid())) with check (account_id = (select auth.uid()));
create policy "drivers_delete_own" on public.drivers for delete to authenticated using (account_id = (select auth.uid()));
create policy "trips_select_own" on public.trips for select to authenticated using (account_id = (select auth.uid()));
create policy "trips_insert_own" on public.trips for insert to authenticated with check (account_id = (select auth.uid()));
create policy "trips_update_own" on public.trips for update to authenticated using (account_id = (select auth.uid())) with check (account_id = (select auth.uid()));
create policy "trips_delete_own" on public.trips for delete to authenticated using (account_id = (select auth.uid()));

-- Prevent anonymous table access; permissions still depend on RLS above.
grant select, insert, update, delete on public.drivers, public.trips to authenticated;
revoke all on public.drivers, public.trips from anon;
