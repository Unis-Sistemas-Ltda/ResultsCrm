﻿Public Class UCLStatusChamado
    Private _Empresa As String
    Private objAcessoDados As UCLAcessoDados
    Private _CodStatus As String
    Private _Tipo As String

    Public Property Descricao As String
    Public Property InicioAtendimento As String

    Public Property CodStatus() As String
        Get
            Return _CodStatus
        End Get
        Set(ByVal value As String)
            _CodStatus = value
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

    Public Function Buscar() As Boolean
        Try
            Dim strSql As String = "select tipo, isnull(descricao,'') descricao, isnull(inicio_atendimento,'N') inicio_atendimento from status_chamado where cod_status = " + CodStatus
            Dim dt As DataTable = objAcessoDados.BuscarDados(strSql)

            If dt.Rows.Count > 0 Then
                Tipo = dt.Rows.Item(0).Item("tipo").ToString
                Descricao = dt.Rows.Item(0).Item("descricao").ToString
                InicioAtendimento = dt.Rows.Item(0).Item("inicio_atendimento").ToString
                Return True
            End If

            Return False
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Enum TipoStatusChamado As Integer
        Inicial = 1
        Intermediario = 2
        Final = 3
        Cancelado = 4
    End Enum

    Public Enum TipoDropDown As Integer
        Completo = 1
        SubSeq = 2
    End Enum

    Public Sub New()
        objAcessoDados = New UCLAcessoDados(StrConexao)
    End Sub

    Public Function GetFirstCodStatus(tipo As Integer)
        Try
            Dim StrSql As String = " select first cod_status from status_chamado where tipo = " + tipo.ToString
            Dim dt As DataTable = objAcessoDados.BuscarDados(StrSql)
            If dt.Rows.Count > 0 Then
                Return dt.Rows.Item(0).Item("cod_status").ToString
            Else
                Return ""
            End If
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Sub FillDropDown(ByRef DDL As DropDownList, ByVal AdicionarRegistroEmBranco As Boolean, ByVal DescricaoRegistroEmBranco As String, ByVal CodRegistroEmBranco As String, ByVal Tipo As TipoDropDown, ByVal CodStatusIni As String)
        Dim strSql As String = ""
        Dim dt As DataTable

        If String.IsNullOrEmpty(CodStatusIni) Then
            CodStatusIni = "-1"
        End If

        If Tipo = TipoDropDown.Completo Then
            strSql += " select cod_status, descricao"
            strSql += "   from status_chamado"
            strSql += "  order by descricao "
        ElseIf Tipo = TipoDropDown.SubSeq Then
            strSql += " SELECT status_chamado.cod_status as cod_status, "
            strSql += "        status_chamado.descricao as descricao  "
            strSql += "   FROM status_chamado,   "
            strSql += "        status_chamado_subsequente  "
            strSql += "  WHERE status_chamado_subsequente.cod_status_sub_seq = status_chamado.cod_status "
            strSql += "    AND status_chamado_subsequente.cod_status = " + CodStatusIni
            strSql += "	or status_chamado.cod_status			     = " + CodStatusIni
            strSql += "UNION "
            strSql += "  SELECT status_chamado.cod_status as cod_status, "
            strSql += "         status_chamado.descricao as descricao  "
            strSql += "    FROM status_chamado  "
            strSql += "   WHERE status_chamado.cod_status = if " + CodStatusIni + " = -1 then status_chamado.cod_status else -1 endif"
            strSql += "	    AND status_chamado.tipo in ( '1' , '3' ) "
            strSql += "  order by descricao "
        End If

        dt = objAcessoDados.BuscarDados(strSql)

        If AdicionarRegistroEmBranco Then
            Dim NovaLinha As DataRow = dt.NewRow
            NovaLinha("cod_status") = CodRegistroEmBranco
            If String.IsNullOrEmpty(DescricaoRegistroEmBranco) Then
                DescricaoRegistroEmBranco = " "
            End If
            NovaLinha("descricao") = DescricaoRegistroEmBranco
            dt.Rows.InsertAt(NovaLinha, 0)
        End If

        DDL.DataSource = dt
        DDL.DataTextField = "descricao"
        DDL.DataValueField = "cod_status"
        DDL.DataBind()
    End Sub



End Class
