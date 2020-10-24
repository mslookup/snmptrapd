FROM alpine:latest

RUN apk --no-cache add net-snmp
RUN echo -e "disableAuthorization yes\nformat1 Agent_Address = %A\\\nAgent_Hostname = %B\\\nDate = %y-%02.2m-%02.2l %02.2h:%02.2j:%02.2k\\\nEnterprise_OID = %N\\\nTrap_Type = %w\\\nTrap_SubType = %q\\\nCommunity_Infosec_Context = %P\\\nUptime = %T\\\nDescription = %W\\\nPDU_Attribute_Value_Pair_Array:\\\n%V\\\n%v\\\n---\\\n\nformat2 Agent_Address = %A\\\nAgent_Hostname = %B\\\nDate = %y-%02.2m-%02.2l %02.2h:%02.2j:%02.2k\\\nEnterprise_OID = %N\\\nTrap_Type = %w\\\nTrap_SubType = %q\\\nCommunity_Infosec_Context = %P\\\nUptime = %T\\\nDescription = %W\\\nPDU_Attribute_Value_Pair_Array:\\\n%V\\\n%v\\\n---\\\n" > /etc/snmp/snmptrapd.conf

#authCommunity log public" > /etc/snmp/snmptrapd.conf
EXPOSE 162
CMD ["snmptrapd","-n","-L","o","-f","-M","/usr/local/share/snmp/mibs","-m","ALL"]
