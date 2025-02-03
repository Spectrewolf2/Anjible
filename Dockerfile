FROM ubuntu:22.04

# Install OpenSSH server and sudo
RUN apt-get update && apt-get install -y openssh-server sudo

# Create an SSH directory
RUN mkdir /var/run/sshd

# Create a user named "ubuntu" with password "ubuntu" and give it sudo privileges
RUN useradd -m ubuntu && echo "ubuntu:ubuntu" | chpasswd && usermod -aG sudo ubuntu

# Allow SSH password authentication (uncomment if needed)
# Note: Ubuntu images often have "PermitRootLogin prohibit-password" by default.
# If you want to allow root login, you'd modify /etc/ssh/sshd_config accordingly.
# For now, we rely on the "ubuntu" user instead of root.

# Expose the SSH port
EXPOSE 22

# Start the SSH service in the foreground
CMD ["/usr/sbin/sshd","-D"]
