BEGIN;


--
-- MIGRATION VERSION FOR notedtogether
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('notedtogether', '20250712184949585', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250712184949585', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
