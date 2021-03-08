<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calculator.aspx.cs" Inherits="Sezzle_Calculator_Web_Application.Calculator" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sezzle Calculator</title>
    <link href="Cal_style.css" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script runat="server">
        private void Timer1_Tick(object sender, EventArgs e)
        {
            grdResult.DataBind();
            
            UpdatePanel1.Update();
        }
    </script>
</head>
<body style="background:url('Images/img1.jpg') no-repeat 100% 0; background-size:cover; overflow:auto">
    <div style="vertical-align:middle; text-align:center;">
        <asp:Label runat="server" Text="Sezzle Calculator" ForeColor="Black" Font-Size="X-Large" Font-Italic="true"></asp:Label>
    </div>
    <form id="form1" runat="server">        
    <asp:ScriptManager ID="scriptmanager1" runat="server">  
            </asp:ScriptManager>
        
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" ViewStateMode="Enabled">
                <ContentTemplate>

        <div class="calculator_placeholder">
            <table class="calculator" id="calcID" 
                style="font-family:Calibri ;border-radius:10px ;background-color:darkcyan ;margin:auto">
            <tr>
                <td colspan="4" class="display_style">
                    <asp:TextBox runat="server" ID="txtDisplay" CssClass="display_style_box"></asp:TextBox>                    
                </td>
            </tr>
            <tr>
                <td class="td_style1">
                        <asp:Button ID="btnClear" runat="server"  Text="Clear" OnClick="btnClear_Click" CssClass="btn_style"/>
                </td>
                <td class="td_style1">
                        <asp:Button ID="btnBackspace" runat="server"  Text="&larr;" OnClick="btnBackspace_Click" CssClass="btn_style" />
                </td>
                <td class="td_style1">
                        <asp:Button ID="btnLeftBracket" runat="server"  Text="(" OnClick="btnLeftBracket_Click" CssClass="btn_style" />
                </td>
                <td class="td_style1">
                        <asp:Button ID="btnRightBracket" runat="server"  Text=")" OnClick="btnRightBracket_Click" CssClass="btn_style" />
                </td>                
            </tr>
            <tr>
                <td class="td_style1">
                        <asp:Button ID="btn7" runat="server"  Text="7" OnClick="btn7_Click" CssClass="btn_style" />
                </td>
                <td class="td_style1">
                        <asp:Button ID="btn8" runat="server"  Text="8" OnClick="btn8_Click" CssClass="btn_style" />
                </td>
                <td class="td_style1">
                        <asp:Button ID="btn9" runat="server"  Text="9" OnClick="btn9_Click" CssClass="btn_style" />
                </td>
                <td class="td_style1">
                        <asp:Button ID="btnAdd" runat="server"  Text="+" OnClick="btnAdd_Click" CssClass="btn_style" />
                </td>                
            </tr>
            <tr>
                <td class="td_style1">
                        <asp:Button ID="btn4" runat="server"  Text="4" OnClick="btn4_Click" CssClass="btn_style" />
                </td>
                <td class="td_style1">
                        <asp:Button ID="btn5" runat="server"  Text="5" OnClick="btn5_Click" CssClass="btn_style" />
                </td>
                <td class="td_style1">
                        <asp:Button ID="btn6" runat="server"  Text="6" OnClick="btn6_Click" CssClass="btn_style" />
                </td>
                <td class="td_style1">
                        <asp:Button ID="btnSubtract" runat="server"  Text="-" OnClick="btnSubtract_Click" CssClass="btn_style" />
                </td>                
            </tr>
            <tr>
                <td class="td_style1">
                        <asp:Button ID="btn1" runat="server"  Text="1" OnClick="btn1_Click" CssClass="btn_style" />
                </td>
                <td class="td_style1">
                        <asp:Button ID="btn2" runat="server"  Text="2" OnClick="btn2_Click" CssClass="btn_style" />
                </td>
                <td class="td_style1">
                        <asp:Button ID="btn3" runat="server"  Text="3" OnClick="btn3_Click" CssClass="btn_style" />
                </td>
                <td class="td_style1">
                        <asp:Button ID="btnMultiply" runat="server"  Text="*" OnClick="btnMultiply_Click" CssClass="btn_style" />
                </td>                
            </tr>
            <tr>
                <td class="td_style1">
                        <asp:Button ID="btn0" runat="server"  Text="0" OnClick="btn0_Click" CssClass="btn_style" />
                </td>
                <td class="td_style1">
                        <asp:Button ID="btnDecimal" runat="server"  Text="." OnClick="btnDecimal_Click" CssClass="btn_style" />
                </td>
                <td class="td_style1">
                        <asp:Button ID="btnDivide" runat="server"  Text="&divide;" OnClick="btnDivide_Click" CssClass="btn_style" />
                </td>
                <td class="td_style1">
                        <asp:Button ID="btnEquals" runat="server"  Text="=" OnClick="btnEquals_Click" CssClass="btn_style" />
                </td>
            </tr>
        </table>
        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
        <br /><br /><br /><br /><br />
        
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ViewStateMode="Enabled">
                <ContentTemplate>
            
                    <asp:GridView ID="grdResult" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" BackColor="AliceBlue" 
                        CssClass="table-bordered" 
                        DataSourceID="SqlDataSource1" OnSelectedIndexChanged="grdResult_SelectedIndexChanged" HorizontalAlign="Center">
                        <Columns>
                            <asp:BoundField DataField="result" HeaderText="10 Recent Calculations" SortExpression="result" />
                        </Columns>
                    </asp:GridView>
                    <asp:Timer ID="Timer1" runat="server" Interval="500" OnTick="Timer1_Tick">
                    </asp:Timer>
                    </ContentTemplate>
                <Triggers>
                      <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                </Triggers>

                </asp:UpdatePanel>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT TOP 10 * FROM [Result] ORDER BY [Id] DESC" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
        
    </form>
</body>
</html>
