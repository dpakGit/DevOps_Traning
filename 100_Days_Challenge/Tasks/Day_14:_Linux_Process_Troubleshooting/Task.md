### Most important article : https://tundedamian.medium.com/day-14-of-100-days-of-devops-linux-process-troubleshooting-3b86d8fae5ad



**Note:**

**Difference Between ss -tulnp and ss -tlnp**
- *ss -tulnp*:
    - -t: Show TCP sockets.
    - -u: Show UDP sockets.
    - -l: Show listening sockets.
    - -n: Don't resolve names.
    - -p: Show processes using sockets.
- *ss -tlnp*:
    - Shows *only TCP (-t)* listening (-l) sockets.
    - No UDP sockets shown because -u is missing.

*Outcome for :3002*
- If something listens on TCP port 3002, both commands show it.
- If something listens on UDP port 3002, only *ss -tulnp* shows it.


*Example: ss Commands with Port 3002*
- Suppose:
    - A TCP service listens on port 3002.
    - A UDP service listens on port 3003.

Output
- *ss -tlnp | grep :3002*:
    - Shows the TCP service on port 3002.
- *ss -tulnp | grep :3002*:
    - Shows the TCP service on port 3002 (no UDP on 3002).
- *ss -tulnp | grep :3003*:
    - Shows the UDP service on port 3003.

Example Commands:

bash
# Shows TCP on 3002
ss -tlnp | grep :3002

# Shows TCP + UDP listeners on 3002
ss -tulnp | grep :3002

-----------------------------------------

**Difference Between netstat -tulnp and netstat -tlnp**

- *netstat -tulnp*:
    - -t: Show TCP sockets.
    - -u: Show UDP sockets.
    - -l: Show listening sockets.
    - -n: Don't resolve names.
    - -p: Show processes using sockets.
- *netstat -tlnp*:
    - Shows *only TCP (-t)* listening (-l) sockets.
    - No UDP sockets shown because -u is missing.

Example with Port 3002
- Suppose:
    - A TCP service listens on port 3002.
    - A UDP service listens on port 3003.

Output
- *netstat -tlnp | grep :3002*:
    - Shows the TCP service on port 3002.
- *netstat -tulnp | grep :3002*:
    - Shows the TCP service on port 3002 (no UDP on 3002).
- *netstat -tulnp | grep :3003*:
    - Shows the UDP service on port 3003.



**Difference Between ss and netstat**
- *ss vs netstat*:
    - Both show socket statistics.
    - *ss* is newer, part of iproute2 package.
    - *netstat* is part of net-tools, considered legacy on some systems.
- Output is similar for same options (-tulnp).
- *ss often faster* and more efficient.

Example with Port 3002
- *ss -tulnp | grep :3002* and *netstat -tulnp | grep :3002*:
    - Both show TCP/UDP listeners on port 3002 if any.

Availability
- On modern Linux, *ss* likely available; *netstat* might need net-tools install.

