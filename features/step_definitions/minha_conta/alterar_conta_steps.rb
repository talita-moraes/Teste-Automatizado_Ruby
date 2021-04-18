Quando('o usuário alterar o sobrenome') do
    alterar_conta.AlterarNome(@nome, @sobrenome, @nome_cenario)
end

Então("o sistema deverá validar a mensagem apresentada {string}") do |mensagem|
    geral.validarMensagem('sucesso', mensagem)
end

Então("o sistema deverá permanecer na tela os dados alterados da conta") do
    puts @valores_Conta = alterar_conta.validarDadosConta
    expect(@valores_Conta[:email]).to eql(CONFIG['email'])
    expect(@valores_Conta[:senha]).to eql(CONFIG['senha'])
    expect(@valores_Conta[:nome]).to eql("#{@nome} #{@sobrenome}")
end
