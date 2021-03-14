• Deverá ser criado um cadastro de produtor, onde será informado o nome do produtor e seu
CPF/CNPJ. Também será possível no cadastro do produtor, informar o limite de crédito que ele
tem com cada distribuidor. Lembrando que um produtor pode ter diversos limites de crédito com
diversos distribuidores.
--PRODUTOR
----PRODUTOR_CREDITO

• Deverá ser criado uma tela de manutenção de negociação onde o usuário poderá informar os
dados para realizar o cadastro ou alteração de uma negociação. Nesta tela o usuário poderá
informar o produtor, o distribuidor e os itens da negociação. Deverá ter um campo totalizando a
negociação e um informando o status daquela negociação.
--NEGOCIACAO
----NEGOCIACAO_ITEM

• A negociação possui apenas 4 status possíveis, “Pendente”, “Aprovada”, “Concluir” e
“Cancelada”. Sempre que uma negociação for gravada o status padrão dela será “Pendente”. Para
aprovar, concluir ou cancelar esta negociação existirá uma tela para manutenção de negociação,
onde o usuário irá informar o código da negociação pendente e então ele poderá aprovar, concluir
ou cancelar.

• O produtor deve possuir crédito para realizar uma negociação, sendo assim no cadastro dos dados
do produtor será informado o limite de crédito em reais que ele tem com um determinado
distribuidor. Dessa forma caso o produtor deseje efetuar uma negociação que ultrapasse o seu
limite de crédito o sistema deverá bloquear.

• Para validar o crédito de um produtor na geração da negociação, o sistema deverá considerar
também as negociações aprovadas, assim caso um produtor queira fazer uma negociação no valor
de R$ 50.000,00 com um distribuir e ele possuir um limite de R$ 60.000,00 com este distribuidor
o sistema deverá permitir, porém se este produto possuir uma outra negociação aprovada de R$
20.000,00 então o sistema deverá bloquear visto que o limite geral será ultrapassado.

• Deverá ser criado uma tela de consulta de negociações que permita filtrar as negociações de um
determinado produtor ou distribuidor, nesta tela também poderemos imprimir um relatório
referente as negociações filtradas.

• O relatório deverá exibir o nome do produtor, o nome do distribuidor, o código do contrato, a
data de cadastro, a data de aprovação, a data de conclusão, a data de cancelamento caso exista
e o valor total do contrato.