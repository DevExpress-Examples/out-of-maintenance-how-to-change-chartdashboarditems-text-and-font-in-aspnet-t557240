Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports NewProject

Namespace WebApplication1
    Partial Public Class WebForm1
        Inherits System.Web.UI.Page

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        End Sub

        Protected Sub ASPxDashboardViewer1_DataLoading(ByVal sender As Object, ByVal e As DevExpress.DashboardWeb.DataLoadingWebEventArgs)
            Dim list As List(Of [MyClass]) = CreateDataSource()
            e.Data = list
        End Sub

        Private Shared Function CreateDataSource() As List(Of [MyClass])
            Dim list As New List(Of [MyClass])(100)
            Dim _r As New Random()
            For i As Integer = 0 To 99
                    list.Add(New [MyClass]() With { _
                        .ID = i, _
                        .Name = "Name" & i, _
                        .Sales = CSng(_r.NextDouble()), _
                        .Date = Date.Now.AddDays(i) _
                    })
            Next i
            Return list
        End Function
    End Class
End Namespace