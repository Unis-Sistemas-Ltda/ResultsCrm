﻿Partial Public Class WFAtendimentoCabecalho_Suporte
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        WUCAtendimentoCabecalho_Suporte1.CodAtendimento = Session("SCodAtendimento")
        WUCAtendimentoCabecalho_Suporte1.Acao = Session("SAcao")
        WUCAtendimentoCabecalho_Suporte1.ModoAbertura = Session("SModoAbertura")
    End Sub

End Class