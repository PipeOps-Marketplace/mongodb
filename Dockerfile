# Use the official MongoDB image
FROM mongo:8.0

# Copy config to the conventional path
COPY mongo.conf /etc/mongo/mongod.conf

# Init scripts run only on first start when dbPath is empty
COPY init-mongo.js /docker-entrypoint-initdb.d/init-mongo.js

# Avoid chown here; volumes will override permissions anyway.
# Create log dir only (Mongo logs to stdout by default; keep it simple)
RUN mkdir -p /var/log/mongodb

EXPOSE 27017

# Use the config path we copied to
CMD ["mongod", "--config", "/etc/mongo/mongod.conf"]
