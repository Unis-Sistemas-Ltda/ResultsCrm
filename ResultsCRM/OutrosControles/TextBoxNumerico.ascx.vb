﻿Partial Public Class TextBoxNumerico
    Inherits System.Web.UI.UserControl

    Private _QtdCasas As String

    Public Property Width() As String
        Get
            Return TextBox1.Width.ToString
        End Get
        Set(ByVal value As String)
            TextBox1.Width = value
        End Set
    End Property

    Public Property Text() As String
        Get
            If String.IsNullOrEmpty(TextBox1.Text.Trim) Then
                Return "0"
            Else
                Return TextBox1.Text.Replace(".", "")
            End If
        End Get
        Set(ByVal value As String)
            TextBox1.Text = value
        End Set
    End Property

    Public Property AutoPostBack() As Boolean
        Get
            Return TextBox1.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            TextBox1.AutoPostBack = value
        End Set
    End Property

    Public Property QtdCasas() As String
        Get
            If String.IsNullOrEmpty(_QtdCasas) Then
                _QtdCasas = "2"
            End If
            Return _QtdCasas
        End Get
        Set(ByVal value As String)
            If value < "2" Or value > "4" Then
                value = "2"
            End If
            _QtdCasas = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If QtdCasas = 2 Then
            TextBox1.Attributes.Add("OnKeyPress", "mascara( this, mvalor );")
        ElseIf QtdCasas = 4 Then
            TextBox1.Attributes.Add("OnKeyPress", "mascara( this, mvalor4dec );")
        Else
            TextBox1.Attributes.Add("OnKeyPress", "return(formatarNumerico(this,'.',',',event," + QtdCasas + "))")
        End If

        If AutoPostBack Then
            TextBox1.AutoPostBack = True
            'TextBox1.Attributes.Add("OnBlur", "submit();")
        End If

        TextBox1.Attributes.Add("OnFocus", "selecionaCampo(this)")

    End Sub

    Public Sub GetReferenciaTextBox(ByRef txt As TextBox)
        txt = TextBox1
    End Sub

End Class