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


Or build `svenc56/keeweb` from source:

    git clone https://github.com/MohamedElashri/keeweb.git
    cd dockerfile
    docker build -t melashri/keeweb .

### Run

Run the image, binding associated ports, and mounting the present working
directory:

    docker run -d -p 87:80 melashri/keeweb


## Services

Service     | Port | Usage
------------|------|------
KeeWeb      | 87 | When using `docker run`, visit `http://localhost:87` in your browser

## Volumes

Volume          | Description
----------------|-------------
`/usr/share/nginx/html/config.json` | The location of the optional config of KeeWeb.

### Credit 
This work is based on [SvenC56/docker-keeweb](https://github.com/SvenC56/docker-keeweb)