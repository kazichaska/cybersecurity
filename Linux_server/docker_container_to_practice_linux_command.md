### 1. **Ubuntu Container**
   - Command to pull and run:
     ```bash
     docker run -it --name ubuntu-practice ubuntu:latest
     ```
   - Features:
     - Lightweight.
     - Standard Ubuntu environment.
     - Suitable for beginners and general practice.

---

### 2. **Alpine Linux Container** 
   - Command to pull and run:
     ```bash
     docker run -it --name alpine-practice alpine:latest
     ```
   - Features:
     - Extremely lightweight (small image size).
     - Ideal for advanced users who want to practice in a minimalistic environment.
     - Does not include all standard Linux tools by default (e.g., `bash`, `curl`, etc.).

---

### 3. **CentOS Container**
   - Command to pull and run:
     ```bash
     docker run -it --name centos-practice centos:latest
     ```
   - Features:
     - Popular for practicing commands used in RHEL-based systems.
     - Great for learning enterprise Linux environments.

---

### 4. **Debian Container**
   - Command to pull and run:
     ```bash
     docker run -it --name debian-practice debian:latest
     ```
   - Features:
     - Lightweight and stable.
     - Similar to Ubuntu but without some of the additional tooling.

---

### 5. **Fedora Container**
   - Command to pull and run:
     ```bash
     docker run -it --name fedora-practice fedora:latest
     ```
   - Features:
     - Great for users familiar with Fedora.
     - Includes newer software versions.

---

### Tips for Practicing:
1. **Keep Data Persistent**  
   Add a volume to persist changes:
   ```bash
   docker run -it -v $(pwd)/data:/root/data --name ubuntu-practice ubuntu:latest
   ```
   This mounts a directory from your host machine to `/root/data` inside the container.

2. **Install Missing Tools**  
   You can install additional tools in the container as needed:
   ```bash
   apt update && apt install -y vim curl
   ```

3. **Use `--rm` for Disposable Containers**  
   If you don't need persistence, use `--rm` to clean up the container after exiting:
   ```bash
   docker run -it --rm ubuntu:latest
   ```

By default, most Docker containers run as the `root` user, meaning:

1. **There is no separate `sudo` configuration needed initially** because you are already root inside the container.
2. **If you switch to a non-root user or the container defaults to a non-root user**, you may need to configure `sudo` manually.

---

### Default Behaviors for Each Base Image
1. **Ubuntu, Debian, CentOS, Fedora**:
   - You start as the `root` user with no password.
   - If a password is required, you must set one manually.

2. **Alpine Linux**:
   - Starts as `root` by default.
   - No password is set.

---

### Setting Up `sudo` Inside a Container
If you want to create a user, assign a password, and use `sudo`, follow these steps:

#### Ubuntu/Debian Example:
```bash
# Run container
docker run -it ubuntu:latest

# Update and install sudo (if not present)
apt update && apt install -y sudo

# Add a new user and set a password
adduser user1
# Add the user to the sudo group
usermod -aG sudo user1

# Switch to the new user
su - user1
# Test sudo (you'll need the password you set for the user)
sudo apt update
```

#### CentOS/Fedora Example:
```bash
# Run container
docker run -it centos:latest

# Install sudo (if not present)
yum install -y sudo

# Add a new user and set a password
adduser user1
passwd user1

# Add the user to the wheel group (sudo equivalent)
usermod -aG wheel user1

# Switch to the new user
su - user1
# Test sudo
sudo yum update
```

#### Alpine Example:
```bash
# Run container
docker run -it alpine:latest

# Install sudo
apk add --no-cache sudo

# Add a new user and set a password
adduser -D user1
passwd user1

# Add the user to a group and configure sudo
addgroup user1 wheel
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Switch to the new user
su user1
# Test sudo
sudo apk add curl
```

---

### Notes:
1. **Persisting Changes**:
   Any user or password changes inside the container will be lost when the container stops unless you commit the changes to a new image:
   ```bash
   docker commit <container_id> my-custom-image
   ```
2. **Security**:
   Docker containers are often ephemeral. For security reasons, you might avoid setting passwords unless necessary for your workflow.