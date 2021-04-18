class DadosConta < SitePrism::Section
    element :campoEditarNome, 'i[data-title="Editar nome"]'
    element :campoEditarSenha, 'i[data-title="Editar senha"]'
    element :campoEditarEmail, 'i[data-title="Editar e-mail"]'
    element :campoNome, '#user_name'
    element :campoSenha, '#user_password'
    element :campoEmail, '#user_email'
end
  
class AlterarContaPage < SitePrism::Page
    section :dadosConta, DadosConta, '#data-account-change'
    
    element :campoNome, 'input[modelname="change_name.first_name"]'
    element :campoSobrenome, 'input[modelname="change_name.last_name"]'

    def AlterarNome(nome, sobrenome, nome_cenario)
        assert_text('Dados da Conta')
        dadosConta.campoEditarNome.click

        case nome_cenario
        when /Sobrenome/
            campoSobrenome.send_keys [:control, 'a'], :space
            campoSobrenome.set sobrenome
        else
            campoSobrenome.set sobrenome
            campoNome.set nome
        end

        click_button 'salvar'
    end

    def validarDadosConta(mensagem)
        @valores = {
            email: dadosConta.campoEmail.value,
            nome: dadosConta.campoNome.value,
            senha: dadosConta.campoSenha.text
        }
    end
end

