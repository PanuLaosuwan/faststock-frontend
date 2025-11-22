FROM node:20
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
# Build Tailwind CSS once during image build so output.css is available at runtime
RUN npm run build:css
EXPOSE 3000
CMD ["npm","run","serve"]
