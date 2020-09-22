# This grant is equivalent to specifying *any* hosts, which makes this easier since the docker host
# is not easily known to the Docker container.
#

GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'root' IDENTIFIED BY 'root';
GRANT SELECT, RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT  ON *.* TO 'root' IDENTIFIED BY 'root';


# Create the database that will be used to populate data and watch the effect in the binlog
CREATE DATABASE plc4x;
GRANT ALL PRIVILEGES ON plc4x.* TO 'root'@'%';


#GRANT ALL PRIVILEGES ON plc4x.* TO 'root'@'10.0.0.2';



# Switch to this database
USE plc4x;

CREATE TABLE IF NOT EXISTS plc (
    address varchar(255),
    model varchar(255),
    sourceName varchar(255),
    PRIMARY KEY (address)
);


CREATE TABLE IF NOT EXISTS s7_readings (
    s7Readings_timestamp timestamp(3),
    s7Readings_address varchar(255),
    Q0 varchar(255),
    Q1 varchar(255),
    Q2 varchar(255),
    Q3 varchar(255),
    I0 varchar(255),
    I1 varchar(255),
    I2 varchar(255),
    I3 varchar(255),
    PRIMARY KEY (s7Readings_timestamp),
    CONSTRAINT FK_s7Readings_address FOREIGN KEY (s7Readings_address) REFERENCES plc(address)
); 



CREATE TABLE IF NOT EXISTS modbus_readings (
    modbusReadings_timestamp timestamp(3),
    modbusReadings_address varchar(255),
    coil1 varchar(255),
    holdingRegister1 varchar(255),
    PRIMARY KEY (modbusReadings_timestamp),
    CONSTRAINT FK_modbusReadings_address FOREIGN KEY (modbusReadings_address) REFERENCES plc(address)
);



CREATE TABLE IF NOT EXISTS alarms (
    alarm_address varchar(255),
    alarm_timestamp timestamp(3),
    alarm_message varchar(255),
    PRIMARY KEY (alarm_address,alarm_timestamp),
    CONSTRAINT FK_alarm_address FOREIGN KEY (alarm_address) REFERENCES plc(address)
);




insert into plc values('10.172.19.120','S1500','S7_SourcePLC0');
insert into plc values('10.172.19.119','S1500','S7_SourcePLC1');
insert into plc values('10.172.19.118','S1500','S7_SourcePLC2');
insert into plc values('10.172.19.117','S1500','S7_SourcePLC3');
insert into plc values('10.172.19.115','S1500','S7_SourcePLC4');
insert into plc values('10.172.19.114','S1500','S7_SourcePLC5');
insert into plc values('10.172.19.113','S1500','S7_SourcePLC6');
insert into plc values('10.172.19.112','S1500','S7_SourcePLC7');
insert into plc values('10.172.19.111','S1500','S7_SourcePLC8');
insert into plc values('10.172.19.110','S1500','S7_SourcePLC9');
insert into plc values('10.172.19.109','S1500','S7_SourcePLC10');
insert into plc values('10.172.19.108','S1500','S7_SourcePLC11');
insert into plc values('10.172.19.107','S1500','S7_SourcePLC12');
insert into plc values('10.172.19.106','S1500','S7_SourcePLC13');
insert into plc values('10.172.19.105','S1500','S7_SourcePLC14');
insert into plc values('10.172.19.104','S1500','S7_SourcePLC15');
insert into plc values('10.172.19.103','S1500','S7_SourcePLC16');
insert into plc values('10.172.19.102','S1500','S7_SourcePLC17');
insert into plc values('10.172.19.101','S1500','S7_SourcePLC18');
insert into plc values('10.172.19.128','S300','S7_SourcePLC19');
insert into plc values('10.172.19.123','S300','S7_SourcePLC20');
insert into plc values('10.172.19.124','S300','S7_SourcePLC21');
insert into plc values('10.172.19.125','S300','S7_SourcePLC22');
insert into plc values('10.172.19.126','S300','S7_SourcePLC23');
insert into plc values('10.172.19.121','S300','S7_SourcePLC24');
insert into plc values('10.172.19.127','S300','S7_SourcePLC25');
insert into plc values('10.172.19.129','S300','S7_SourcePLC26');
insert into plc values('10.172.19.130','S300','S7_SourcePLC27');
insert into plc values('10.172.19.131','S300','S7_SourcePLC28');
insert into plc values('10.172.19.132','S300','S7_SourcePLC29');
insert into plc values('10.172.19.133','S300','S7_SourcePLC30');
insert into plc values('10.172.19.134','S300','S7_SourcePLC31');
insert into plc values('10.172.19.135','S300','S7_SourcePLC32');
insert into plc values('10.172.19.136','S300','S7_SourcePLC33');
insert into plc values('10.172.19.137','S300','S7_SourcePLC34');
insert into plc values('10.172.19.138','S300','S7_SourcePLC35');
insert into plc values('10.172.19.139','S300','S7_SourcePLC36');
insert into plc values('10.172.19.122','S300','S7_SourcePLC37');
insert into plc values ('10.172.19.222','Modicon TSX Quantum 140','Modbus_SourcePLC0');





