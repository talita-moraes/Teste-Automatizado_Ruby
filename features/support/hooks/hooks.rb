Before do |scenario|
    @time = Time.new
    @data = @time.strftime('%d/%m/%Y')
    @nome_cenario = scenario.name
    puts @nome_cenario

    unless scenario.name == 'Tentativa De Login'
        @email = CONFIG['email']
        @senha = CONFIG['senha']
    end
end
  
After do |scenario|
    scenario_name = scenario.name.gsub(/[^A-Za-z0-9 ]/, '')
    scenario_name = scenario_name.tr(' ', '_').downcase!

    if scenario.failed?
      # Exibir mensagem de erro con até 150 caracteres
      erro = (scenario.exception).to_s
      puts "FALHA: #{erro[0,150]}"
  
      geral.printTela(scenario_name, 'falhou')
    elsif scenario.passed?
      geral.printTela(scenario_name, 'passou')
    else
      puts 'Status não encontrado'
    end
end
