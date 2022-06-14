# frozen_string_literal: true

# product teste
class LandingPage
  include Capybara::DSL
  def preencher_cadastro(primeiro_nome, final_nome, email, senha, senha_confirme)
    find('#firstname').set primeiro_nome
    find('#lastname').set final_nome
    find('#email_address').set email
    find('#password').set senha
    find('#password-confirmation').set senha_confirme

    click_button 'Create an Account'
  end

  def fluxo_e2e
    sleep 5
    find('#search').set 'Tops'
    find(:xpath, "//button[@class='action search']").click
    first(:xpath, "//div[@id='option-label-size-144-item-166']").click
    first(:xpath, "//div[@id='option-label-color-93-item-52']").click
    sleep 10
    first(:xpath, "//button[@class='action tocart primary']").click
    sleep 12
    first(:xpath, "//a[@class='action showcart']").click
    first(:xpath, "//button[@class='action primary checkout']").click
    sleep 12
    find(:xpath, "//input[@name='company']").set 'Testelandia'
    sleep 5
    find(:xpath, "//input[@name='street[0]']").set 'Teste 1'
    sleep 5
    find(:xpath, "//input[@name='street[1]']").set 'Teste 2'
    find(:xpath, "//input[@name='street[2]']").set 'Teste 3'
    sleep 5
    select 'Brazil', from: 'Country'
    select 'Minas Gerais', from: 'State/Province'
    find(:xpath, "//input[@name='city']").set 'Juiz de Fora'
    find(:xpath, "//input[@name='postcode']").set '36088-532'
    sleep 5
    find(:xpath, "//input[@name='telephone']").set '99472482'
    sleep 12
    first(:xpath, "//button[@class='button action continue primary']").click
    sleep 12
    first(:xpath, "//button[@class='action primary checkout']").click
    sleep 12
  end
end
