#language:pt
@start_login @ativo
Funcionalidade: Realizar Login
    Como um usuário
    Estando na tela de login, posso informar usuário e senha
    Para realizar o login no sistema

Contexto: Paginal Principal 
    Dado que o usuário esteja na página de login

Cenario: Usuário Deve Ser Autorizado
    Quando o usuário realizar o login com email e senha validos
    Então devo ser autenticado com sucesso

Esquema do Cenario: Tentativa De Login
    Quando o usuário efetuar o login com "<email>" e "<senha>"
    Então deve-se apresentar a mensagem "<mensagem>"

    Exemplos:
    | email                 | senha         | mensagem                                        |
    | saxedoc652@zcai66.com | d987456       | E-mail ou senha inválidos                       |
    | saxedoc652@zc1166.com | 12345678f     | E-mail ou senha inválidos                       |
    |                       | 12345678f     | Campo obrigatório                               |
    | saxedoc652@zci166.com |               | Campo obrigatório                               |
