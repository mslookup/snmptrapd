FROM alpine:latest

RUN apk --no-cache add net-snmp
RUN echo -e "disableAuthorization yes\nauthCommunity   log,execute,net public\nlogoption s 2\nlogoption f /var/log/snmptrapd/snmptrapd-direct.log\nformat2 %.4y-%.2m-%.2l %.2h:%.2j:%.2k %B [%b]:\\n%v\\n"

#authCommunity log public" > /etc/snmp/snmptrapd.conf
EXPOSE 162
CMD ["snmptrapd","-n","-L","o","-f","-M","/usr/local/share/snmp/mibs","-m","ALL"]
