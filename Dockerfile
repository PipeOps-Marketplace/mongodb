# Use the MongoDB image as the base image
FROM mongo:latest

# Copy the custom MongoDB configuration file into the image
COPY mongo.conf /etc/mongo.conf

# Set environment variables using ARG (these are build-time variables)
ARG MONGO_INITDB_ROOT_USERNAME
ARG MONGO_INITDB_ROOT_PASSWORD
ARG MONGO_INITDB_DATABASE

# Set environment variables using ENV
ENV MONGO_INITDB_ROOT_USERNAME=${MONGO_INITDB_ROOT_USERNAME}
ENV MONGO_INITDB_ROOT_PASSWORD=${MONGO_INITDB_ROOT_PASSWORD}
ENV MONGO_INITDB_DATABASE=${MONGO_INITDB_DATABASE}

# Create data directory and set correct permissions
RUN mkdir -p /data/db && chown -R mongodb:mongodb /data/db

# Expose the default MongoDB port
EXPOSE 27017

# Start the MongoDB server with the custom configuration file
CMD ["mongod", "--config", "/etc/mongo.conf"]
