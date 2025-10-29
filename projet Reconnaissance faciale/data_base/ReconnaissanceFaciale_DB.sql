/*==============================================================*/
/* Nom de SGBD :  Sybase SQL Anywhere 11                        */
/* Date de cr�ation :  10/09/2025 22:18:55                      */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_AVOIR_AVOIR_ETUDIANT') then
    alter table AVOIR
       delete foreign key FK_AVOIR_AVOIR_ETUDIANT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_AVOIR_AVOIR2_RAPPORT') then
    alter table AVOIR
       delete foreign key FK_AVOIR_AVOIR2_RAPPORT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ETUDIANT_APPARTENI_DEPARTEM') then
    alter table ETUDIANT
       delete foreign key FK_ETUDIANT_APPARTENI_DEPARTEM
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ETUDIANT_DETECTER_PRESENCE') then
    alter table ETUDIANT
       delete foreign key FK_ETUDIANT_DETECTER_PRESENCE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_IMAGE_POSSEDE_ETUDIANT') then
    alter table IMAGE
       delete foreign key FK_IMAGE_POSSEDE_ETUDIANT
end if;

if exists(
   select 1 from sys.systable 
   where table_name='AVOIR'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table AVOIR
end if;

if exists(
   select 1 from sys.systable 
   where table_name='DEPARTEMENT'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table DEPARTEMENT
end if;

if exists(
   select 1 from sys.systable 
   where table_name='ETUDIANT'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table ETUDIANT
end if;

if exists(
   select 1 from sys.systable 
   where table_name='IMAGE'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table IMAGE
end if;

if exists(
   select 1 from sys.systable 
   where table_name='PRESENCE'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table PRESENCE
end if;

if exists(
   select 1 from sys.systable 
   where table_name='RAPPORT'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table RAPPORT
end if;

if exists(
   select 1 from sys.systable 
   where table_name='USER'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table "USER"
end if;

/*==============================================================*/
/* Table : AVOIR                                                */
/*==============================================================*/
create table AVOIR 
(
   ID_RAPPORT           integer                        not null,
   CNE_MASSAR           char(20)                       not null,
   constraint PK_AVOIR primary key (ID_RAPPORT, CNE_MASSAR)
);

/*==============================================================*/
/* Table : DEPARTEMENT                                          */
/*==============================================================*/
create table DEPARTEMENT 
(
   ID_DEPARTEMENT       integer                        not null,
   NOM_DEPARTEMENT      char(50)                       null,
   CHEF_DEPARTEMENT     char(50)                       null,
   constraint PK_DEPARTEMENT primary key (ID_DEPARTEMENT)
);

/*==============================================================*/
/* Table : ETUDIANT                                             */
/*==============================================================*/
create table ETUDIANT 
(
   CNE_MASSAR           char(20)                       not null,
   ID_PRESENCE          integer                        not null,
   ID_DEPARTEMENT       integer                        not null,
   NOM                  char(50)                       null,
   PRENOM               char(50)                       null,
   SEX                  char(3)                        null,
   TELEPHONE            numeric                        null,
   MAIL                 char(100)                      null,
   OPTION             char(50)                       null,
   ANNEE_ACADEMIQUE     char(50)                       null,
   SEMESTRE             integer                        null,
   constraint PK_ETUDIANT primary key (CNE_MASSAR)
);

/*==============================================================*/
/* Table : IMAGE                                                */
/*==============================================================*/
create table IMAGE 
(
   ID_IMAGE             integer                        not null,
   CNE_MASSAR           char(20)                       not null,
   IMAGE                long binary                    null,
   constraint PK_IMAGE primary key (ID_IMAGE)
);

/*==============================================================*/
/* Table : PRESENCE                                             */
/*==============================================================*/
create table PRESENCE 
(
   ID_PRESENCE          integer                        not null,
   DATE_PRESENCE        date                           null,
   HEURE                time                           null,
   STATUT               char(20)                       null,
   constraint PK_PRESENCE primary key (ID_PRESENCE)
);

/*==============================================================*/
/* Table : RAPPORT                                              */
/*==============================================================*/
create table RAPPORT 
(
   ID_RAPPORT           integer                        not null,
   DATE_RAPPORT         date                           null,
   NB_JOURS_OUVRABLE    numeric                        null,
   NB_JOURS_PRESENT     numeric                        null,
   NB_JOURS_ABSENT      numeric                        null,
   MOIS                 char(20)                       null,
   constraint PK_RAPPORT primary key (ID_RAPPORT)
);

/*==============================================================*/
/* Table : "USER"                                               */
/*==============================================================*/
create table USER 
(
   ID_USER              integer                        not null,
   USERNAME             char(50)                       null,
   PASSWORD             char(50)                       null,
   constraint PK_USER primary key (ID_USER)
);

alter table AVOIR
   add constraint FK_AVOIR_AVOIR_ETUDIANT foreign key (CNE_MASSAR)
      references ETUDIANT (CNE_MASSAR)
      on update restrict
      on delete restrict;

alter table AVOIR
   add constraint FK_AVOIR_AVOIR2_RAPPORT foreign key (ID_RAPPORT)
      references RAPPORT (ID_RAPPORT)
      on update restrict
      on delete restrict;

alter table ETUDIANT
   add constraint FK_ETUDIANT_APPARTENI_DEPARTEM foreign key (ID_DEPARTEMENT)
      references DEPARTEMENT (ID_DEPARTEMENT)
      on update restrict
      on delete restrict;

alter table ETUDIANT
   add constraint FK_ETUDIANT_DETECTER_PRESENCE foreign key (ID_PRESENCE)
      references PRESENCE (ID_PRESENCE)
      on update restrict
      on delete restrict;

alter table IMAGE
   add constraint FK_IMAGE_POSSEDE_ETUDIANT foreign key (CNE_MASSAR)
      references ETUDIANT (CNE_MASSAR)
      on update restrict
      on delete restrict;

# 🔹 Vérifier ou insérer le département
    #cursor.execute("SELECT ID_DEPARTEMENT FROM DEPARTEMENT WHERE NOM_DEPARTEMENT=%s", (departement,))
    #result = cursor.fetchone()
    #if result:
        #id_departement = result[0]
    #else:
      #  cursor.execute("INSERT INTO DEPARTEMENT (NOM_DEPARTEMENT, CHEF_DEPARTEMENT) VALUES (%s, %s)", (departement, chef_departement))
      #  id_departement = cursor.lastrowid

    ### 🔹 Créer une présence par défaut
    #cursor.execute("INSERT INTO PRESENCE (DATE_PRESENCE, HEURE, STATUT) VALUES (%s, %s, %s)",
    #               (datetime.date.today(), datetime.datetime.now().time(), "Absent"))
    #id_presence = cursor.lastrowid