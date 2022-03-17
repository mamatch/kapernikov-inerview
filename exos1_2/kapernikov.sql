CREATE TABLE "persons" (
  "id" SERIAL PRIMARY KEY,
  "first_name" text,
  "last_name" text
);

CREATE TABLE "albums" (
  "id" SERIAL PRIMARY KEY,
  "title" text,
  "author" text
);

CREATE TABLE "copies" (
  "id" SERIAL PRIMARY KEY,
  "album_id" int NOT NULL,
  "owner_id" int
);

CREATE TABLE "loans" (
  "copy_id" int NOT NULL,
  "person_id" int NOT NULL,
  "start_date" datetime,
  "end_end" datetime
);

ALTER TABLE "copies" ADD FOREIGN KEY ("album_id") REFERENCES "albums" ("id");

ALTER TABLE "copies" ADD FOREIGN KEY ("owner_id") REFERENCES "persons" ("id");

ALTER TABLE "loans" ADD FOREIGN KEY ("copy_id") REFERENCES "copies" ("id");

ALTER TABLE "loans" ADD FOREIGN KEY ("person_id") REFERENCES "persons" ("id");
