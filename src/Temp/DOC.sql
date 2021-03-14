� Dever� ser criado um cadastro de produtor, onde ser� informado o nome do produtor e seu
CPF/CNPJ. Tamb�m ser� poss�vel no cadastro do produtor, informar o limite de cr�dito que ele
tem com cada distribuidor. Lembrando que um produtor pode ter diversos limites de cr�dito com
diversos distribuidores.
--PRODUTOR
----PRODUTOR_CREDITO

� Dever� ser criado uma tela de manuten��o de negocia��o onde o usu�rio poder� informar os
dados para realizar o cadastro ou altera��o de uma negocia��o. Nesta tela o usu�rio poder�
informar o produtor, o distribuidor e os itens da negocia��o. Dever� ter um campo totalizando a
negocia��o e um informando o status daquela negocia��o.
--NEGOCIACAO
----NEGOCIACAO_ITEM

� A negocia��o possui apenas 4 status poss�veis, �Pendente�, �Aprovada�, �Concluir� e
�Cancelada�. Sempre que uma negocia��o for gravada o status padr�o dela ser� �Pendente�. Para
aprovar, concluir ou cancelar esta negocia��o existir� uma tela para manuten��o de negocia��o,
onde o usu�rio ir� informar o c�digo da negocia��o pendente e ent�o ele poder� aprovar, concluir
ou cancelar.

� O produtor deve possuir cr�dito para realizar uma negocia��o, sendo assim no cadastro dos dados
do produtor ser� informado o limite de cr�dito em reais que ele tem com um determinado
distribuidor. Dessa forma caso o produtor deseje efetuar uma negocia��o que ultrapasse o seu
limite de cr�dito o sistema dever� bloquear.

� Para validar o cr�dito de um produtor na gera��o da negocia��o, o sistema dever� considerar
tamb�m as negocia��es aprovadas, assim caso um produtor queira fazer uma negocia��o no valor
de R$ 50.000,00 com um distribuir e ele possuir um limite de R$ 60.000,00 com este distribuidor
o sistema dever� permitir, por�m se este produto possuir uma outra negocia��o aprovada de R$
20.000,00 ent�o o sistema dever� bloquear visto que o limite geral ser� ultrapassado.

� Dever� ser criado uma tela de consulta de negocia��es que permita filtrar as negocia��es de um
determinado produtor ou distribuidor, nesta tela tamb�m poderemos imprimir um relat�rio
referente as negocia��es filtradas.

� O relat�rio dever� exibir o nome do produtor, o nome do distribuidor, o c�digo do contrato, a
data de cadastro, a data de aprova��o, a data de conclus�o, a data de cancelamento caso exista
e o valor total do contrato.