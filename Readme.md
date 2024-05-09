# **Bash Script for Managing iptables Rules**

This Bash script allows users to easily manage iptables rules on a Linux system. It prompts users to set default policies, handle traffic from specific IP addresses, and specify which connection types and ports to allow. The script provides a simple and interactive way to configure iptables firewall rules.

#### **Usage**

1. Clone or download the script to your Linux system.
2. Make the script executable:
    ```bash
    chmod +x iptables-configuration.sh
    ```
3. Run the script as root:
    ```bash
    sudo ./iptables-configuration.sh
    ```
4. Follow the prompts to set default policies, handle traffic from specific IP addresses, and specify allowed connection types and ports.

#### **Features**

- Set default input policy (ACCEPT/DROP).
- Set loopback traffic policy (ACCEPT/DROP).
- Handle traffic from a specific IP address (ACCEPT/DROP).
- Specify allowed connection types (TCP/UDP/ALL).
- Specify ports or port ranges to allow.

#### **Requirements**

- Linux operating system.
- Bash shell.

#### **Examples**

##### **Example 1: Allow HTTP and HTTPS traffic**

```bash
./iptables-configuration.sh

Set default input policy: ACCEPT
Set loopback traffic policy: ACCEPT
Handle traffic from a specific IP: no
Specify connection types: TCP
Specify ports or port ranges to allow: 80 443
```

##### **Example 2: Allow SSH traffic from a specific IP address**

```bash
./iptables-configuration.sh

Set default input policy: DROP
Set loopback traffic policy: ACCEPT
Handle traffic from a specific IP: yes
Enter the IP address: 192.168.1.100
Do you want to accept or drop traffic from this IP? (ACCEPT/DROP): ACCEPT
Specify connection types: TCP
Specify ports or port ranges to allow: 22
```

##### **Example 3: Allow all traffic from a specific IP address**

```bash
./iptables-configuration.sh

Set default input policy: DROP
Set loopback traffic policy: ACCEPT
Handle traffic from a specific IP: yes
Enter the IP address: 192.168.1.100
Do you want to accept or drop traffic from this IP? (ACCEPT/DROP): ACCEPT
Specify connection types: ALL
Specify ports or port ranges to allow: 
```

#### **Troubleshooting**

If you encounter any issues or errors while using `iptables-configurator`, feel free to join our Discord server for assistance: [Join Discord Server](https://discord.gg/nGBpfMHX4u)



#### **Contact Information**
- **Email**    : [halildeniz313@gmail.com](halildeniz313@gmail.com)
- **Linkedin** : [https://www.linkedin.com/in/halil-ibrahim-deniz](https://www.linkedin.com/in/halil-ibrahim-deniz)
- **Instagram**: [https://www.instagram.com/deniz.halil333/](https://www.instagram.com/deniz.halil333)
- **Discord**  : [https://discord.gg/nGBpfMHX4u](https://discord.gg/nGBpfMHX4u)
- **Mysite**   : [https://denizhalil.com](https://denizhalil.com/)

#### License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
