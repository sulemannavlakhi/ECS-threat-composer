# builder
FROM node:18-alpine AS build
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install
COPY . .
RUN yarn build

# runtime
FROM node:18-alpine AS runtime
WORKDIR /app 
RUN yarn global add serve
COPY --from=build app/public /app/public
COPY --from=build app/build /app/build
RUN addgroup -S suleman_group && \
    adduser -S -G suleman_group suleman_user
RUN chown -R suleman_user:suleman_group /app/public 
USER suleman_user
EXPOSE 3000
CMD ["serve","-s","build", "-l", "3000"]