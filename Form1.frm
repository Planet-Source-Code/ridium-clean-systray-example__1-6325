VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "SysTray Example By: -RiDiUM-"
   ClientHeight    =   1995
   ClientLeft      =   75
   ClientTop       =   360
   ClientWidth     =   3630
   LinkTopic       =   "Form1"
   ScaleHeight     =   1995
   ScaleWidth      =   3630
   StartUpPosition =   3  'Windows Default
   Begin VB.Menu mnuMain 
      Caption         =   "Main"
      Visible         =   0   'False
      Begin VB.Menu mnuShow 
         Caption         =   "Show"
      End
      Begin VB.Menu mnuHide 
         Caption         =   "Hide"
      End
      Begin VB.Menu mnuDash 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "Exit"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Tic As NOTIFYICONDATA

Private Sub Form_Load()
    Dim rc As Long
    Tic.cbSize = Len(Tic)
    Tic.hwnd = Me.hwnd
    Tic.uID = vbNull
    Tic.uFlags = NIF_DOALL
    Tic.uCallbackMessage = WM_MOUSEMOVE
    Tic.hIcon = Me.Icon
    Tic.sTip = "SysTray Example By: -RiDiUM-" & vbNullChar
    rc = Shell_NotifyIcon(NIM_ADD, Tic)
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
        Dim msg As Long
        Dim sFilter As String
        msg = X / Screen.TwipsPerPixelX
        Select Case msg
            Case WM_RBUTTONUP
                PopupMenu mnuMain
            Case WM_LBUTTONDBLCLK
                Me.Show
        End Select
End Sub

Private Sub Form_Unload(Cancel As Integer)
Shell_NotifyIcon NIM_DELETE, Tic
End Sub

Private Sub mnuExit_Click()
Unload Me
End Sub

Private Sub mnuHide_Click()
Form1.Hide
mnuMain.Visible = True
End Sub

Private Sub mnuShow_Click()
Form1.Show
mnuMain.Visible = False
End Sub
