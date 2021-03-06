[![Build Image & Push to Dockerhub](https://github.com/MohamedElashri/keeweb/actions/workflows/docker_image.yml/badge.svg)](https://github.com/MohamedElashri/keeweb/actions/workflows/docker_image.yml)

# keeweb
My docker image for keeweb password manager


[Keeweb](https://github.com/keeweb/keeweb) is a web app  password manager compatible with KeePass databases. It doesn't require any server or additional resources. The app can run either in a browser or as a desktop app. This repository serves as my personal docker image that I'm using on my machine.

### Using a custom config file
If you want to use a custom config you can mount the following path `/usr/share/nginx/html/config.json`. For more information about the `config.json` file please refer to this [Wiki page](https://github.com/keeweb/keeweb/wiki/Configuration#json-app-config).
After specifying the `config.json` file. Please open the `http://localhost:80/?config=config.json` route to let KeeWeb know about the configuration file.


## Usage

### Install

Pull `melashri/keeweb` from the Docker repository:

    docker pull melashri/keeweb


Or build `melashri/keeweb` from source:

    git clone https://github.com/MohamedElashri/keeweb.git
    cd dockerfile
    docker build -t melashri/keeweb .

### Run

Run the image, binding associated ports, and mounting the present working
directory:

    docker run -d -p 85:80 melashri/keeweb


## Services

Service     | Port | Usage
------------|------|------
KeeWeb      | 85 | When using `docker run`, visit `http://localhost:85` in your browser

## Volumes

Volume          | Description
----------------|-------------
`/usr/share/nginx/html/config.json` | The location of the optional config of KeeWeb.

### WebDAV

There is a version which supports WebDAV in [WebDAV](https://github.com/MohamedElashri/keeweb/tree/main/Webdav) folder

First, start KeeWeb (`/my/vault-files` must contain the vault file):
```bash
docker run -d -p 80:80 -e WEBDAV_USERNAME=webdav -e WEBDAV_PASSWORD=secret -v /my/vault-files:/usr/share/nginx/html/webdav melashri/keeweb:weddav
```

Then, go to KeeWeb through your browser, click on `More`, click on `WebDAV` and enter your configuration:

```bash
URL: https://example.com/webdav/filenanme.kdbx
Username: webdav
Password: secret
```

### Credit 
This work is based on [SvenC56/docker-keeweb](https://github.com/SvenC56/docker-keeweb)
