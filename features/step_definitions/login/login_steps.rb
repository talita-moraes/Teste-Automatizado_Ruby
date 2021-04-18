Dado('que o usuário esteja na página de login') do
    steps 'Dado que o usuário acesse a página inicial'
    login.acessarTelaLogin
end

Quando('o usuário realizar o login com email e senha validos') do
    login.realizarLogin(@email, @senha)
end

Então('devo ser autenticado com sucesso') do
    @meng_tela = login.autenticarAcesso
    expect(@meng_tela).to include("SAX")
end

Quando("o usuário efetuar o login com {string} e {string}") do |email, senha|
    login.realizarLogin(email,senha)
end

Então("deve-se apresentar a mensagem {string}") do |mensagem|
    login.validarMensagemErro(mensagem)
end
