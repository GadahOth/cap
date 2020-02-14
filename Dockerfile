FROM nginx

## Step 1:
# Create a working directory
WORKDIR /app

## Step 2:
# Copy source code to working directory
COPY . index.html /usr/share/nginx/html/


## Step 3:
EXPOSE 80


