mkdir ssh_ubuntu_docker
cd ssh_ubuntu_docker
docker build -t my_ssh_ubuntu:latest .
docker run -d --name my_ubuntu_container -p 2222:22 my_ssh_ubuntu:latest
ansible-playbook -i inventory.ini playbook.yml


```If all tasks complete successfully, you can SSH back into the container to verify:
ssh ubuntu@localhost -p 2222

Check Git:

git --version
```
