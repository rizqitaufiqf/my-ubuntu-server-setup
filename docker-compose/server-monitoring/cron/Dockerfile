# Dockerfile to create image with cron services
FROM alpine:latest

# Add the script to the Docker Image
COPY reset-db.sh /root/reset-db.sh

# Give execution rights on the cron scripts
RUN chmod +x /root/reset-db.sh

#Install Cron
RUN apk add postgresql-client

# Add the cron job for truncate db every 4 hours
RUN crontab -l | { cat; echo "0 */4 * * * sh /root/reset-db.sh > /root/reset-db.log"; } | crontab -

# Run the command on container startup
# CMD crond -b
CMD [ "crond", "-f", "-l", "3" ]