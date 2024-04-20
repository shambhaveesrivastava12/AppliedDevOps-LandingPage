# Use an official Node.js runtime as a parent image
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies, including Material-UI 5 and react-scripts
RUN npm install && npm install react-scripts --save-dev

# Copy the rest of the application code to the working directory
COPY . .

# Add the build script to package.json if it's not already included
RUN jq -r '.scripts.build' package.json || echo '{ "scripts": { "build": "react-scripts build" } }' | jq '.scripts.build = "react-scripts build"' > temp.json && mv temp.json package.json

# Run npm install and npm run build
RUN npm install && npm run build

# Expose the port that the app will run on (adjust if needed)
EXPOSE 3000

# Define the command to start the app
CMD ["npm", "start"]
