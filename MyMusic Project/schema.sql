CREATE TABLE `songs` (
    `id` INT NOT NULL,
    `artist_id` INT NOT NULL,
    `album_id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `genre` VARCHAR(255) NOT NULL,
    `release_year` INT NOT NULL,
    `duration_s` INT NOT NULL,
    `tempo_bpm` INT NOT NULL,
    `popularity` INT NOT NULL,
    PRIMARY KEY (`id`)
    ) ;

CREATE TABLE `artists` (
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `country` VARCHAR(255) NOT NULL,
    `city` VARCHAR(255) NOT NULL,
    `genre` VARCHAR(255) NOT NULL,
    `label` VARCHAR(255),
    PRIMARY KEY (`id`)
);

CREATE TABLE `albums` (
    `id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `number_of_track` INT NOT NULL,
    `release_date` DATE NOT NULL,
    `sold_copies` INT,
    PRIMARY KEY (`id`)
    );

ALTER TABLE songs
RENAME COLUMN tempo TO tempo_bpm;

ALTER TABLE songs ADD FOREIGN KEY (`artist_id`) REFERENCES `artists`(`id`);
    
ALTER TABLE songs ADD FOREIGN KEY (`album_id`) REFERENCES `albums`(`id`) ;
