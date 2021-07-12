*** Settings ***
Resource    ../Common.robot   


*** Keywords ***    
Get_Ping
    [Documentation]    
    ...    > Validate statuscode, response content and content-type for the provided get method
    
    ${response}=    Get Method    /ping      
    Status Code    ${response.status_code}     200  
    Response Content        ${response.content}        (V3) To the Moon!
    Response Header    ${response.headers}    Content-Type    application/json
    
Get_Coins_List
    [Documentation]     
    ...    >Validate statuscode, response content and content-type for the provided get method
    
    ${response}=    Get Method        /coins/list?include_platform=${platform}     
    Status Code    ${response.status_code}     200   
    ${val}=    Get Response    ${response.content}    $..id     id   
    Set Global Variable    ${idVal}       ${val}[0]   
    Response Content    ${response.content}    ${val}[0]  
    Response Header    ${response.headers}    Content-Type    application/json      
   
Get_Simple_Price
    [Documentation]     
    ...    >Validate statuscode, response content and content-type for the provided get method
    
    &{params}=    Create Dictionary    ids=${idVal}     vs_currencies=${currencyname}
    ${response}=    Get Method Using Param       /simple/price    ${params}   
    Status Code    ${response.status_code}     200     
    Response Content        ${response.content}    ${idVal}
    Response Header    ${response.headers}    Content-Type    application/json    
    
Get_Simple_SupportedCurrencies
    [Documentation]     
    ...    >Validate statuscode, response content and content-type for the provided get method  
    
    ${response}=    Get Method        /simple/supported_vs_currencies
    Status Code    ${response.status_code}     200     
    Response Content        ${response.content}        ${coinSymbol}
    Response Header    ${response.headers}    Content-Type    application/json