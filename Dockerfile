# Use official Node.js LTS image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json only (no lockfiles)
COPY package.json ./

# Copy source and test files
COPY src ./src
COPY tests ./tests

# Install dependencies
RUN npm install

# Default command: run tests
CMD ["npm", "run", "test"]
