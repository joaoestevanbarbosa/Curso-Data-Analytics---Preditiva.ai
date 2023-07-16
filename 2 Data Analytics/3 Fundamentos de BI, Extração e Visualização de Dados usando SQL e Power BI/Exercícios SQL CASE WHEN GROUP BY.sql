--a) Selecione os campos Name e Age, e crie uma nova variável chamada "Maior_idade", com 1 caso Age seja maior ou igual a 18 anos, e 0 senão.

select 
	name,
	age, 
	case when age >= 18 then 1
		else 0
	end as Maior_idade
from [dbo].[titanic]

--b) Selecione o campo Name, e  crie uma variável chamada título, com as seguintes categorias: Doutor, Mestre, Senhor, Senhora, Senhorita e Reverendo (Rev.).
select 
	name,
	CASE	WHEN Name LIKE '%, Dr. %' THEN 'Doutor'
			WHEN Name LIKE '%, Master. %' THEN 'Mestre'
			WHEN Name LIKE '%, Mr. %' OR Name LIKE '%, Sir. %' THEN 'Senhor'
			WHEN Name LIKE '%, Mrs. %' THEN 'Senhora'
			WHEN Name LIKE '%, Miss. %' OR Name LIKE '%, Lady. %' THEN 'Senhorita'
			WHEN Name LIKE '%, Rev. %' THEN 'Reverendo'
	ELSE 'Outro'
	end 'Titulo'
from [dbo].[titanic] 

-- c) Selecione a contagem de registros total, e a contagem de registros não nulos da variável Embarked.
--select 
--		count(name) 'total', 
--		(select count(embarked) from [dbo].[titanic]  where embarked is not null) 'embarked'
--from [dbo].[titanic]

SELECT
COUNT(1) AS qtd_registros,
COUNT(Embarked) AS qtd_reg_embarked
FROM
titanic


-- d) Selecione o sexo, agrupando a frequencia absoluta, a média, mínimo, máximo e desvio padrão da variável Age.

SELECT
		sex,
		COUNT(1) AS freq_abs,
		AVG(Age) AS idade_media,
		MIN(Age) AS idade_min,
		MAX(Age) AS idade_max,
		STDEV(Age) AS idade_dp
FROM
	titanic
GROUP BY sex	


/*SELECT
		sex,
		COUNT(1) AS freq_abs,
		AVG(
			CASE
				WHEN Age < 100 THEN Age
			ELSE Age/100
			END
			) AS idade_media,
		MIN(CASE
				WHEN Age < 100 THEN Age
			ELSE Age/100
			END
			) AS idade_min,
		MAX(CASE
				WHEN Age < 100 THEN Age
			ELSE Age/100
			END
			) AS idade_max,
		STDEV(CASE
				WHEN Age < 100 THEN Age
			ELSE Age/100
			END
			) AS idade_dp
FROM
		titanic
GROUP BY
		sex
*/


--Ou para tratar antes, você precisa utilizar o conceito de Subquery ou tabela temporária:

/*
WITH base_tratada AS (
					SELECT
							*,
							CASE
								WHEN Age < 100 THEN Age
							ELSE Age/100
							END AS Age_ok
					FROM
							titanic
					)
			SELECT
					sex,
					COUNT(1) AS freq_abs,
					AVG(Age_ok) AS idade_media,
					MIN(Age_ok) AS idade_min,
					MAX(Age_ok) AS idade_max,
					STDEV(Age_ok) AS idade_dp
			FROM
					base_tratada
			GROUP BY
					sex
					*/
