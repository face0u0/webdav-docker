## usage

```docker-comose.yml
version: '3'
services:
  webdav:
    image: face0u0/webdav
    ports:
      - 3000:8080
    volumes:
      - ./data:/data      # or append ":ro" to make readonly
    environment:
      - USERNAME=username
      - PASSWORD=password
      - TZ=Asia/Tokyo
    restart: always
```
