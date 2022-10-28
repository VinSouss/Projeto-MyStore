*** Settings ***
Documentation    Testes de login
Resource       resource/loginR.robot
Test Setup    Open Browser To Login Page
Test Teardown    Fechar o Browser

*** Test Cases *** 
Cenário 01: Validando Login
    [Tags]    Validando o menu Sing In
    Clicar em Sign In
    Login to the Page
    Page Home
    

Cenário 02: Pesquisa de produtos e Adicionando ao carrinho
    [Tags]    Pesquisa de produtos e adição ao carrinho
    Clicar em Sign In
    Login to the Page
    Page Home
    Verificacao Page Home
    Clica no botão de pesquisa
    Pesquisa por "Blouse"
    Adicionar ao Carrinho
    Excluir do Carrinho
    Page Home
   

Cenário 03: Produtos do tipo "Women"
    [Tags]    Produtos_Women
    Entrar no menu do tipo "Women" 

Cenário 04: Produtos do tipo "Dresses"
    [Tags]    Produtos_Dresses
    Entrar no menu "Dresses"

Cenário 05: Produtos do tipo "T-Shirts"
    [Tags]    Produtos_T-Shirts
    Entrar no menu "T-shirts"

Cenário 06: Adicionar a lista de desejos 
    [Tags]    Lista_de_desejos
    Clicar em Sign In
    Login to the Page
    Page Home
    Verificacao Page Home
    Clica no botão de pesquisa
    Pesquisa por "Blouse"
    Adicionar a lista de desejos

Cenário 07: Realizar a compra de um produto
    [Tags]    Realiza_Compra
    Clicar em Sign In
    Login to the Page
    Page Home
    Verificacao Page Home
    Clica no botão de pesquisa
    Pesquisa por "Blouse"
    Adicionar ao Carrinho
    Realizar a compra de um produto

Cenário 08: Menu Contate-Nos
    [Tags]    Atendimento_ao_cliente
    Menu Contate-nos