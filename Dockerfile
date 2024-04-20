# Use an official Node.js runtime as a parent image
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install

# Install react-scripts globally to ensure it's available
RUN npm install -g react-scripts@latest

# Copy the rest of the application code to the working directory
COPY . .

# Run the build command
RUN npm run build

# Expose the port that the app will run on (adjust if needed)
EXPOSE 3000

# Define the command to start the app
CMD ["npm", "start"]
