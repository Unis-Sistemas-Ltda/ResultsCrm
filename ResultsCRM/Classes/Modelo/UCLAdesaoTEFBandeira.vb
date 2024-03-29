﻿Public Class UCLAdesaoTEFBandeira
    Inherits UCLClasseGenerica

    Public Sub New()
        ObjTabelaGenerica = New UCLTabelaGenerica("adesao_tef_bandeira")
    End Sub

    Public Function Buscar(ByVal pEmpresa As String, ByVal pCodEmitente As String, ByVal pCNPJ As String, ByVal pCodBandeira As String, ByVal pCodAdquirente As String) As Boolean
        Try
            Me.SetConteudo("empresa", pEmpresa)
            Me.SetConteudo("cod_emitente", pCodEmitente)
            Me.SetConteudo("cnpj", pCNPJ)
            Me.SetConteudo("cod_bandeira", pCodBandeira)
            Me.SetConteudo("cod_adquirente", pCodAdquirente)
            Return ObjTabelaGenerica.Buscar()
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Sub Excluir(ByVal pEmpresa As String, ByVal pCodEmitente As String, ByVal pCodBandeira As String, ByVal pCodAdquirente As String)
        Try
            Dim StrSql As String = " delete from adesao_tef_bandeira where empresa = " + pEmpresa + " and cod_emitente = " + pCodEmitente + " and cod_bandeira = " + pCodBandeira + " and cod_adquirente = " + pCodAdquirente
            ObjAcessoDados.ExecutarSql(StrSql)
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Public Sub Excluir(ByVal pEmpresa As String, ByVal pCodEmitente As String, ByVal pCNPJ As String, ByVal pCodBandeira As String, ByVal pCodAdquirente As String)
        Try
            Me.SetConteudo("empresa", pEmpresa)
            Me.SetConteudo("cod_emitente", pCodEmitente)
            Me.SetConteudo("cnpj", pCNPJ)
            Me.SetConteudo("cod_bandeira", pCodBandeira)
            Me.SetConteudo("cod_adquirente", pCodAdquirente)
            ObjTabelaGenerica.Excluir()
        Catch ex As Exception
            Throw ex
        End Try
    End Sub
End Class
