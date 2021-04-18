#language:pt
@start_alterar_conta @ativo
Funcionalidade: Alterar Dados Da Conta
    Como um usuário logado no sistema
    Estando no módulo Minha Conta
    Posso realizar a operação de alteração nome

Contexto: Acessar a Tela Minha Conta
    Dado que o usuário esteja logado no sistema
    E acesse a tela de Minha Conta

Cenario: Alterar o Sobrenome a Conta
    Quando o usuário alterar o sobrenome
    Então o sistema deverá validar a mensagem apresentada 'O cliente CODIGO foi atualizado com sucesso .'
    E o sistema deverá permanecer na tela os dados alterados da conta
