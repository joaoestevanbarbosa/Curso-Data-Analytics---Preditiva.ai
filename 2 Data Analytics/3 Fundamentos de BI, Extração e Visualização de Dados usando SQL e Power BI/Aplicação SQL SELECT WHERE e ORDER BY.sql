--a) Selecione todos os campos, filtrando passageiros com mais de 30 anos.

select * from preditiva.dbo.titanic where age > 30

--b) Selecione os 25 primeiros registros, com todos os campos, filtrando passageiros da 2ª classe.

select top 25 * from preditiva.dbo.titanic where Pclass = 2

--c) Selecione todos os campos, filtrando passageiros da 1ª classe e com 18 anos ou menos.

select * from preditiva.dbo.titanic where Pclass = 1 and Age <=18

--d) Selecione todos os campos, filtrando passageiros da 3ª classe ou que são do sexo masculino.

select * from preditiva.dbo.titanic where Pclass = 3 or sex = 'male'

--e) Selecione os campos: Name, Sex, Pclass e Age, filtrando passageiros com menos de 45 anos

select Name, Sex, Pclass, Age from preditiva.dbo.titanic where Age < 45

--f) Selecione todos os campos, filtrando passageiros que têm  "Master." dentro do nome

select * from preditiva.dbo.titanic where name like '%Master.%'

--g) Selecione todos os campos, filtrando passageiros que não tem nem 18 e nem 50 anos.

select * from preditiva.dbo.titanic where Age not in (18,50)

--h) Selecione os campos: Survived, Name, Sex, Pclass e Age, filtrando passageiros que entre 10 e 35 anos, ordenando por idade do mais velho para o mais novo.

select Survived, Name, Sex, Pclass, Age from preditiva.dbo.titanic 
where Age between 10 and 35
order by age desc