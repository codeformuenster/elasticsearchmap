
## Cleanup
```bash
sudo chown $USER: . -R
for i in $(cat .gitignore); do rm "$i" -rf; done

docker-compose rm -f
```

## Init
```bash
docker-compose build

export JSPM_GITHUB_AUTH_TOKEN=$(echo -n "<github_username>:<github_api_token>" | base64)
docker-compose run aurelia ./jspm_install
```

## Run
```bash
docker-compose up
# localhost:9000
```
