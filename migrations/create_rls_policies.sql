-- Enable Row Level Security for all tables
ALTER TABLE organizations ENABLE ROW LEVEL SECURITY;
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE jobs ENABLE ROW LEVEL SECURITY;
ALTER TABLE candidates ENABLE ROW LEVEL SECURITY;
ALTER TABLE cv_storage ENABLE ROW LEVEL SECURITY;
ALTER TABLE cv_matches ENABLE ROW LEVEL SECURITY;

-- Create policies for organizations table
CREATE POLICY "Users can view their own organization"
    ON organizations FOR SELECT
    USING (id IN (
        SELECT organization_id 
        FROM users 
        WHERE users.id = auth.uid()
    ));

-- Create policies for users table
CREATE POLICY "Users can view members of their organization"
    ON users FOR SELECT
    USING (organization_id IN (
        SELECT organization_id 
        FROM users 
        WHERE users.id = auth.uid()
    ));

CREATE POLICY "Users can update their own profile"
    ON users FOR UPDATE
    USING (id = auth.uid());

-- Create policies for jobs table
CREATE POLICY "Users can view jobs in their organization"
    ON jobs FOR SELECT
    USING (organization_id IN (
        SELECT organization_id 
        FROM users 
        WHERE users.id = auth.uid()
    ));

CREATE POLICY "Users can create jobs in their organization"
    ON jobs FOR INSERT
    WITH CHECK (organization_id IN (
        SELECT organization_id 
        FROM users 
        WHERE users.id = auth.uid()
    ));

CREATE POLICY "Users can update jobs in their organization"
    ON jobs FOR UPDATE
    USING (organization_id IN (
        SELECT organization_id 
        FROM users 
        WHERE users.id = auth.uid()
    ));

-- Create policies for candidates table
CREATE POLICY "Users can view candidates in their organization"
    ON candidates FOR SELECT
    USING (organization_id IN (
        SELECT organization_id 
        FROM users 
        WHERE users.id = auth.uid()
    ));

CREATE POLICY "Users can create candidates in their organization"
    ON candidates FOR INSERT
    WITH CHECK (organization_id IN (
        SELECT organization_id 
        FROM users 
        WHERE users.id = auth.uid()
    ));

CREATE POLICY "Users can update candidates in their organization"
    ON candidates FOR UPDATE
    USING (organization_id IN (
        SELECT organization_id 
        FROM users 
        WHERE users.id = auth.uid()
    ));

-- Create policies for cv_storage table
CREATE POLICY "Users can view CVs in their organization"
    ON cv_storage FOR SELECT
    USING (candidate_id IN (
        SELECT id 
        FROM candidates 
        WHERE candidates.organization_id IN (
            SELECT organization_id 
            FROM users 
            WHERE users.id = auth.uid()
        )
    ));

CREATE POLICY "Users can create CV entries in their organization"
    ON cv_storage FOR INSERT
    WITH CHECK (candidate_id IN (
        SELECT id 
        FROM candidates 
        WHERE candidates.organization_id IN (
            SELECT organization_id 
            FROM users 
            WHERE users.id = auth.uid()
        )
    ));

-- Create policies for cv_matches table
CREATE POLICY "Users can view CV matches in their organization"
    ON cv_matches FOR SELECT
    USING (job_id IN (
        SELECT id 
        FROM jobs 
        WHERE jobs.organization_id IN (
            SELECT organization_id 
            FROM users 
            WHERE users.id = auth.uid()
        )
    ));

CREATE POLICY "Users can create CV matches in their organization"
    ON cv_matches FOR INSERT
    WITH CHECK (job_id IN (
        SELECT id 
        FROM jobs 
        WHERE jobs.organization_id IN (
            SELECT organization_id 
            FROM users 
            WHERE users.id = auth.uid()
        )
    ));
