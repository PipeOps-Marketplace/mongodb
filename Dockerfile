# Use the MongoDB image as the base image
FROM mongo:7.0.7

# Set default values for environment variables using ARG
ARG MONGO_INITDB_ROOT_USERNAME=default
ARG MONGO_INITDB_ROOT_PASSWORD=default
ARG MONGO_INITDB_DATABASE

# Set environment variables using ENV
ENV MONGO_INITDB_ROOT_USERNAME=${MONGO_INITDB_ROOT_USERNAME}
ENV MONGO_INITDB_ROOT_PASSWORD=${MONGO_INITDB_ROOT_PASSWORD}
ENV MONGO_INITDB_DATABASE=${MONGO_INITDB_DATABASE}

# Copy the custom MongoDB configuration file into the image
COPY mongo.conf /etc/mongo.conf

# Expose the default MongoDB port
EXPOSE 27017

# Start the MongoDB server with the custom configuration file
CMD ["mongod", "--config", "/etc/mongo.conf"]
