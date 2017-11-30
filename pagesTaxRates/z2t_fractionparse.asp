<% 
'*********API Call to COnvert Float to Fraction********'

Function FractionParse (convertNumber,factor)
    'Response.Write("I am going to convert" & convertNumber &"&nbsp&nbsp")
    doubleNumber = CDbl(convertNumber)
    intFactor = CInt(factor)  
    ' FInd the long Number
    Dim IndexVal
    IndexVal = Instr(convertNumber,".")
    GetLongVal = Mid(convertNumber,1,IndexVal)
    longNumber = CLng(GetLongVal)

    if (longNumber <> 0) Then
        FractionParse = longNumber
    End If
    doubleNumber = doubleNumber - longNumber
    Dim error
    error = Abs(doubleNumber)
    int bestDenominator = 1
    For initializer=CInt("2") to intFactor
        Dim temp2,error2
        temp2 = CDbl(Round(doubleNumber*initializer))
        error2 = Abs(doubleNumber - temp2 / initializer)
        If error2 < error Then
            error = error2
            bestDenominator = initializer
        End If
    Next
    If bestDenominator > 1 Then
           FractionParse =  FractionParse &" " & Round(doubleNumber * bestDenominator) &"/" & bestDenominator 
    End If

    FractionParse =  "(" & FractionParse  & "%" & ")"
    'Response.Write(" COnverted Number"&FractionParse)
    End Function

    
%>