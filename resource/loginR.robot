*** Settings ***
Documentation    Fazendo Login na My Store
Library    SeleniumLibrary

*** Variables ***
${LOGIN URL}    http://automationpractice.com/index.php
${BROWSER}    CHROME

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window

Fechar o Browser 
    Close Browser

#Cenario - 01
Clicar em Sign In
    Click Element    xpath=//div[@id='page']//div[@class='nav']//a[@class='login']
    Title Should Be    Login - My Store

Login to the Page
    Click Element    xpath=//input[@id='email']
    Input Text    xpath=//input[@id='email']    contatestautomacao@gmail.com
    Click Element    xpath=//input[@id='passwd']
    Input Password    xpath=//input[@id='passwd']    contaautomacao
    Click Element    xpath=//button[@id='SubmitLogin']
    Wait Until Element Is Visible    xpath=//span[@class='navigation_page']    5
    Element Should Be Visible    xpath=//span[@class='navigation_page']

Page Home
    Click Element    xpath=//a[@class='home']
    Wait Until Element Is Visible    xpath=//input[@id='search_query_top']    
    Element Should Be Visible    xpath=//input[@id='search_query_top']
    

#Cenário - 02
Verificacao Page Home
    Wait Until Element Is Visible    xpath=//a[contains(@title,'Women')]

Clica no botão de pesquisa
    Click Element    locator=search_query_top

Pesquisa por "${PRODUTO}"
    Input Text    locator=search_query_top    text=${PRODUTO}
    Click Element    xpath=//button[@type='submit'][contains(.,'Search')]    
    Wait Until Element Is Visible    locator=//span[@class='heading-counter']
    
Adicionar ao Carrinho
    Mouse Down On Image    //img[@title='Blouse']
    Click Element  //a[contains(@class,'button btn btn-default')]
    Wait Until Element Is Visible    xpath=//a[@title='Proceed to checkout']
    Click Element    xpath=//a[@title='Proceed to checkout']

Excluir do Carrinho
    Wait Until Element Is Visible    xpath=//span[@class='heading-counter']
    Click Element    xpath=//i[@class='icon-trash']
    Wait Until Element Is Visible    xpath=//p[@class='alert alert-warning']
    

#Cenário - 03
Entrar no menu do tipo "Women"
    Click Element    xpath=(//a[@title='Women'])
    Wait Until Element Is Visible    xpath=//span[@class='cat-name'][contains(.,'Women')]

#Cenário - 04
Entrar no menu "${TIPO}"
    Click Element    (//a[@title='${TIPO}'])[2]
    Wait Until Element Is Visible    xpath=//span[@class='cat-name'][contains(.,'${TIPO}')]


#Cenário - 05
Adicionar a lista de desejos
    Mouse Down On Image    //img[@title='Blouse']
    Click Element  xpath=//a[contains(.,'Add to Wishlist')]
    Wait Until Element Is Visible    xpath=//p[contains(.,'Added to your wishlist.')]
    Wait Until Element Is Not Visible    locator=//a[contains(@title,'Close')]    
    Click Element   xpath=//a[@title='Close']
    Click Element    xpath=//a[contains(@class,'account')]
    Wait Until Element Is Visible    xpath=//span[contains(.,'My account')]
    Click Element    xpath=//span[contains(.,'My wishlists')]
    Wait Until Element Is Visible    xpath=//h1[contains(.,'My wishlists')]
    Page Home

#Cenário - 06
Realizar a compra de um produto
    Click Element    xpath=(//span[contains(.,'Proceed to checkout')])[2]
    Wait Until Element Is Visible    //span[@class='navigation_page']
    Click Element    (//span[contains(.,'Proceed to checkout')])[2]
    Wait Until Element Is Visible    //span[@class='navigation_page'][contains(.,'Shipping')]
    Click Element   //div[@class='checker']
    Click Element    (//span[contains(.,'Proceed to checkout')])[2]
    Wait Until Element Is Visible    //span[@class='navigation_page'][contains(.,'Your payment method')]
    Click Element     //a[@title='Pay by bank wire']
    Wait Until Element Is Visible    //span[@class='navigation_page'][contains(.,'Bank-wire payment.')]
    Click Element    //span[contains(.,'I confirm my order')]
    Wait Until Element Is Visible    //strong[contains(.,'Your order on My Store is complete.')]
    Page Home

#Cenário 07
Menu Contate-nos
    Click Element    //a[contains(@title,'Contact Us')]
    Wait Until Element Is Visible    //span[@class='navigation_page'][contains(.,'Contact')]
    Click Element    uniform-id_contact
    Click Element    //option[@value='2']
    Click Element    email
    Input Text    email    contatestautomacao@gmail.com
    Click Element    id_order
    Input Text    id_order    01
    Click Element    message
    Input Text    message    Testando
    Click Button    submitMessage
    Wait Until Element Is Visible    //p[@class='alert alert-success']
    Page Home