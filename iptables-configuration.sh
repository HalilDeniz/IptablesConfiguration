#!/bin/bash

# Colors
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Default policies
DEFAULT_POLICY="DROP"
LOOPBACK_POLICY="ACCEPT"

# Flush iptables rules
iptables -F

# Ask user to set default policies
echo -e "${YELLOW}Set default input policy:${NC}"
read -p "ACCEPT/DROP: " default_policy_input
echo -e "${YELLOW}Set loopback traffic policy:${NC}"
read -p "ACCEPT/DROP: " loopback_policy_input

# Optionally, ask user if they want to handle traffic from a specific IP
echo -e "${YELLOW}Handle traffic from a specific IP:${NC}"
read -p "Do you want to accept? (yes/no): " allow_specific_ip
if [ "$allow_specific_ip" == "yes" ]; then
    read -p "Enter the IP address: " specific_ip
    read -p "Do you want to accept or drop traffic from this IP? (ACCEPT/DROP): " specific_ip_action
fi

# Set default policies
iptables -P INPUT $DEFAULT_POLICY
iptables -P FORWARD $DEFAULT_POLICY
iptables -P OUTPUT ACCEPT
iptables -A INPUT -i lo -j $LOOPBACK_POLICY

# Ask user for connection types and ports to allow
echo -e "${YELLOW}Specify connection types:${NC}"
read -p "TCP/UDP/ALL: " protocol_input
echo -e "${YELLOW}Specify ports or port ranges to allow:${NC}"
read -p "Port (e.g., 80) or port range (e.g., 22-80): " port_input

# Handle traffic from a specific IP, if specified
if [ "$allow_specific_ip" == "yes" ]; then
    if [ "$specific_ip_action" == "ACCEPT" ]; then
        iptables -A INPUT -s $specific_ip -j ACCEPT
    elif [ "$specific_ip_action" == "DROP" ]; then
        iptables -A INPUT -s $specific_ip -j DROP
    fi
fi

# Process protocol and port inputs
if [ "$protocol_input" == "ALL" ]; then
    protocol="-p all"
else
    protocol="-p $protocol_input"
fi

# Process port inputs
IFS='-' read -ra port_range <<< "$port_input"
if [ ${#port_range[@]} -eq 1 ]; then
    port="-m multiport --dports ${port_range[0]}"
else
    port="-m multiport --dports ${port_range[0]}:${port_range[1]}"
fi

# Apply rules
iptables -A INPUT $protocol $port -j ACCEPT

# Save connection permissions
iptables-save > /etc/iptables/rules.v4

# Restart iptables service
systemctl restart iptables

echo -e "${GREEN}Iptables rules successfully updated!${NC}"
echo "If you encounter any errors or need assistance, please join our Discord server: https://discord.gg/nGBpfMHX4u"

