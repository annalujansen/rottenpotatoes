# O web_steps.rb fornecido usa a sintaxe antiga `should`; habilita as duas sintaxes
# para não exibir aviso de depreciação.
require "rspec/expectations"
RSpec::Expectations.configuration.syntax = [:should, :expect]
