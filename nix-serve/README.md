# README

## Sample:

Build:

    docker build -t nix-cache ./

Usage:

    docker run --name=nix-cache -ti --rm -v nix-cache:/nix -p 0.0.0.0:5000:5000 nix-cache

    # Obtain pub key:
    docker exec -ti nix-cache cat /cache-pub-key.pem

Configure nix:

    vim .config/nix/nix.conf >
        substituters = http://<CACHE ADDR>:5000
        trusted-public-keys = localhost:<KEY FROM PREV STEP>
