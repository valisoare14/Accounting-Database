
DROP TABLE ANGAJAT CASCADE CONSTRAINTS;
DROP TABLE CONTABILI CASCADE CONSTRAINTS;
DROP TABLE SEDIU CASCADE CONSTRAINTS;
DROP TABLE CONTRIBUTII CASCADE CONSTRAINTS;



--Sa se creeze tabela ANGAJAT , care sa contina urmatoarele campuri : id_angajat , id_contabil , nume , prenume , varsta , salariul
create table ANGAJAT(id_angajat number(7) , id_contabil number(7) , nume varchar2(25) ,prenume varchar2(25) , varsta number(7) , salariul number(7));
--Sa se adauge urmatoarele restrictii in tabela ANGAJAT : id_angajat-primary key ; id_angajat-restrictia de integritate ; id_contabil-foreign key
alter table ANGAJAT add constraint id_angajat_PK primary key(id_angajat); 
alter table ANGAJAT add constraint id_angajat_nn check(id_angajat is not null);
alter table ANGAJAT add constraint id_contabil_FK foreign key(id_contabil) references CONTABILI(id_contabil);

--Sa se creeze tabela CONTABILI , care sa contina urmatoarele campuri :   id_contabil ,id_sef_contabil ,  nume , prenume , id_sediu
create table CONTABILI(id_contabil number(7) ,id_sef_contabil number(7) , nume varchar2(25), prenume varchar2(25) ,id_sediu number(7));
--Sa se adauge urmatoarele restrictii in tabela CONTABILI : id_contabil-primary key ; id_contabil-restrictia de integritate ; id_sediu-foreign key
alter table CONTABILI add constraint id_contabil_PK primary key(id_contabil);
alter table CONTABILI add constraint id_contabil_NN check(id_contabil is not null);
alter table CONTABILI add constraint id_sediu_FK foreign key(id_sediu) references SEDIU(id_sediu);

--Sa se creeze tabela SEDIU , care sa contina urmatoarele campuri : id_sediu , denumire_sediu , locatie
create table SEDIU(id_sediu number(7) , denumire_sediu varchar2(25) , locatie varchar2(25));
--Sa se adauge urmatoarele restrictii in tabela SEDIU : id_sediu-primary key ; id_sediu-restrictia de integritate
alter table SEDIU add constraint id_sediu_PK primary key(id_sediu);
alter table SEDIU add constraint id_sediu_NN check(id_sediu is not null);

--Sa se creeze tabela CONTRIBUTII , care sa contina urmatoarele campuri : id_angajat , cas , cass , impozit , dataa
create table CONTRIBUTII(id_angajat number(7) , cas number(7) , cass number(7) , impozit number(7) , dataa date);
--Sa se adauge urmatoarele restrictii in tabela CONTRIBUTII : id_angajat-foreign key
alter table CONTRIBUTII add constraint id_angajat_FK foreign key(id_angajat) references ANGAJAT(id_angajat);


--Exemple cu opera?ii de actualizare a datelor: INSERT, UPDATE, DELETE:


--Sa se adauge 5 angjati in tabela ANGAJAT , dintre care cel cu id-ul =1 sa fie numele elevului care realizeaza proiectul
insert into ANGAJAT (id_angajat , id_contabil , nume , prenume , varsta , salariul) values(1 , 1 , 'SOARE' , 'VALENTIN' , 20 , 1800); 
insert into ANGAJAT(id_angajat , id_contabil , nume , prenume , varsta , salariul) values(2 , 1 , 'POPESCU' , 'LEONARD' , 20 , 1800); 
insert into ANGAJAT (id_angajat , id_contabil , nume , prenume , varsta , salariul) values(3 , 2 , 'MANTEA' , 'ION' , 39 , 2700);
insert into ANGAJAT (id_angajat , id_contabil , nume , prenume , varsta , salariul) values(4 , 3 , 'RADUCU' , 'IVAN' , 45 , 2800);
insert into ANGAJAT (id_angajat , id_contabil , nume , prenume , varsta , salariul) values(5 , 5 , 'PINTEA' , 'COSTEL' , 24 , 3200);
insert into ANGAJAT (id_angajat , id_contabil , nume , prenume , varsta , salariul) values(6 , 4 , 'MARIA' , 'DOLORES' , 66 , 4800);
insert into ANGAJAT (id_angajat , id_contabil , nume , prenume , varsta , salariul) values(7 , 3 , 'FLORIN' , 'ANTONESCU' , 31 , 2500);
select*from ANGAJAT;

--Sa se seteze salariul angajatului cu id_angajat=1 cu 2000 lei
update ANGAJAT set salariul=2000 where id_angajat=1;
select*from ANGAJAT where id_angajat=1;

--Sa se elimine angajatul cu id_angajat=2
delete from ANGAJAT where id_angajat=2;
select*from ANGAJAT;

--Sa se adauge 5 contabili in tabela CONTABILI
insert into CONTABILI(id_contabil , nume , prenume, id_sediu , id_sef_contabil) values(1 , 'OPREA', 'MITICA' , 1 , 0);
insert into CONTABILI(id_contabil , nume , prenume , id_sediu , id_sef_contabil) values(2 , 'EUGEN' ,'HERGHELEGIU' , 2 , 3);
insert into CONTABILI(id_contabil , nume , prenume , id_sediu , id_sef_contabil) values(3 , 'VASILE' ,'TUBUS' , 3 , 1);
insert into CONTABILI(id_contabil , nume , prenume , id_sediu , id_sef_contabil) values(4 , 'COSMIN' ,'RICU' , 4 , 2);
insert into CONTABILI(id_contabil , nume , prenume ,id_sediu , id_sef_contabil) values(5 , 'SANDU' , 'BALU' , 4 , 4);
select*from CONTABILI;

--Sa se schimbe numele contabilului cu id_contabil=1 in 'Andrei'
update CONTABILI set nume='ANDREI' where id_contabil=1;
select*from CONTABILI where id_contabil=1;

--Sa se elimine contabilul cu id_contabil=4
delete from CONTABILI where id_contabil=4;
select*from CONTABILI ;

--Sa se insereze 5 sedii in tabela SEDIU
insert into SEDIU (id_sediu , denumire_sediu , locatie) values (1 , 'vanti' , 'Chitila');
insert into SEDIU (id_sediu , denumire_sediu , locatie) values (2 , 'cunus' , 'Pantelimon');
insert into SEDIU (id_sediu , denumire_sediu , locatie) values (3 , 'valal' , 'Vaceni');
insert into SEDIU (id_sediu , denumire_sediu , locatie) values (4 , 'print' , 'Oradea');
insert into SEDIU (id_sediu , denumire_sediu , locatie) values (5 , 'balos' , 'Voluntari');
insert into SEDIU (id_sediu , denumire_sediu , locatie) values (6 , 'event' , 'Giurgiu');
select*from SEDIU;

--Sa se schimbe denumirea sediului cu id_sediu=1 in 'cuval'
update SEDIU set denumire_sediu='cuval' where id_sediu=1;
select*from SEDIU where id_sediu=1;

--Sa se elimine sediul cu denumire_sediu='valal'
delete from SEDIU where denumire_sediu='valal';
select*from SEDIU ;

--Sa se introduca contributiile angajatilor din tabela ANGAJAT in tabela CONTRIBUTII
insert into CONTRIBUTII (id_angajat , cas , cass , impozit , dataa) values (1 , 500 , 200 , 200 , to_date('17-09-2021', 'dd-mm-yyyy'));
insert into CONTRIBUTII (id_angajat , cas , cass , impozit , dataa) values (2 , 450 , 180 , 280 , to_date('23-11-2021', 'dd-mm-yyyy'));
insert into CONTRIBUTII (id_angajat , cas , cass , impozit , dataa) values (3 , 675 , 270 , 270 , to_date('02-01-2022', 'dd-mm-yyyy'));
insert into CONTRIBUTII (id_angajat , cas , cass , impozit , dataa) values (4 , 700 , 280 , 280 , to_date('14-02-2022', 'dd-mm-yyyy'));
insert into CONTRIBUTII (id_angajat , cas , cass , impozit , dataa) values (5 , 800 , 320 , 320 , to_date('28-06-2022', 'dd-mm-yyyy'));
insert into CONTRIBUTII (id_angajat , cas , cass , impozit , dataa) values (6 , 1200 , 480 , null , to_date('10-08-2022', 'dd-mm-yyyy'));
select*from CONTRIBUTII;

--Sa se modifice cas al angajatului cu id_angajat=1 cu 510
update CONTRIBUTII set cas=510 where id_angajat=1;
select*from CONTRIBUTII where id_angajat=1;

--Sa se stearga contributia angajatului cu id_angajat=2
delete from CONTRIBUTII where id_angajat=2;
select*from CONTRIBUTII;

--5.Exemple de interog?ri cât mai variate ?i relevante pentru tema aleas? (min 20) care s? combineurm?toarele elemente (toate):
-->, <, >=, <=, !=, IS NULL, LIKE, IN, BETWEEN; 

--Sa afiseze angajatii cu salariile mai mari de 2700
select nume , prenume , salariul from ANGAJAT where salariul>2700;

--Sa se afiseze angajatii cu salariile mai mici de 2700
select nume , prenume , salariul from ANGAJAT where salariul<2700;

--Sa se afiseze id-ul angajatilor ce au platit impozite la stat mai mari de 280 lei
select id_angajat , impozit from CONTRIBUTII where impozit >=280;

--Sa se afiseze id-ul angajatilor ce au platit impozite la stat mai mici de 320 lei
select id_angajat , impozit from CONTRIBUTII where impozit<=320;

--Sa se afiseze toate sediile cu id-ul diferit de 1
select*from SEDIU where id_sediu != 1;

--Sa se afiseze id-ul angajatului care nu plateste impozit la stat
select id_angajat from CONTRIBUTII where impozit is null;

--Sa se afiseze denumirea sediilor localizate in orase care incep cu litera V
select denumire_sediu from SEDIU where locatie like 'V%';

--Sa se afiseze id-ul de sediu al contabiluluicu prenumele MITICA
select id_sediu from CONTABILI where prenume in 'MITICA';

--Sa se afiseze angajatii cu varsta cuprinsa intre 20 si 50 de ani 
select nume , prenume , varsta from ANGAJAT where varsta between 20 and 50;


-->Jonc?iuni (inner, outer);

--Sa se afiseze numele , prenumele si impozitul platit de toti angajatii care sunt inregistrati in tabela de CONTIBUTII - inner join
select a.nume , a.prenume , c.impozit from ANGAJAT a , CONTRIBUTII c where a.id_angajat=c.id_angajat;

--Sa se afiseze id-ul sediului si numele si prenumele contabilului care lucreaza la sediul respectiv - outer join
select s.id_sediu , c.nume , c.prenume from SEDIU s , CONTABILI c where s.id_sediu=c.id_sediu(+);


-->Utilizarea func?iilor de grup, clauzelor GROUP BY, HAVING;

--Sa se afiseze id_ul contabililor si numarul de angajati cu care lucreaza , doar pt contabilii care lucreaza cu cel putin 2 angajati
select id_contabil ,  count(id_angajat) numar_angajati from ANGAJAT 
group by id_contabil
having count(id_angajat) >= 2
order by numar_angajati ;

-->Utilizarea func?iilor la nivel de rând (obligatoriu: TO_CHAR?, TO_DATE?, EXTRACT?,SUBSTR?, SYSDATE?, DECODE?, CASE?, NVL?);

--Sa se afiseze id-ul abgajatilor care si-au platit contributiile dupa data de 01 Ianuarie 2022
select id_angajat from CONTRIBUTII where dataa>to_date('01.01.2022' , 'dd.mm.yy');

--Sa se afiseze numele si prenumele angajatului care si-a platit contributiile in luna August
select a.nume , a.prenume , c.dataa from ANGAJAT a , CONTRIBUTII c where a.id_angajat=c.id_angajat and extract(month from dataa)=08;

--Sa se afiseze angajatii si data la care si-au platit contributiile in format MM.YY
select a.nume , a.prenume , to_char(dataa , 'mm.yy') data_plata from ANGAJAT a , CONTRIBUTII c where a.id_angajat=c.id_angajat;

--Sa se afiseze numele si prenumele angajatilor care lucreaza cu contabilul cu id_contabil=1
select nume , prenume , id_contabil from ANGAJAT where substr(id_contabil , 1 , 1)='1';

--Sa se afiseze cate saptamani au trecut de la plata ultimelor contributii ale fiecarui angajat
select id_angajat , (sysdate-dataa)/7 saptamani from CONTRIBUTII;

--Sa se aplice urmatoarele comisioane pt angajati:
--Daca apartine de contabil 1 -10%
--Daca apartine de contabil 2 - 8%
--Daca apartine de contabil 3 - 4%
--Daca apartine de contabil 4 -  1%
--Daca apartine de contabil 5 -  2%
--Si sa se afiseze acestea
select nume , prenume , decode(id_contabil , '1' , 0.1 , '2' , 0.08 , '3' , 0.04 , '4' , 0.01 , '5' , 0.02 , 0)*salariul comision from ANGAJAT;

--Sa se incadreze sediile in felul urmator(Pe judete):
--'Chitilia' => Ilfov
--'Pantelimon' => Ilfov
--'Vaceni' => Teleorman
--'Oradea' => Oradea
--'Voluntari' => Ilfov
--'Giurgiu' =>Giurgiu
select denumire_sediu , case when upper(locatie)='CHITILA' then 'Ilfov' when upper(locatie)='PANTELIMON' then 'Ilfov' when upper(locatie)='VACENI' then 'Teleorman' when upper(locatie)='ORADEA' then 'Oradea' when upper(locatie)='VOLUNTARI' then 'Ilfov' when upper(locatie)='GIURGIU' then 'Giurgiu' else 'niciun_judet' end judet from SEDIU;

--Sa se afiseze contributiile totale ale angajatilor

select a.nume , a.prenume , nvl(c.cas , 0)+nvl(c.cass , 0)+nvl(c.impozit , 0) total_de_plata from ANGAJAT a , CONTRIBUTII c where a.id_angajat=c.id_angajat;


-->Utilizarea operatorilor UNION, MINUS, INTERSECT;

--Sa se afiseze toti angajatii , mai putin cei cu varsta peste 40 de ani
select nume , prenume , varsta from ANGAJAT
minus
select nume , prenume , varsta from ANGAJAT where varsta>40;

--Sa se adauge urmatorele sporuri de vechime la salariile angajatilor si sa se afiseze noile salarii
--20<varsta<30 -> 10%
--30<varsta<40 -> 20%
--40<varsta<50 -> 30%
--50<varsta<60 -> 40%
--60<varsta<70 -> 50%
select nume , prenume , varsta , salariul*1.1 noul_salariu from ANGAJAT where varsta>19 and varsta <=30
union
select nume , prenume , varsta , salariul*1.2 noul_salariu from ANGAJAT where varsta>30 and varsta <=40
union
select nume , prenume , varsta , salariul*1.3 noul_salariu from ANGAJAT where varsta>40 and varsta <=50
union
select nume , prenume , varsta , salariul*1.4 noul_salariu from ANGAJAT where varsta>50 and varsta <=60
union
select nume , prenume , varsta , salariul*1.5 noul_salariu from ANGAJAT where varsta>60 and varsta <=70;

--Sa se afiseze numele ,prenumele , totalul contributiilor , data de plata si id-ul angajatilor care au platit contributii totale mai mici de 1350 lei , insa platite in anul 2022
select a.id_angajat , a.nume , a.prenume ,  nvl(c.cas , 0)+nvl(c.cass , 0)+nvl(c.impozit , 0) total_contributii , c.dataa from ANGAJAT a , CONTRIBUTII c
where a.id_angajat=c.id_angajat and nvl(c.cas , 0)+nvl(c.cass , 0)+nvl(c.impozit , 0)<1350
intersect
select a.id_angajat , a.nume , a.prenume ,  nvl(c.cas , 0)+nvl(c.cass , 0)+nvl(c.impozit , 0) total_contributii , c.dataa from ANGAJAT a , CONTRIBUTII c
where a.id_angajat=c.id_angajat and extract(year from dataa)=2022;

--Subcereri simple si corelate;

--Sa se afiseze angajatii care au salariul mai mic decat salariul mediu din cadrul tabelei
select nume , prenume , salariul from ANGAJAT where salariul<(select avg(salariul) from ANGAJAT); 

--Sa se afiseze toti angajatii care nu si-au platit contributiile
select nume , prenume from ANGAJAT where id_angajat not in(select id_angajat from CONTRIBUTII);

--Sa se afiseze numele si prenumele angajatilor , precum si numele de familie al contabilului fiecarui angajat , folosind  o subcerere corelata
select nume , prenume , (select nume from CONTABILI where ANGAJAT.id_contabil=CONTABILI.id_contabil) contabil from ANGAJAT;

--Sa se afiseze structura ierarhica a contabililor in functie de atributul id_sef_contabil
select level , nume , prenume , id_contabil , id_sef_contabil from CONTABILI connect by  prior id_contabil=  id_sef_contabil start with id_contabil=1;


