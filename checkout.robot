# File: checkout.robot

*** Settings ***

Library    SeleniumLibrary    run_on_failure=Nothing

*** Variables ***

${URL}        https://www.saucedemo.com
${DELAY}        0.1

*** Test Cases ***

Prepare Browser
    Open Browser  ${URL}  Chrome
    Maximize Browser Window
    Set Selenium Speed    ${DELAY} 

Login    
    Wait Until Page Contains Element    id=login-button
    Input Text	id=user-name	standard_user
    Input Text	id=password	secret_sauce
    Click Element	id=login-button        

Choose Product
	Wait Until Page Contains Element   id=shopping_cart_container
	Click Element  //div//button[@id="add-to-cart-sauce-labs-bike-light"]
	
Go to Shopping Cart
	Wait Until Page Contains Element    id=shopping_cart_container
	Click Element  id=shopping_cart_container
	
Go to Checkout
	Wait Until Page Contains Element    id=checkout
	Click Element  id=checkout
	
Fill Information
	Wait Until Page Contains Element    id=continue
	Input Text  id=first-name    Matti
	Input Text  id=last-name    Meikalainen
	Input Text  id=postal-code    33500
	Click Element  id=continue
	
Close Browser
    Sleep  2s
    Close Browser 
