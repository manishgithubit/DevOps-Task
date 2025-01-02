# Use the official Node.js 14 image as the base image
FROM node:14

# Set the working directory in the container to /app
WORKDIR /app

# Copy the package.json and package-lock.json files from the current directory into the /app directory
COPY package*.json ./

# Install the dependencies listed in package.json using npm
RUN npm install

# Copy the rest of the application code from the current directory into the /app directory
COPY . .

# Run the build script defined in package.json using npm
RUN npm run build

# Expose port 3000 from the container to the host machine
EXPOSE 3000

# Set the default command to run when the container starts, which is to run the server.js file using Node.js
CMD ["node", "server.js"]

