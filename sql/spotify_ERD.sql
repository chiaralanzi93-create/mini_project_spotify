
CREATE DATABASE IF NOT EXISTS spotify;
USE spotify;

CREATE TABLE Artists (
    artist_id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    artist_name  VARCHAR(255)    NOT NULL,
    PRIMARY KEY (artist_id)
);

CREATE TABLE Songs (
    song_id          BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    track_name       VARCHAR(255)    NOT NULL,
    artist_id        BIGINT UNSIGNED NOT NULL,
    genre            VARCHAR(255)    NOT NULL,
    genre_group      VARCHAR(50)     NOT NULL,
    length_seconds   INT             NOT NULL,
    beats_per_minute INT             NOT NULL,
    acousticness     INT             NOT NULL,
    danceability     INT             NOT NULL,
    loudness_db      INT             NOT NULL,
    energy           INT             NOT NULL,
    liveness         INT             NOT NULL,
    speechiness      INT             NOT NULL,
    valence          INT             NOT NULL,
    PRIMARY KEY (song_id),
    CONSTRAINT fk_songs_artist
        FOREIGN KEY (artist_id)
        REFERENCES Artists (artist_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE Popularity (
    music_id          BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    song_id           BIGINT UNSIGNED NOT NULL,
    chart_rank        INT             NOT NULL,
    popularity_score  INT             NOT NULL,
    PRIMARY KEY (music_id),
    CONSTRAINT fk_popularity_song
        FOREIGN KEY (song_id)
        REFERENCES Songs (song_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

