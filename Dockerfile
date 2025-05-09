FROM node:19-alpine

# Copy package.json, wildcard used so both package.json AND package-lock.json are copied
# slash '/' at the end of app is important, so it created an app directory, otherwise -> error
COPY package*.json /usr/app/

# copy the app files from src directory
COPY src /usr/app/

# Create directory & set def dir so next command -> executes in /usr/app dir, 
# liked cd-ing into /usr/app to execute npm install
WORKDIR /usr/app

# dependencies
RUN npm install

# start app
CMD ["node", "server.js"]
