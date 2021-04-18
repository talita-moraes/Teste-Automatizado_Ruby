class GeralPage < SitePrism::Page

    def alertaMensagem(result)
        case result
        when 'falhar'
          @box_css = ''
        when /sucesso/
          @box_msg = 'section.toast div.toast-message__text'
        end

        assert_selector(@box_css)
        page.find(@box_css).text
    end

    def validarMensagem(codigo = nil, tipo, mensagem)
        @mensagem_tela = alertaMensagem(tipo)

        if (codigo == nil)
            @mensagem_tela.include?(mensagem)     
        else
            mensagem = mensagem.gsub('CODIGO', codigo)
            @mensagem_tela.include?(mensagem) 
        end
    end

    def printTela(scenario_name, resultado)
        timer_path = Time.now.strftime('%F').to_s
        path_file = "screenshots/teste_#{resultado}/run_#{timer_path}"
        screenshot = "#{path_file}/#{scenario_name}.png"
        page.save_screenshot(screenshot)
    end

    # Comandos Extras
    #element.value,
    #elemento.has_text?(‘’)
    #elemento.eql?’)
    #page.execute_script "window.scrollBy(0,10000)"
    #page.all()[0].text

end