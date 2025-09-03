# Use the official Node.js LTS image as the base (Debian Bullseye)
FROM node:20-bullseye

# Install GCC and necessary build tools
RUN apt-get update && apt-get install -y gcc build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json into the container
COPY package.json package-lock.json ./

# Install dependencies using npm
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Expose the application port
EXPOSE 3000

# Start the server
CMD ["node", "server.js"]
