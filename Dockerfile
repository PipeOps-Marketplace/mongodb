# Use the official MongoDB image
FROM mongo:8.0

# Copy config to the conventional path
COPY mongo.conf /etc/mongo/mongod.conf

# Init scripts run only on first start when dbPath is empty
COPY init-mongo.js /docker-entrypoint-initdb.d/init-mongo.js

# Create necessary directories and set correct permissions
RUN mkdir -p /data/db /var/log/mongodb && \
    chown -R mongodb:mongodb /data/db /var/log/mongodb

EXPOSE 27017

# Use the config path we copied to
CMD ["mongod", "--config", "/etc/mongo/mongod.conf"]
