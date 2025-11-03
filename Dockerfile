# Use a small, secure Node base image
FROM node:20-alpine AS base

# Set working directory inside the container
WORKDIR /app

# Copy only package manifests first to leverage Docker layer caching
# IMPORTANT: Build with repository root as the build context, e.g.:
#   docker build -f server/Dockerfile -t innovative-server .
COPY package*.json ./

# Install dependencies (omit dev dependencies for production images)
RUN npm ci --omit=dev

# Copy server source code
COPY server/api ./server/api

# Environment configuration
ENV NODE_ENV=production

# The app reads PORT from env; set a sensible default
ENV PORT=5000

# Expose the server port
EXPOSE 5000

# Start the server
CMD ["node", "server/api/index.js"]


