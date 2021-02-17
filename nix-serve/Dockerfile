FROM nixos/nix

RUN  nix-env -i nix-serve \
  && nix-store --generate-binary-cache-key localhost cache-priv-key.pem cache-pub-key.pem \
  && mv cache-priv-key.pem /var/cache-priv-key.pem \
  && chmod 600 /var/cache-priv-key.pem \
  && echo "Use this key pub key: $(cat cache-pub-key.pem)"

ENV NIX_SECRET_KEY_FILE=/var/cache-priv-key.pem

VOLUME /nix

CMD nix-serve --listen :5000 --error-log /dev/stderr --pid /var/run/nix-serve.pid
