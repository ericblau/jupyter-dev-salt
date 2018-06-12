#!jinja|yaml|gpg
hostdata:
  jupyter-dev:
    groups:
      - jupyter
    anaconda: 
      version3
    jupyter:
      ip: 127.0.0.1
      port: 8000
      proxy_api_ip: 127.0.0.1
      proxy_api_port: 0
      jupyter_ssl_cert: |
        -----BEGIN CERTIFICATE-----
        -----END CERTIFICATE-----
      jupyter_ssl_key: |
        -----BEGIN PGP MESSAGE-----
        -----END PGP MESSAGE-----
      admin_users:
        - tjackson
      white_list_users:
        - blau
        - nicks
