-- sketch here: https://www.drawdb.app/editor


CREATE TABLE IF NOT EXISTS `Songs` (
	`song_id` BIGINT NOT NULL AUTO_INCREMENT UNIQUE,
	`name_of_track` VARCHAR(255) NOT NULL,
	`genre` VARCHAR(255) NOT NULL,
	`length` INTEGER NOT NULL,
	`acousticness` INTEGER NOT NULL,
	`beats.per.minute` INTEGER NOT NULL,
	`danceability` INTEGER NOT NULL,
	`loudness_db` INTEGER NOT NULL,
	`energy` INTEGER NOT NULL,
	`liveness` INTEGER NOT NULL,
	`speechiness` INTEGER NOT NULL,
	`artist_id` BIGINT NOT NULL,
	PRIMARY KEY(`song_id`)
);


CREATE INDEX `table_ZpSHPG9u-Q4q-hEg-C5-U_index_0`
ON `Songs` ();
CREATE TABLE IF NOT EXISTS `Artists` (
	`artist_id` BIGINT NOT NULL AUTO_INCREMENT UNIQUE,
	`artist_name` VARCHAR(255),
	PRIMARY KEY(`artist_id`)
);


CREATE TABLE IF NOT EXISTS `Popularity` (
	`music_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`song_id` BIGINT NOT NULL,
	`popularity` INTEGER NOT NULL,
	PRIMARY KEY(`music_id`, `song_id`)
);


ALTER TABLE `Songs`
ADD FOREIGN KEY(`song_id`) REFERENCES `Popularity`(`song_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Songs`
ADD FOREIGN KEY(`artist_id`) REFERENCES `Artists`(`artist_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Songs`
ADD FOREIGN KEY(`song_id`) REFERENCES `Popularity`(`song_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;