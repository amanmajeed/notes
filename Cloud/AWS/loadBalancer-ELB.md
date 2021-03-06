- Types of ELB
  - HTTP/HTTPS
  - TCP/TLS
  - Classic Load Balancer : Is no longer suggested to be used. Needs manually adding IP's of VM making it (auto) unscalable
- Configure SG
  - The SG which is linked to ELB
  - SG has source IP and target ports
  - SG can have source as CIDR, IP, another SG
  - SG is like a Firewall, we give source details and port details
- Configure Routing
  - Configure TG  : Target Group
    - Grouping of instances across multiple AZ's.
    - TG easier to manage.
    - TG allow for easy scaling of EC2's
    - 1 TG = 1 ELB
  - Configure Health Checks
    - Protocol : HTTP or HTTPS
    - Path :  For HTTP/HTTPS, the LB will check if this URI is accessible to mark the instance as healthy/unhealthy. Must being with /
  - Advanced Health Check
    - Port : Set if a different port must be probed
    - Healthy Threshold :  The number of consecutive health checks successes required before considering an unhealthy target healthy
    - Unhealthy threshold
      - The number of consecutive health check failures required before considering a target unhealthy 
      - For TCP/TLS, is hard-coded as 3
    - Timeout 
      - The amount of time, in seconds, during which no response means a failed health check (2-120 seconds)
      - For  TCP/TLS, is hard-coded as 10
    - Interval
      - The approximate amount of time between health checks of an individual target (5-300 seconds)
      - For TCP/TLS choose between 10 or 30 only
    - Success codes
      - Only for HTTP/HTTPS requests 
      - The HTTP codes to use when checking for a successful response from a target. 
      - You can specify multiple values (for example, "200,202") or a range of values (for example, "200-299").
- Register Targets
  - Register the targets to which request is to be sent.
  - An option to give a different port here, this is if the application port is different that the LB port. Similar to port forwarding.
