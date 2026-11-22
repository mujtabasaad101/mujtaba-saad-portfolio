-- Reference SQL. Set the admin user's auth.users.id UUID below before applying these policies.

create table if not exists public.site_content(
  id int primary key default 1 check (id = 1),
  data jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.site_content enable row level security;

drop policy if exists "public read"  on public.site_content;
drop policy if exists "owner insert" on public.site_content;
drop policy if exists "owner update" on public.site_content;

create policy "public read"  on public.site_content for select using (true);
create policy "owner insert" on public.site_content for insert to authenticated
  with check (auth.uid() = '00000000-0000-0000-0000-000000000000'::uuid);
create policy "owner update" on public.site_content for update to authenticated
  using      (auth.uid() = '00000000-0000-0000-0000-000000000000'::uuid)
  with check (auth.uid() = '00000000-0000-0000-0000-000000000000'::uuid);

-- Media bucket: public URLs for visitors, uploads only by you (50 MB per file is the free-plan max)
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('media', 'media', true, 52428800, array['image/*','video/*'])
on conflict (id) do update
  set public = true, file_size_limit = 52428800, allowed_mime_types = array['image/*','video/*'];

drop policy if exists "media owner insert" on storage.objects;
drop policy if exists "media owner update" on storage.objects;
drop policy if exists "media owner delete" on storage.objects;

create policy "media owner insert" on storage.objects for insert to authenticated
  with check (bucket_id = 'media' and auth.uid() = '00000000-0000-0000-0000-000000000000'::uuid);
create policy "media owner update" on storage.objects for update to authenticated
  using (bucket_id = 'media' and auth.uid() = '00000000-0000-0000-0000-000000000000'::uuid);
create policy "media owner delete" on storage.objects for delete to authenticated
  using (bucket_id = 'media' and auth.uid() = '00000000-0000-0000-0000-000000000000'::uuid);
