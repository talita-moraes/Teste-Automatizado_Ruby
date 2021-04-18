Dado('que o usuário acesse a página inicial') do
    home.visitarPagina
end

Dado('que o usuário esteja logado no sistema') do
    home.visitarPagina
    login.acessarTelaLogin
    steps %(
        Quando o usuário realizar o login com email e senha validos
        Então devo ser autenticado com sucesso
    )
end

Dado('acesse a tela de Minha Conta') do
    home.acessarMinhaConta
end