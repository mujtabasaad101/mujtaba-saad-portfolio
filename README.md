# Mujtaba Saad — Portfolio (Vercel + Supabase)

Static site (no build step). Content, images and videos live in Supabase; you edit them from a private dashboard on the live site.

## 1. Supabase (already prepared)
Project `mujtaba-portfolio` is set up (table `site_content`, public bucket `media`, write access restricted to the configured admin user UUID). You only need to do two things in the Supabase dashboard:
1. **Authentication → Users → Add user** → your chosen admin email + a strong password, tick *Auto confirm*.
2. **Authentication → Sign In / Providers → Email** → turn OFF *Allow new users to sign up*.
(Free plan: a project with no activity for a week can be paused; open the dashboard and press Restore if that happens.)

## 2. Config
`config.js` is already filled for the `mujtaba-portfolio` Supabase project. If you use another project, replace the two values (never paste the `service_role` key).

## 3. Deploy on Vercel
- Push this folder to a GitHub repo → Vercel → *Add New Project* → import it.
- Framework Preset: **Other**. Build command: empty. Output directory: empty (root).
- Or from a terminal inside the folder: `npx vercel --prod`.

## 4. Edit your site
- Open `https://YOUR-DOMAIN/admin` (or `/#admin`, or the small **Admin** link in the footer) → log in → the dashboard slides in. After login a ⚙ button stays at the bottom-right on that browser.
- Change anything (profile, links, skills, projects, theme, photos, videos), then press **Save & publish** at the top. Visitors see it immediately.
- Until the first save, the site shows the built-in default content.

## Notes
- Files: images over ~0.8 MB are resized to max 1800px automatically. Video max is 50 MB (Supabase free plan).
- Only the admin user UUID configured in the SQL policies can write; everyone else is read-only, so the publishable key can be exposed in the browser. Before applying the SQL, replace the all-zero UUID placeholder with your admin user UUID from Supabase Authentication → Users.
- Fill the real email, WhatsApp number, GitHub and Facebook in the dashboard's **Links** tab (they are placeholders).
- Replace the sample images (one has a stock watermark) with your own from the **Projects** tab.
