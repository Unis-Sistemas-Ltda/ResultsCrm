﻿Public Class UCLEmitenteAssessoriaFollowUp
    Inherits UCLClasseGenerica

    Public Sub New()
        ObjTabelaGenerica = New UCLTabelaGenerica("emitente_assessoria_follow_up")
    End Sub

    Public Function Buscar(ByVal pEmpresa As String, ByVal pCodEmitente As String, ByVal pCodAssessoria As String, ByVal pCodFornecedor As String, ByVal pSeqFollowUp As String) As Boolean
        Try
            Me.SetConteudo("empresa", pEmpresa)
            Me.SetConteudo("cod_emitente", pCodEmitente)
            Me.SetConteudo("cod_assessoria", pCodAssessoria)
            Me.SetConteudo("cod_fornecedor", pCodFornecedor)
            Me.SetConteudo("seq_follow_up", pSeqFollowUp)
            Return ObjTabelaGenerica.Buscar()
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Sub Excluir(ByVal pEmpresa As String, ByVal pCodEmitente As String, ByVal pCodAssessoria As String, ByVal pCodFornecedor As String, ByVal pSeqFollowUp As String)
        Try
            Me.SetConteudo("empresa", pEmpresa)
            Me.SetConteudo("cod_emitente", pCodEmitente)
            Me.SetConteudo("cod_assessoria", pCodAssessoria)
            Me.SetConteudo("cod_fornecedor", pCodFornecedor)
            Me.SetConteudo("seq_follow_up", pSeqFollowUp)
            ObjTabelaGenerica.Excluir()
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Public Function GetProximoCodigo(ByVal pEmpresa As String, ByVal pCodEmitente As String, ByVal pCodAssessoria As String, ByVal pCodFornecedor As String) As Long
        Try
            Dim StrSql As String = String.Format("select isnull(max(seq_follow_up),0) + 1 seq from emitente_assessoria_follow_up where empresa = {0} and cod_emitente = {1} and cod_assessoria = {2} and cod_fornecedor = {3}", pEmpresa, pCodEmitente, pCodAssessoria, pCodFornecedor)
            Dim dt As DataTable = ObjAcessoDados.BuscarDados(StrSql)
            If dt.Rows.Count > 0 Then
                Return dt.Rows.Item(0).Item("seq")
            Else
                Return 1
            End If
        Catch ex As Exception
            Throw ex
        End Try
    End Function

End Class
