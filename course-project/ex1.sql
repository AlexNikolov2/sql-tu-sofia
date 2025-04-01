CREATE TABLE Developer (
    developer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Project (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Version (
    version_id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT,
    version_number VARCHAR(20),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES Project(project_id)
);

CREATE TABLE Commit (
    commit_id INT AUTO_INCREMENT PRIMARY KEY,
    developer_id INT,
    project_id INT,
    version_id INT,
    message TEXT,
    commit_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (developer_id) REFERENCES Developer(developer_id),
    FOREIGN KEY (project_id) REFERENCES Project(project_id),
    FOREIGN KEY (version_id) REFERENCES Version(version_id)
);

CREATE TABLE FileChange (
    file_change_id INT AUTO_INCREMENT PRIMARY KEY,
    commit_id INT,
    file_path VARCHAR(255),
    change_type ENUM('added', 'modified', 'deleted'),
    FOREIGN KEY (commit_id) REFERENCES Commit(commit_id)
);