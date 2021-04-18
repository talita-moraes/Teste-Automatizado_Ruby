class HomePage < SitePrism::Page   
    element :barraUsuario, '.NavbarUserAvatarstyle__UserAvatarDropdown-hoovwp-2'
    element :botaoCadastrar, '#btn-create-account'
    element :campoEmail, '#sign_in__username'
    
    def visitarPagina
        visit CONFIG['site']
        assert_selector('a[title="Sympla sua plataforma de eventos"]')
    end

    def acessarMinhaConta
        barraUsuario.click
        find('div[class="sc-1vkix4t-1 egJESw"]', text: 'Minha conta').click
    end

    def deslogar
        barraUsuario.click
        find('svg', text: 'Sair').click
        wait_until_botaoCadastrar_visible
    end
end