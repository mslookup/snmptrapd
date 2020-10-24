FROM alpine:latest

RUN apk --no-cache add net-snmp
RUN echo -e "disableAuthorization yes" > /etc/snmp/snmptrapd.conf
EXPOSE 162
CMD ["snmptrapd","-n","-L","o","-f","-M","/usr/local/share/snmp/mibs","-m","ALL"]
