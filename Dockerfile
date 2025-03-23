FROM node:22 as server

WORKDIR /app

COPY package*.json ./

# copy build folder from action script
COPY build ./build

# clean install
# --omit=dev is used to exclude devDependencies
RUN npm ci --omit=dev

EXPOSE 4001

# SET env to production to avoid unnecessary logs
ENV NODE_ENV=production

# set env to port 4000, this is the port the app will run on
ENV PORT=4001

# this command will be called when the container starts
CMD ["node", "build"]

