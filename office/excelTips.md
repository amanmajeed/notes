## Excel Tips

* Find the last occurrence of a char in a string
    * Change `\` to the required character
    * Formula : `=FIND("@",SUBSTITUTE(A1,"\","@",(LEN(A1)-LEN(SUBSTITUTE(A1,"\","")))/LEN("\")))`

* Get the filename (basename)
    * [Refer](https://exceljet.net/formula/get-nth-match-with-index-match)
    * Formula : `=REPLACE(A1,1,FIND("@",SUBSTITUTE(A1,"/","@",(LEN(A1)-LEN(SUBSTITUTE(A1,"/","")))/LEN("/"))),"")`

* Macro - Get the windows username
```
Get user name
Public Function UserName()
    UserName = Environ$("UserName")
End Function
=Username()
```