*** Settings ***
Library    RequestsLibrary        
Library    Collections  
Library    JSONLibrary  
Library    String 
Resource    ../Data/Coins/Coins.robot 
Resource    Session.robot   

*** Keywords ***
Get Method
    [Arguments]
    ...     ${uri}
    [Documentation]
    ...    >This method is for Get Method Base url
    ${alias_val}=   Open Session
    ${response}=    Get Request      ${alias_val}       ${uri}
    [Return]    ${response}

Get Method Using Param
    [Arguments]
    ...    ${uri}
    ...    ${params}
    [Documentation]
    ...    >This method is for Get Method Base url using Param
    ${alias_val}=   Open Session
    ${response}=    Get Request     ${alias_val}       ${uri}    params=${params}
    [Return]    ${response}
    
Status Code
    [Arguments]
    ...    ${response.status_code}
    ...    ${expected_status_code}
    [Documentation]
    ...    >This method is for validating the Status code
 
    ${status_code}=    Convert To String    ${response.status_code}   
    Should Be Equal    ${status_code}    ${expected_status_code} 
    Log    ${status_code}
    
Response Content
    [Arguments]
    ...    ${response_content}
    ...    ${expected_content}   
    [Documentation]
    ...    >This method is for validating the response content
    
    ${body}=    Convert To String    ${response_content}
    Should Contain    ${body}    ${expected_content}
    Log     ${body}
    
Response Header
     [Arguments]
    ...    ${response_headers}
    ...    ${required_header}
    ...    ${expected_header}  
    [Documentation]
    ...    >This method is validating the response headers
    
    ${ContentTypeValue}    Get From Dictionary    ${response_headers}    ${required_header}   
    Should Contain    ${ContentTypeValue}    ${expected_header}  
   
Get Response   
    [Arguments]    
    ...    ${response_content} 
    ...    ${json_object}
    ...    ${column_name}
    [Documentation]
    ...   >This method is to get the required response from the json
 
    ${value}=    Convert String to JSON    ${response_content}
    ${random_num}=    Get Random Number    ${response_content}     ${json_object}    
    ${coin_val}=    Get Value From Json         ${value}        $.[${random_num}].${column_name} 
    [Return]         ${coin_val}
    
Get TotalCount
    [Arguments]    
    ...    ${response_content} 
    ...    ${json_object}
    [Documentation]
    ...   >This method is to get the required response from the json
    ${value}=    Convert String to JSON    ${response_content}
    ${coin_val_for_length}=    Get Value From Json         ${value}        ${json_object}  
    ${length_val}=    Get Length    ${coin_val_for_length}
    [Return]    ${length_val}
    
Get Random Number
    [Arguments]    
    ...    ${response_content}
    ...    ${json_object}
     [Documentation]
    ...   >This method is to generate random number from the response
     
    ${length_val}=    Get TotalCount    ${response_content}    ${json_object}
    ${random_num} =  Evaluate    random.choice(range(0, ${length_val}-1))  random 
    [Return]    ${random_num} 