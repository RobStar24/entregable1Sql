create database blog_db

--TABLA users
create table users (
	id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50)
);

--Añadir 3 usuarios
insert into users (first_name, last_name, email) values
('Fulanito', 'DeTal', 'falad@gmail.com'),
('Pedro', 'Navajas', 'filoso@gmail.com'),
('Lola', 'Trailera', 'ruta69@gmail.com');


--TABLA posts
create table posts (
	id serial primary key,
	creator_id int references users(id),
	title varchar(300),
	text text
);

--Añadir 5 posts
insert into posts (creator_id, title, text) values
(2, 'Lorem', 'El que come callado, come dos veces'),
(1, 'Se viene lo nuevo', 'No se pierdan el lanzamiento de mi nuevo sencillo'),
(1, 'Modo creativo', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur id velit vel nulla varius convallis.'),
(3, 'Manejar es mi pasion', 'Manejar un trailer y sentir la adrenalina de llevar control de el'),
(3, 'Aunque no lo entiendan', 'No todos comprenderan tu camino');


--TABLA likes
create table likes (
	id serial primary key,
	user_id int references users(id),
	post_id int references posts(id)
);


--Añadiendo 5 likes
insert into likes (user_id, post_id) values
(1, 3),
(1, 5),
(2, 5),
(3, 4),
(3, 1);


--Todos los posts con la informacion del usuario que los creo
select posts.*, users.first_name, users.last_name, users.email from posts inner join users 
on posts.creator_id = users.id;


--Todos los posts con la info de los usuarios que le dieron like
select posts.*, users.first_name, users.last_name, users.email from posts inner join likes 
on posts.id = likes.post_id inner join users 
on likes.user_id = users.id;