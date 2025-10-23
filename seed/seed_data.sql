-- Insert sample organizations
INSERT INTO organizations (id, name) VALUES
    ('11111111-1111-1111-1111-111111111111', 'TechRecruit Inc.'),
    ('22222222-2222-2222-2222-222222222222', 'HR Solutions Ltd.');

-- Insert sample users
INSERT INTO users (id, organization_id, email, password_hash, full_name, role) VALUES
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 'john@techrecruit.com', crypt('password123', gen_salt('bf')), 'John Smith', 'admin'),
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '11111111-1111-1111-1111-111111111111', 'sarah@techrecruit.com', crypt('password123', gen_salt('bf')), 'Sarah Johnson', 'recruiter'),
    ('cccccccc-cccc-cccc-cccc-cccccccccccc', '22222222-2222-2222-2222-222222222222', 'mike@hrsolutions.com', crypt('password123', gen_salt('bf')), 'Mike Wilson', 'admin');

-- Insert sample jobs
INSERT INTO jobs (id, organization_id, created_by, title, description, requirements) VALUES
    ('dddddddd-dddd-dddd-dddd-dddddddddddd', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Senior Software Engineer', 'We are looking for an experienced software engineer to join our team.', 'Experience with Python, JavaScript, and cloud technologies.'),
    ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Product Manager', 'Seeking a product manager to lead our flagship product.', '5+ years of product management experience in tech.'),
    ('ffffffff-ffff-ffff-ffff-ffffffffffff', '22222222-2222-2222-2222-222222222222', 'cccccccc-cccc-cccc-cccc-cccccccccccc', 'Data Scientist', 'Looking for a data scientist with ML expertise.', 'Experience with Python, ML frameworks, and statistics.');

-- Insert sample candidates
INSERT INTO candidates (id, organization_id, full_name, email, phone) VALUES
    ('99999999-9999-9999-9999-999999999999', '11111111-1111-1111-1111-111111111111', 'Alice Brown', 'alice@email.com', '+1234567890'),
    ('88888888-8888-8888-8888-888888888888', '11111111-1111-1111-1111-111111111111', 'Bob Wilson', 'bob@email.com', '+1234567891'),
    ('77777777-7777-7777-7777-777777777777', '22222222-2222-2222-2222-222222222222', 'Carol Davis', 'carol@email.com', '+1234567892');

-- Insert sample CV storage entries
INSERT INTO cv_storage (id, candidate_id, file_name, file_url, processed_content) VALUES
    ('33333333-3333-3333-3333-333333333333', '99999999-9999-9999-9999-999999999999', 'alice_cv.pdf', 'https://storage.example.com/alice_cv.pdf', 'Experienced software engineer with 8 years of experience in Python and JavaScript...'),
    ('44444444-4444-4444-4444-444444444444', '88888888-8888-8888-8888-888888888888', 'bob_cv.pdf', 'https://storage.example.com/bob_cv.pdf', 'Product manager with 6 years of experience in tech products...'),
    ('55555555-5555-5555-5555-555555555555', '77777777-7777-7777-7777-777777777777', 'carol_cv.pdf', 'https://storage.example.com/carol_cv.pdf', 'Data scientist with expertise in Python, TensorFlow, and statistical analysis...');

-- Insert sample CV matches
INSERT INTO cv_matches (job_id, candidate_id, cv_storage_id, match_score, ai_summary, status) VALUES
    ('dddddddd-dddd-dddd-dddd-dddddddddddd', '99999999-9999-9999-9999-999999999999', '33333333-3333-3333-3333-333333333333', 95.5, 'Strong match. Candidate has extensive experience in required technologies.', 'matched'),
    ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', '88888888-8888-8888-8888-888888888888', '44444444-4444-4444-4444-444444444444', 87.3, 'Good match. Candidate meets experience requirements and has relevant domain knowledge.', 'matched'),
    ('ffffffff-ffff-ffff-ffff-ffffffffffff', '77777777-7777-7777-7777-777777777777', '55555555-5555-5555-5555-555555555555', 92.8, 'Excellent match. Candidate has strong background in data science and required tools.', 'matched');