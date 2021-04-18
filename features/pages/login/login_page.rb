class LoginPage < SitePrism::Page
    element :campoEmail, 'input[name="email"]'
    element :campoSenha, 'input[name="password"]'
    element :barraUsuario, '.NavBarstyle__NavbarContainer-sc-1nwhkbg-0'
    element :blocoLogin, '#btn-login'

    def acessarTelaLogin
        click_button 'acesse sua conta'
        begin
            assert_selector('div.src__Box-sc-1sbtrzs-0')
        rescue Exception => e
            # puts e.message
            page.has_css?('form')
        end
    end

    def realizarLogin(email,senha)
        wait_until_campoEmail_visible(count: 1)
        campoEmail.set email 
        campoSenha.set senha
        click_button 'Login'
    end

    def autenticarAcesso
        page.within(barraUsuario) do
            assert_selector('div[font-size="14px"]')
            find('.NavbarUserAvatarstyle__UserAvatarName-hoovwp-3').text
        end
    end

    def validarMensagemErro(mensagem)
        assert_text(mensagem)
    end
end