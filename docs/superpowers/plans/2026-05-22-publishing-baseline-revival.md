# Publishing Baseline Revival Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Restore a secure, repeatable build and GitHub Pages publishing baseline for the existing Hexo site.

**Architecture:** Keep Hexo and Butterfly in place. Separate formatting from build verification, keep site content changes scoped to the missing About page, disable the unsafe Gitalk configuration, and publish generated `public/` output through the official GitHub Pages Actions artifact flow.

**Tech Stack:** Hexo 8, Butterfly theme, npm, GitHub Actions, GitHub Pages

---

## File Map

- `package.json`: define non-mutating verification scripts and npm ownership.
- `tsconfig.json`: remove a TypeScript check that does not have repository inputs to validate.
- `_config.butterfly.yml`: stop exposing the old Gitalk credential configuration.
- `source/about/index.md`: provide the page already linked from navigation.
- `.github/workflows/pages.yml`: verify pull requests and deploy generated Pages output from the default branch.

### Task 1: Build Verification Baseline

**Files:**

- Modify: `package.json`
- Modify: `tsconfig.json`

- [ ] **Step 1: Reproduce current verification failure**

Run: `npm run tsc -- --noEmit`

Expected: FAIL because TypeScript finds no JavaScript or TypeScript inputs and rejects the deprecated Node 10 resolution alias.

- [ ] **Step 2: Keep build verification non-mutating**

Update npm scripts so `build` calls non-mutating checks and static generation. Keep write-oriented formatting and lint fixing as explicit maintenance commands.

- [ ] **Step 3: Remove the ineffective TypeScript gate**

Remove TypeScript from the baseline until the site owns TypeScript or checked JavaScript sources. The existing Hexo content and configuration do not provide inputs for that gate.

- [ ] **Step 4: Verify build**

Run: `npm run build`

Expected: PASS and generate `public/`.

### Task 2: Site Blocking Gaps

**Files:**

- Modify: `_config.butterfly.yml`
- Create: `source/about/index.md`

- [ ] **Step 1: Preserve the existing navigation contract**

Create the `/about/` Hexo page already linked by Butterfly navigation.

- [ ] **Step 2: Remove unsafe comment configuration**

Disable Gitalk and remove the committed client secret from theme configuration. Leave comments off until a replacement comment provider is configured.

- [ ] **Step 3: Verify generated output**

Run: `npm run generate`

Expected: PASS and create `public/about/index.html`.

### Task 3: GitHub Pages Workflow

**Files:**

- Create: `.github/workflows/pages.yml`

- [ ] **Step 1: Add CI and deployment workflow**

Use `actions/checkout`, `actions/setup-node`, `npm ci`, `npm run build`, `actions/upload-pages-artifact`, and `actions/deploy-pages`.

- [ ] **Step 2: Keep deployment branch-independent**

Upload `public/` as the Pages artifact on pushes to the default branch and verify pull requests without deployment.

- [ ] **Step 3: Verify workflow inputs locally**

Check that the workflow build command matches `package.json` and the artifact path matches Hexo `public_dir`.

### Task 4: Final Verification

**Files:**

- Inspect changed files

- [ ] **Step 1: Run repository verification**

Run: `npm run build`

Expected: PASS.

- [ ] **Step 2: Confirm page output**

Run: `Test-Path public\about\index.html`

Expected: `True`.

- [ ] **Step 3: Review change scope**

Run: `git diff --stat`

Expected: Engineering and About page changes are visible without reverting existing article edits.
