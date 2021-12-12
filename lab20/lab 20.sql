create database lba_mysql;
-- i will create the table---
create table cars ( id int(10),
                    vin varchar(50),
                    Manufacturer char(20),
                    Model varchar(50),
                    Year int(20),
                    Color char(20)
                    );
create table Custommers ( Id int(10),
						  Custommer_ID int(200),
                          Name varchar(20),
                          Phone varchar(50),
                          Email varchar(50),
                          Address varchar(50),
                          City char(20),
                          State_Province varchar(50),
                          Country char(50),
                          Postal varchar(50));
create table Salepersons (Id int(20),
                          Staff_Id int(10),
                          Name varchar(50),
                          Store char(20));
Create table Invoives (Id int(10),
                       Invoice_Number int(50),
                       Date datetime,
                       Car int(10),
                       Customer int(10),
                       Sales_Person int(10));
-----Now Iwill feed the columns with the data-------

insert into cars (id, vin, Manufacturer, Model,Year,Color)
    values ( 0, '3K096I98581DHSNUP','Volkswagen','Tiguan', 2019,'Blue'),
		 (1,'ZM8G7BEUQZ97IH46V','Peugeot','Rifter',2019,'Red'),
         (2,'RKXVNNIHLVVZOUB4M','Ford', 'Fusion', 2018, 'White'),
         (2, 'RKXVNNIHLVVZOUB4M','Ford','Fusion',2018,'White'),
         (2,'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion',	2018,	'White'),
         (2,'RKXVNNIHLVVZOUB4M','Ford','Fusion',2018,'White');
insert into Customers (Id, Custommer_ID , Name, Phone, Email, Address, City, State_Province , Country ,Postal)
values (0, 10001,'Pablo Picasso',+34636176382, '- ','Paseo de la Chopera,14','Madrid','Madrid','Spain',28045),
        (1, 20001, 'Abraham Lincoln',+13059077086, '- ',	'120 SW 8th St', 'Miami','Florida', 'United States',33130),
        (2, 30001, 'Napoléon Bonaparte',+33179754000,'-','40 Rue du Colisée Paris','Île-de-France','France', 75008);
        
insert into Salespersons ( ID, Staff_ID, Name, Store)
values (0, 00001,'Petey Cruiser','Madrid'),
        (1, 00002, 'Anna Sthesia','Barcelona'),
        (2, 00003, 'Paul Molive','Berlin'),
        (2, 00003, 'Paul Molive','Berlin'),
        (4, 00005, 'Paige Turner','Mimia'),
        (5, 00006, 'Bob Frapples','Mexico City'),
        (6, 00007, 'alter Melon','Amsterdam'),
        (7, 00008, 'Shonda Leer','São Paulo');
insert into Invoices (Id , Invoice_Number, Date ,Car ,Customer ,Sales_Person)
Values ( 0, 852399038 , 22-08-2018, 0, 1, 3),
	   ( 1, 731166526, 31-12-2018, 3, 0, 5),
       (2, 271135104, 22-01-2019, 2, 2, 7);



