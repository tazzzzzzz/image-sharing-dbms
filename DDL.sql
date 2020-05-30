DROP DATABASE IF EXISTS image_share;
CREATE DATABASE image_share;
USE image_share; 

CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    age INT NOT NULL CHECK (age>18),
    gender char(1) NOT NULL CHECK (gender in ('M','F')),
    password_hash varchar(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY(followee_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    PRIMARY KEY(follower_id, followee_id)
);

CREATE TABLE unfollows (
    unfollower_id INTEGER NOT NULL,
    unfollowee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(unfollower_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY(unfollowee_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    PRIMARY KEY(unfollower_id, unfollowee_id)
);

CREATE TABLE photos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    caption VARCHAR(255) DEFAULT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE comments (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    photo_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(photo_id) REFERENCES photos(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY(user_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE likes (
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY(photo_id) REFERENCES photos(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    PRIMARY KEY(user_id, photo_id)
);


CREATE TABLE tags (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags (
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY(tag_id) REFERENCES tags(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    PRIMARY KEY(photo_id, tag_id)
);

CREATE TABLE locations (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  location_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_locations (
    photo_id INTEGER NOT NULL,
    location_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY(location_id) REFERENCES locations(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    PRIMARY KEY(photo_id, location_id)
);
