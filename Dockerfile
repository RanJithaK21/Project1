FROM node:22-alpine

WORKDIR /usr/src/app

# Create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

COPY package*.json ./
RUN npm install

COPY . .

# Change ownership
RUN chown -R appuser:appgroup /usr/src/app

USER appuser

EXPOSE 80

CMD ["npm", "start"]
