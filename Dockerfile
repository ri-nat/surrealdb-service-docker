FROM surrealdb/surrealdb:latest

ENTRYPOINT ["/surreal", "start", "--log", "trace", "--user", "root", "--pass", "root", "memory"]
