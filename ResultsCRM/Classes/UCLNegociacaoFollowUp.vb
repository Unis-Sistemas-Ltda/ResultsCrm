﻿Public Class UCLNegociacaoFollowUp
    Private objAcessoDados As UCLAcessoDados
    Private _Empresa As String
    Private _CodContato As String
    Private _CodEmitente As String
    Private _SeqFollowUP As String
    Private _Estabelecimento As String
    Private _Tipo As String
    Private _CodNegociacaoCliente As String
    Private _DataFollowUp As String
    Private _Descricao As String
    Private _CodUsuario As String
    Private _CodAcao As String
    Private _Assunto As String
    Private _HoraFollowUp As String
    Private _EnviaEmail As String

    Public Property Empresa() As String
        Get
            Return _Empresa
        End Get
        Set(ByVal value As String)
            _Empresa = value
        End Set
    End Property

    Public Property CodEmitente() As String
        Get
            Return _CodEmitente
        End Get
        Set(ByVal value As String)
            _CodEmitente = value
        End Set
    End Property

    Public Property SeqFollowUP() As String
        Get
            Return _SeqFollowUP
        End Get
        Set(ByVal value As String)
            _SeqFollowUP = value
        End Set
    End Property

    Public Property Estabelecimento() As String
        Get
            Return _Estabelecimento
        End Get
        Set(ByVal value As String)
            _Estabelecimento = value
        End Set
    End Property

    Public Property Tipo() As String
        Get
            Return _Tipo
        End Get
        Set(ByVal value As String)
            _Tipo = value
        End Set
    End Property

    Public Property CodNegociacaoCliente() As String
        Get
            Return _CodNegociacaoCliente
        End Get
        Set(ByVal value As String)
            _CodNegociacaoCliente = value
        End Set
    End Property

    Public Property DataFollowUp() As String
        Get
            Return _DataFollowUp
        End Get
        Set(ByVal value As String)
            _DataFollowUp = value
        End Set
    End Property

    Public Property Descricao() As String
        Get
            Return _Descricao
        End Get
        Set(ByVal value As String)
            _Descricao = value
        End Set
    End Property

    Public Property CodAcao() As String
        Get
            Return _CodAcao
        End Get
        Set(ByVal value As String)
            _CodAcao = value
        End Set
    End Property

    Public Property CodUsuario() As String
        Get
            Return _CodUsuario
        End Get
        Set(ByVal value As String)
            _CodUsuario = value
        End Set
    End Property

    Public Property Assunto() As String
        Get
            Return _Assunto
        End Get
        Set(ByVal value As String)
            _Assunto = value
        End Set
    End Property

    Public Property HoraFollowUp() As String
        Get
            Return _HoraFollowUp
        End Get
        Set(ByVal value As String)
            _HoraFollowUp = value
        End Set
    End Property

    Public Property CodContato() As String
        Get
            Return _CodContato
        End Get
        Set(ByVal value As String)
            _CodContato = value
        End Set
    End Property

    Public Property EnviaEmail As String
        Get
            Return _EnviaEmail
        End Get
        Set(value As String)
            _EnviaEmail = value
        End Set
    End Property

    Public Sub New()
        objAcessoDados = New UCLAcessoDados(StrConexao)
    End Sub

    Public Sub New(ByVal ConnectString As String)
        objAcessoDados = New UCLAcessoDados(ConnectString)
    End Sub

    Public Function Buscar() As DataTable
        Dim StrSql As String
        Dim dt As DataTable

        StrSql = " select * "
        StrSql += "  from follow_up_emitente "
        StrSql += " where empresa                = " + Empresa
        StrSql += "   and seq_follow_up          = " + SeqFollowUP
        StrSql += "   and estabelecimento        = " + Estabelecimento
        StrSql += "   and cod_negociacao_cliente = " + CodNegociacaoCliente

        dt = objAcessoDados.BuscarDados(StrSql)

        If dt.Rows.Count > 0 Then
            DataFollowUp = dt.Rows.Item(0).Item("data_follow_up").ToString
            Descricao = dt.Rows.Item(0).Item("descricao").ToString
            CodAcao = dt.Rows.Item(0).Item("cod_acao").ToString
            CodContato = dt.Rows.Item(0).Item("cod_contato").ToString
            Assunto = dt.Rows.Item(0).Item("assunto").ToString
            HoraFollowUp = dt.Rows.Item(0).Item("hora_follow_up").ToString
            CodUsuario = dt.Rows.Item(0).Item("cod_usuario").ToString
            CodEmitente = dt.Rows.Item(0).Item("cod_emitente").ToString
            EnviaEmail = dt.Rows.Item(0).Item("envia_email").ToString
        End If

        Return dt
    End Function

    Public Function GetProximoCodigo() As Long
        Dim ret As Long = 1
        Dim strSql = ""

        strSql = " select isnull(max(seq_follow_up),0) + 1 max  "
        strSql += "  from follow_up_emitente"
        strSql += " where empresa                = " + Empresa
        strSql += "   and estabelecimento        = " + Estabelecimento
        'strSql += "   and cod_negociacao_cliente = " + CodNegociacaoCliente

        Dim dt As DataTable = objAcessoDados.BuscarDados(strSql)
        If dt.Rows.Count > 0 Then
            ret = dt.Rows.Item(0).Item("max").ToString
        End If
        Return ret
    End Function

    Public Sub Incluir()
        Dim strSql As String = ""
        Try

            If CodUsuario = "0" Then
                CodUsuario = "null"
            End If

            If CodAcao = "0" Then
                CodAcao = "null"
            End If

            If String.IsNullOrEmpty(CodContato) Then
                CodContato = "0"
            End If

            If CodContato = "0" Then
                CodContato = "null"
            End If

            If String.IsNullOrEmpty(Tipo) Then
                Tipo = "0"
            End If

            If Tipo = "0" Then
                Tipo = "2"
            End If

            EnviaEmail = IIf(String.IsNullOrEmpty(EnviaEmail), "N", EnviaEmail)

            strSql = " insert into follow_up_emitente (empresa, cod_emitente, seq_follow_up, estabelecimento, tipo, cod_negociacao_cliente, "
            strSql += " data_follow_up, descricao, cod_acao, cod_contato, assunto, hora_follow_up, cod_usuario, envia_email)"
            strSql += " values ( " + Empresa + ", " + CodEmitente + "," + SeqFollowUP + ", " + Estabelecimento + ", " + Tipo + ", " + CodNegociacaoCliente + ", "
            strSql += CDate(DataFollowUp).ToString("yyyyMMdd") + ", '" + Descricao + "', " + CodAcao + ", " + CodContato + ", '" + Assunto + "', '" + CDate(HoraFollowUp).ToString("HH:mm") + "', " + CodUsuario + ", '" + EnviaEmail + "')"
            objAcessoDados.ExecutarSql(strSql)
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Public Sub Alterar()
        Dim strSql As String = ""
        Try
            EnviaEmail = IIf(String.IsNullOrEmpty(EnviaEmail), "N", EnviaEmail)
            strSql += " update follow_up_emitente"
            strSql += "    set data_follow_up = " + CDate(DataFollowUp).ToString("yyyyMMdd") + ", "
            strSql += "        descricao      = '" + Descricao + "', "
            strSql += "        cod_acao       = " + CodAcao + ", "
            strSql += "        cod_contato    = " + CodContato + ", "
            strSql += "        envia_email    = '" + EnviaEmail + "', "
            strSql += "        assunto        = '" + Assunto + "' "
            strSql += " where empresa                = " + Empresa
            strSql += "   and estabelecimento        = " + Estabelecimento
            strSql += "   and cod_negociacao_cliente = " + CodNegociacaoCliente
            strSql += "   and tipo                   = " + Tipo
            strSql += "   and seq_follow_up          = " + SeqFollowUP
            objAcessoDados.ExecutarSql(strSql)
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Public Sub AlterarEmitenteNegociacao()
        Try
            Dim strSql As String = "select seq_follow_up from follow_up_emitente where empresa = " + Empresa + " and estabelecimento = " + Estabelecimento + " and cod_negociacao_cliente = " + CodNegociacaoCliente
            Dim dt As DataTable = objAcessoDados.BuscarDados(strSql)
            For Each row As DataRow In dt.Rows
                strSql = " update follow_up_emitente set cod_emitente = " + CodEmitente + " where empresa = " + Empresa + " and estabelecimento = " + Estabelecimento + " and cod_negociacao_cliente = " + CodNegociacaoCliente + " and seq_follow_up = " + row.Item("seq_follow_up").ToString
                objAcessoDados.ExecutarSql(strSql)
            Next
        Catch ex As Exception
            Throw ex
        End Try
    End Sub
End Class
