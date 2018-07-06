<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebAppVC.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script lang="javascript" type="text/html">
        document.write("Hello JavaScript world");

        $(document).ready(function(){
            var txt = $("#txtSearch");
            txt.focus();
        });

        function SearchPerson() {
            $.get("SearchProduct.aspx,
            {   
                q: $("#txtSearch").val()
            },
            function (customer){
            $("#divPerson").html(customer);
        
            });
            
     

        }
    </script>
</head>
<body>
    <form id="form1" runat="server" >
        <div>
            <asp:TextBox ID="txtData" runat="server"></asp:TextBox>
            <asp:Button ID="cmdCheck" runat="server" Text="ตรวจสอบ" OnClick="cmdCheck_Click" />
        </div>
        <div id="div1" runat="server">Test</div>
        <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" Width="220px">
            <asp:ListItem>TEST1</asp:ListItem>
            <asp:ListItem>TEST2</asp:ListItem>
            <asp:ListItem>TEST3</asp:ListItem>
            <asp:ListItem>TEST4</asp:ListItem>
        </asp:ListBox>

        <div>
            <asp:GridView ID="gvCustomers" runat="server"></asp:GridView>
        </div>

        <div>
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
            
        </div>

        <div id="divPerson"></div>

    </form>
</body>
</html>
