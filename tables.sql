CREATE TABLE Appuser (
    "id" bigserial PRIMARY KEY,
    "username" varchar(50) CHECK(length("username")>1 and length("username")<51) NOT NULL UNIQUE,
    "password" varchar(70) CHECK(length("password")>1 and length("password")<71) NOT NULL UNIQUE  
);

CREATE TABLE Calendar (
    "id" bigserial PRIMARY KEY,
    "name" varchar(50) CHECK(length("name")>1 and length("name")<51) NOT NULL,
    "comment" varchar(255) CHECK(length("comment")>0 and length("comment")<256),
    "appuser_id" bigint NOT NULL REFERENCES Appuser("id")
);

CREATE TABLE Label (
    "id" bigserial PRIMARY KEY,
    "name" varchar(50) CHECK(length("name")>1 and length("name")<51) NOT NULL,
    "color_r" smallint CHECK("color_r">=0 and "color_r"<256) NOT NULL,
    "color_b" smallint CHECK("color_b">=0 and "color_b"<256) NOT NULL,
    "color_g" smallint CHECK("color_g">=0 and "color_g"<256) NOT NULL,
    "appuser_id" bigint NOT NULL REFERENCES Appuser("id")
);

CREATE TABLE Event (
    "id" bigserial PRIMARY KEY,
    "name" varchar(50) CHECK(length("name")>1 and length("name")<51) NOT NULL,
    "comment" varchar(255) CHECK(length("comment")>0 and length("comment")<256),
    "start_date" timestamp NOT NULL,
    "end_date" timestamp NOT NULL,
    "is_archived" boolean NOT NULL,
    "calendar_id" bigint NOT NULL REFERENCES Calendar("id"),
    "label_id" bigint NOT NULL REFERENCES Label("id")
);

CREATE TABLE Note (
    "id" bigserial PRIMARY KEY,
    "name" varchar(50) CHECK(length("name")>1 and length("name")<51) NOT NULL,
    "comment" varchar(2048) CHECK(length("comment")>0 and length("comment")<2049),
    "appuser_id" bigint NOT NULL REFERENCES Appuser("id")
);
