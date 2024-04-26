curl --location 'http://service-face-rec:9000/verify' \
--header 'Content-Type: application/json' \
--data '{
  "source": {
    "type": "image",
    "data": "$(cat 17141119861027683 | base64 --wrap=0)"
  },
  "target": {
    "type": "image",
    "data": "$(cat 17141120396627001.jpeg | base64 --wrap=0)"
  }
}'
