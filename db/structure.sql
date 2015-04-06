CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar, "last_sign_in_ip" varchar, "created_at" datetime, "updated_at" datetime, "first_name" varchar, "last_name" varchar, "username" varchar, "provider" varchar, "uid" varchar);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE TABLE "ideas" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "Idea" varchar, "Destination" varchar, "Start" date, "End" date, "Tags" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "user_id" integer, "image_file_name" varchar, "image_content_type" varchar, "image_file_size" integer, "image_updated_at" datetime, "latitude" float, "longitude" float);
CREATE INDEX "index_ideas_on_user_id" ON "ideas" ("user_id");
CREATE TABLE "comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "comment" text, "idea_id" integer, "user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_comments_on_idea_id" ON "comments" ("idea_id");
CREATE INDEX "index_comments_on_user_id" ON "comments" ("user_id");
INSERT INTO schema_migrations (version) VALUES ('20150206190405');

INSERT INTO schema_migrations (version) VALUES ('20150208051800');

INSERT INTO schema_migrations (version) VALUES ('20150208120258');

INSERT INTO schema_migrations (version) VALUES ('20150208131204');

INSERT INTO schema_migrations (version) VALUES ('20150303185629');

INSERT INTO schema_migrations (version) VALUES ('20150308170607');

INSERT INTO schema_migrations (version) VALUES ('20150311143413');

INSERT INTO schema_migrations (version) VALUES ('20150311153759');

INSERT INTO schema_migrations (version) VALUES ('20150316115220');

INSERT INTO schema_migrations (version) VALUES ('20150323152420');

