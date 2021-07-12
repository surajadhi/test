*** Settings ***
Library    RequestsLibrary        
Library    Collections  
Library    JSONLibrary  
Library    String 
Resource    ../Data/Coins/Coins.robot 

*** Keywords ***
Open Session
    [Arguments]
    ...    ${alias}= ${alias_name}
    ...    ${base_url}= ${base_url_name} 
    [Documentation]
    ...    >This method is for opening the session   
    Create Session    ${alias}      ${base_url}  
    [Return]    ${alias}