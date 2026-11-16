# Load balancer

Bash scripts that add a second web server and a HAProxy load balancer.

- `0-custom_http_response_header`: installs Nginx and adds an `X-Served-By` header with the server hostname (run on web-01 and web-02).
- `1-install_load_balancer`: installs HAProxy on lb-01 and distributes traffic to web-01 and web-02 with roundrobin.
