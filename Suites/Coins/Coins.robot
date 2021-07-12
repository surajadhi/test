*** Settings ***
Resource    ../../Resources/Coins/Coins.robot


*** Test Cases ***
Get Coin Value
     
    Get_Coins_List
    Get_Ping
    Get_Simple_Price    
    Get_Simple_SupportedCurrencies