
## Init:
```bash
JSPM_GITHUB_AUTH_TOKEN={{ github token }}
docker-compose run aurelia ./jspm_install
```

## Run


## Cleanup:
```bash
sudo chown $USER: . -R
for i in $(cat .gitignore); do echo $i; done
```
