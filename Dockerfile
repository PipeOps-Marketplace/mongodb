# Define build arguments
ARG PORT_ARG
ARG MYSQL_DATABASE_ARG
ARG MYSQL_USER_ARG
ARG MYSQL_PASSWORD_ARG
ARG MYSQL_ROOT_PASSWORD_ARG

# Set environment variables based on build arguments
ENV PORT=$PORT_ARG \
    MYSQL_DATABASE=$MYSQL_DATABASE_ARG \
    MYSQL_USER=$MYSQL_USER_ARG \
    MYSQL_PASSWORD=$MYSQL_PASSWORD_ARG \
    MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD_ARG

FROM mongo:7.0.7

# Create a directory for MySQL configuration
RUN mkdir -p /etc/mysql/conf.d

# Copy your custom MySQL configuration file into the image
COPY my.cnf /etc/mysql/conf.d/my.cnf

# Update MySQL configuration to use the custom configuration file
# Uncomment the line below if necessary, adjust the path as needed
ENV MYSQL_CONF_FILE /etc/mysql/conf.d/my.cnf

EXPOSE 3306

