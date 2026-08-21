CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE projects (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    status VARCHAR(30) NOT NULL 
    CHECK (status IN('PLANNING','ACTIVE','ON_HOLD','COMPLETED','ARCHIVED')),
    created_by BIGINT NOT NULL,
    FOREIGN KEY (created_by) REFERENCES users(id),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE project_member (
    project_id BIGINT NOT NULL,
    FOREIGN KEY (project_id) REFERENCES projects(id),
    user_id BIGINT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    role VARCHAR(30) NOT NULL 
    CHECK(role IN('OWNER','ADMIN','MEMBER','VIEW')),
    joined_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (project_id, user_id)
);

CREATE TABLE milestones (
    id BIGSERIAL PRIMARY KEY,
    project_id BIGINT NOT NULL,
    FOREIGN KEY (project_id) REFERENCES projects(id),
    name VARCHAR(150) NOT NULL,
    description TEXT,
    status VARCHAR(30) NOT NULL 
    CHECK(status IN('PLANNED','ACTIVE','COMPLETED')),
    target_date DATE,
    completed_at TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE features (
   id BIGSERIAL PRIMARY KEY,
   project_id BIGINT NOT NULL,
   FOREIGN KEY (project_id) REFERENCES projects(id),
   milestone_id BIGINT,
   FOREIGN KEY (milestone_id) REFERENCES milestones(id),
   name VARCHAR(150) NOT NULL,
   description TEXT,
   status VARCHAR(30) NOT NULL 
   CHECK(status IN ('PLANNED','IN_PROGRESS','COMPLETED','CANCELLED')),
   priority VARCHAR(30) NOT NULL 
   CHECK (priority IN ('LOW', 'MEDIUM', 'HIGH', 'CRITICAL')),
   created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tasks (
    id BIGSERIAL PRIMARY KEY,
    feature_id BIGINT NOT NULL,
    FOREIGN KEY (feature_id) REFERENCES features(id),
    assigned_to BIGINT,
    FOREIGN KEY (assigned_to) REFERENCES users(id),
    title VARCHAR(200) NOT NULL,
    description TEXT,
    status VARCHAR(30) NOT NULL 
    CHECK(status IN('TODO','IN_PROGRESS','BLOCKED','DONE')),
    priority VARCHAR(30) NOT NULL 
    CHECK (priority IN ('LOW', 'MEDIUM', 'HIGH', 'CRITICAL')),
    estimated_hours DECIMAL(6,2),
    actual_hours DECIMAL(6,2),
    due_date DATE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE bugs (
    id BIGSERIAL PRIMARY KEY,
    project_id BIGINT NOT NULL,
    FOREIGN KEY (project_id) REFERENCES projects(id),
    feature_id BIGINT,
    FOREIGN KEY (feature_id) REFERENCES features(id),
    reported_by BIGINT NOT NULL,
    FOREIGN KEY (reported_by) REFERENCES users(id),
    assigned_to BIGINT,
    FOREIGN KEY (assigned_to) REFERENCES users(id),
    title VARCHAR(200) NOT NULL,
    description TEXT,
    steps_to_reproduction TEXT,
    expected_behavior TEXT,
    actual_behavior TEXT,
    severity VARCHAR(30),
    status VARCHAR(30) 
    CHECK(status IN('OPEN','IN_PROGRESS','RESOLVED','CLOSED','WONT_FIX')),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE assets (
    id BIGSERIAL PRIMARY KEY,
    project_id BIGINT NOT NULL,
    FOREIGN KEY (project_id) REFERENCES projects(id),
    feature_id BIGINT,
    FOREIGN KEY (feature_id) REFERENCES features(id),
    name VARCHAR(200) NOT NULL,
    asset_type VARCHAR(50),
    status VARCHAR(30) CHECK(status IN('PLANNED','IN_PROGRESS','COMPLETED','ARCHIVED')),
    file_path VARCHAR(500),
    version VARCHAR(50),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE builds (
    id BIGSERIAL PRIMARY KEY,
    project_id BIGINT NOT NULL,
    FOREIGN KEY (project_id) REFERENCES projects(id),
    version VARCHAR(50) NOT NULL,
    platform VARCHAR(50) NOT NULL,
    status VARCHAR(30) NOT NULL CHECK(status IN('PENDING','IN_PROGRESS','SUCCESS','FAILED')),
    build_url VARCHAR(500),
    notes TEXT,
    created_by BIGINT NOT NULL,
    FOREIGN KEY (created_by) REFERENCES users(id),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_projects_created_by
ON projects(created_by);
CREATE INDEX idx_project_member_user_id
ON project_member(user_id);
CREATE INDEX idx_milestones_project_id
ON milestones(project_id);
CREATE INDEX idx_features_project_id
ON features(project_id);
CREATE INDEX idx_features_milestone_id
ON features(milestone_id);
CREATE INDEX idx_tasks_feature_id
ON tasks(feature_id);
CREATE INDEX idx_tasks_assigned_to
ON tasks(assigned_to);
CREATE INDEX idx_bugs_project_id
ON bugs(project_id);
CREATE INDEX idx_bugs_feature_id
ON bugs(feature_id);
CREATE INDEX idx_bugs_reported_by
ON bugs(reported_by);
CREATE INDEX idx_assets_project_id
ON assets(project_id);
CREATE INDEX idx_assets_feature_id
ON assets(feature_id);
CREATE INDEX idx_builds_project_id
ON builds(project_id);
CREATE INDEX idx_builds_created_by
ON builds(created_by);




