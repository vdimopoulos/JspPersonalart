use ismgroup53;
/* Vasilis Dimopoulos 8190038
   Dimosthenis Mpakogiannis 8190113
   Konstantinos Tsifis 8190165
   Georgios Xaloulakos 8190172*/
CREATE TABLE user(
				name VARCHAR(80) NOT NULL,
                surname VARCHAR(80) NOT NULL,
                password VARCHAR(200) NOT NULL,
                email VARCHAR(80) NOT NULL,
				primary key (email)
);
CREATE TABLE artist(
				name varchar(80) NOT NULL,
                surname varchar(80) NOT NULL,
                email VARCHAR (80),
                foreign key (email) references user(email)
);

CREATE TABLE artistprofile(
                tattooshop VARCHAR(80),
                phonenumber varchar(80),
                prefcategory VARCHAR(80),
                name varchar(80),
                surname varchar (80),
                email varchar (80),
                FOREIGN KEY (email) REFERENCES artist (email)
                ON DELETE CASCADE
                ON UPDATE CASCADE
);
CREATE TABLE categories(
				catname VARCHAR(80),
                imgsrc VARCHAR (80) NOT NULL,
                cattext VARCHAR(80) NOT NULL,
                primary key(catname)
);

CREATE TABLE photos(
				email varchar (80),
                pics BLOB,
                foreign key (email) references artistprofile (email)
                ON DELETE CASCADE
                ON UPDATE CASCADE
);