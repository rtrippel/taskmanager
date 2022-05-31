-- create schema
create schema tm;
-- create tables
create table tm.positions
(
        id      serial primary key,
        title   varchar not null
);

create table tm.users
(
        id                      serial primary key,
        given_name              varchar not null,
        family_name             varchar not null,
        position_id             int constraint user_position_id_fk references tm.positions (id) not null,
        account_creation_date   timestamp not null default current_timestamp
);

create type tm.task_status_type as enum
(
        'NEW',
        'ASSIGNED',
        'DELETED',
        'FINISHED'
);

create table tm.tasks
(
        id          serial primary key,
        title       varchar not null,
        description varchar,
        status      tm.task_status_type not null
);

create type tm.sprint_status as enum
(
        'NEW',
        'STARTED',
        'FINISHED'
);

create table tm.sprints
(
        id          serial primary key,
        title       varchar not null,
        description varchar,
        status      tm.sprint_status not null
);

-- add data
insert into tm.positions ()