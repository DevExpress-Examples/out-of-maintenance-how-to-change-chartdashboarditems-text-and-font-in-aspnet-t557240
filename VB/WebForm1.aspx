<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="WebForm1.aspx.vb" Inherits="WebApplication1.WebForm1" %>

<%@ Register Assembly="DevExpress.Dashboard.v17.1.Web, Version=17.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        function OnItemWidgetCreated(s, args) {
            if (args.ItemName == "chartDashboardItem1") {
                var chart = args.GetWidget();
                var chartOptions = chart.option();
                $.each(chartOptions.series, function (_, series) {
                    if (series.label != undefined) {
                        series.label.border = { color: series.color, visible: true, width: 2 };
                        series.label.backgroundColor = 'transparent';
                        series.label.font = { color: series.color };

                    }
                });
                debugger;
                chartOptions.valueAxis[0].label.font = { size: 18, color: "Indigo" };
                chartOptions.valueAxis[0].title.font = { size: 20, color: "red" };


                chart.option(chartOptions);
                chart.option({
                    argumentAxis: {
                        label: {
                            font: { size: 18, color: "GoldenRod" },
                        },
                    }
                });
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxDashboardViewer ClientInstanceName="viewer" ID="ASPxDashboardViewer1" runat="server" DashboardSource="WebApplication1.Dashboard1" Height="600px" OnDataLoading="ASPxDashboardViewer1_DataLoading" Width="800px">
            <ClientSideEvents ItemWidgetCreated="OnItemWidgetCreated" />
        </dx:ASPxDashboardViewer>
    </div>
    </form>
</body>
</html>