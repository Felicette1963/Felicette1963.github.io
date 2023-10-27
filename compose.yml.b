version: '2'

services:
  nginx-proxy:
    image: nginxproxy/nginx-proxy
    ports:
      - "80:80"
    volumes:
      - /var/run/docker.sock:/tmp/docker.sock:ro

  ##################
  ##### fly.io #####
  ##################

  felicette1963:
    image: https://felicette1963.fly.dev/
    expose:
      - "80"
    environment:
      - VIRTUAL_HOST=Felicette.flyio.com
      - VIRTUAL_PORT=80
    deploy:
      mode: replicated
      replicas: 1  # https://docs.docker.com/compose/compose-file/deploy/#replicas
      resources:  # https://docs.docker.com/compose/compose-file/compose-file-v3/#resources
        limits:
          cpus: '0.05'
          memory: 50M
        reservations:
          cpus: '0.01'
          memory: 6M

  ##################
  # github.io blog #
  ##################

  # felicette1963:
  #   image: felicette1963/felicette1963.github.io
  #   expose:
  #     - "80"
  #   environment:
  #     - VIRTUAL_HOST=Felicette.com
  #     - VIRTUAL_PORT=80

  # doxgxxn:
  #   image: oelrm/doxgxxn.github.io
  #   expose:
  #     - "80"
  #   environment:
  #     - VIRTUAL_HOST=doxgxxn.com
  #     - VIRTUAL_PORT=80

  # sam1000won:
  #   image: jiugnim/sam1000wongithubio
  #   expose:
  #     - "80"
  #   environment:
  #     - VIRTUAL_HOST=sam1000won.com
  #     - VIRTUAL_PORT=80

  # tjkpolisher:
  #   image: tjkpolisher/tjkpolisher.github.io
  #   expose:
  #     - "80"
  #   environment:
  #     - VIRTUAL_HOST=tjkpolisher.com
  #     - VIRTUAL_PORT=80

  # 8trider:
  #   image: seohyeongwon/8trider.github.io:1.1.0
  #   expose:
  #     - "80"
  #   environment:
  #     - VIRTUAL_HOST=8trider.com
  #     - VIRTUAL_PORT=80