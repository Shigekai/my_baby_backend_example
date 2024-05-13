CREATE TYPE role AS ENUM ('doctor', 'patient', 'admin');

CREATE TABLE IF NOT EXISTS "users" (
    "id" uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    "name" VARCHAR(120) NOT NULL,
    "role" role NOT NULL,
    "created_at" TIMESTAMP,
    "updated_at" TIMESTAMP
);

CREATE TABLE IF NOT EXISTS "exams" (
    "id" uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    "name" VARCHAR(120) NOT NULL,
    "created_at" TIMESTAMP,
    "updated_at" TIMESTAMP,
    "user_id" uuid,
    FOREIGN KEY ("user_id")
        REFERENCES "users" ("id")
            ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS "contractions" (
    "id" uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    "description" VARCHAR(120) NOT NULL,
    "contractions_num" INTEGER NOT NULL,
    "created_at" TIMESTAMP,
    "exam_id" uuid,
    FOREIGN KEY ("exam_id")
        REFERENCES "exams" ("id")
            ON DELETE RESTRICT
);