-- ROLES AND PROGRESSIVE PRIVILEGES
-- Restrict all privileges in 'cartografia' to 'public' default role
REVOKE ALL ON SCHEMA public FROM public;
REVOKE ALL ON DATABASE cartografia FROM public;

-- Role `reader` can only select rows
CREATE ROLE reader;
GRANT USAGE ON SCHEMA public TO reader;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO reader;

-- Role `editor` can read and modify tables content
CREATE ROLE editor;
GRANT USAGE ON SCHEMA public TO editor;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, UPDATE ON TABLES TO editor;

-- Role `creator` can create and manage schema tables
CREATE ROLE creator;
GRANT USAGE, CREATE ON SCHEMA public TO creator;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO creator;

-- WIDE USE FUNCTIONS
-- Update tables' control columns
CREATE OR REPLACE FUNCTION ari_update_table()
RETURNS TRIGGER AS $$
BEGIN
	NEW.updated_at = NOW();
	NEW.updated_by = CURRENT_USER;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;
