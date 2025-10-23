Backend Test – Supabase SQL (by Zaman Qamar)

This repository contains the database schema, sample seed data, and row-level security (RLS) policies implemented for the backend test.
The goal is to model a recruitment management system with secure data access per organization using Supabase and PostgreSQL.

📂 Folder Structure
.
├── migrations/
│   ├── create_tables.sql       # Database schema (tables, triggers, indexes)
│   ├── create_rls_policies.sql        # Row Level Security (RLS) policies
│
├── seed/
│   ├── seed_data.sql       # Sample data for all tables
│
├── README.md
└── efset_scores.png                # English proficiency test proof

🧠 Database Overview

The system models a multi-tenant structure where organizations manage recruiters, jobs, candidates, and CVs, with secure access controls.

Tables Overview
Table	                         Description
organizations	          Stores company information. Each organization can have multiple recruiters and jobs.
users	                  Represents recruiters/admins belonging to organizations. Includes authentication and role info.
jobs	                  Contains job postings created by users within an organization.
candidates	              Contains candidate information linked to an organization.
cv_storage	              Stores uploaded CVs of candidates and their processed text.
cv_matches	              Links candidates’ CVs with job postings, including AI-generated match scores.

🔗 Relationships
Relationship	Description
organizations.id → users.organization_id	Each user belongs to an organization.
organizations.id → jobs.organization_id	Each job is created within an organization.
organizations.id → candidates.organization_id	Each candidate belongs to an organization.
users.id → jobs.created_by	Job postings are created by a specific recruiter.
candidates.id → cv_storage.candidate_id	Each CV belongs to a candidate.
jobs.id → cv_matches.job_id	CV matches link jobs and candidates.
candidates.id → cv_matches.candidate_id	Candidate matched to a job.
cv_storage.id → cv_matches.cv_storage_id	Matched CV record.

⚙️ Features Implemented
1. Database Schema

UUID-based primary keys using uuid_generate_v4()

Automatic timestamp tracking (created_at, updated_at)

Triggers to update updated_at column on record update

Indexes added for optimized query performance

2. Sample Seed Data

Populates realistic example data for:

2 organizations

3 users

3 jobs

3 candidates

3 CV files

3 AI-based CV matches

This enables immediate testing of relationships and RLS policies.

3. Row Level Security (RLS)

RLS ensures that users can only access data belonging to their own organization.

Examples:

A recruiter in TechRecruit Inc. can only see candidates, jobs, and CVs for TechRecruit Inc.

An admin at HR Solutions Ltd. cannot view or modify data from other organizations.

RLS is implemented for all major tables:

organizations

users

jobs

candidates

cv_storage

cv_matches

🔒 RLS Policy Summary
Table	Policy	Description
organizations	Users can view their own organization	Restricts visibility to user’s org only
users	Users can view/update within same org	No cross-organization access
jobs	Create/update/select within same org	Only same org’s recruiters can manage jobs
candidates	Create/update/select within same org	Protects candidate data by organization
cv_storage	Create/select via candidate’s org	Ensures CVs belong to candidate’s org
cv_matches	Create/select via job’s org	Restricts match results per organization
🧰 Setup Instructions (Supabase)

Open your Supabase SQL Editor

Run the following files in order:

-- Step 1: Create Tables
migrations/create_tables.sql

-- Step 2: Enable RLS and define policies
migrations/create_rls_policies.sql

-- Step 3: Insert Seed Data
seed/seed_data.sql


After successful execution, you should see:

Success. No rows returned.

🧩 Testing Guidelines

Run queries as different users (john@techrecruit.com, mike@hrsolutions.com, etc.)

Verify that users from one organization cannot see data from another organization.

Check automatic timestamp updates by updating any record.

🧪 Example Queries
-- View jobs for the logged-in recruiter
SELECT * FROM jobs;

-- View candidates under same organization
SELECT * FROM candidates;

-- Insert new candidate under same organization
INSERT INTO candidates (organization_id, full_name, email)
VALUES ('11111111-1111-1111-1111-111111111111', 'New Candidate', 'new@email.com');


👨‍💻 Author

Zaman Qamar
Email: mzamanqamar9@gmail.com
Role: Backend Developer (Test Submission for AzkyTech)
Date: October 2025