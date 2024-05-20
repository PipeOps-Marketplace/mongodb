# Use the MongoDB image as the base image
FROM mongo:latest

# Copy the custom MongoDB configuration file into the image
COPY mongo.conf /etc/mongo.conf

# Copy the initialization script into the container
COPY init-mongo.js /docker-entrypoint-initdb.d/init-mongo.js

# Set environment variables using ARG (without default values)
ARG MONGO_INITDB_ROOT_USERNAME
ARG MONGO_INITDB_ROOT_PASSWORD
ARG MONGO_INITDB_DATABASE

# Set environment variables using ENV
ENV MONGO_INITDB_ROOT_USERNAME=${MONGO_INITDB_ROOT_USERNAME}
ENV MONGO_INITDB_ROOT_PASSWORD=${MONGO_INITDB_ROOT_PASSWORD}
ENV MONGO_INITDB_DATABASE=${MONGO_INITDB_DATABASE}

# Create necessary directories and set correct permissions
RUN mkdir -p /data/db /var/log/mongodb && \
    chown -R mongodb:mongodb /data/db /var/log/mongodb

# Expose the default MongoDB port
EXPOSE 27017

# Start the MongoDB server without the --fork option for debugging
CMD ["mongod", "--config", "/etc/mongo.conf"]
