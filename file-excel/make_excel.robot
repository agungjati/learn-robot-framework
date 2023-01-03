*** Settings *** 
Library  make_excel.py

*** Test Cases ***
Test
    Make Excel File   NewExcel.xlsx
    Add Value  NewExcel.xlsx  A1  90