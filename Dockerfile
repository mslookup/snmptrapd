FROM alpine:latest

RUN apk --no-cache add net-snmp
RUN echo -e "disableAuthorization yes\nauthCommunity   log,execute,net public\nformat2 %V\\\n%Agent Address: %A\\\nAgent Hostname: %B\\\nDate: %H - %J - %K - %L - %M - %Y\\\nEnterprise OID: %N\\\nTrap Type: %W\\\nTrap Sub-Type: %q\\\nCommunity/Infosec Context: %P\\\nUptime: %T\\\nDescription: %W\\\nPDU Attribute/Value Pair Array:\\\n%v\\\n--------------\\\n" > /etc/snmp/snmptrapd.conf

#authCommunity log public" > /etc/snmp/snmptrapd.conf
EXPOSE 162
CMD ["snmptrapd","-n","-L","o","-f","-M","/usr/local/share/snmp/mibs","-m","ALL"]
