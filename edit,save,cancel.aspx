<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit,save,cancel.aspx.cs" Inherits="LabJQuery.LabTask2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="myscripts/jquery-1.11.0.min.js"></script>
    <link href="mystyle.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    




        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:HyperLink ID="HyperLink1" runat="server" href="..">Edit</asp:HyperLink>
                <br />
                <asp:TextBox ID="TextBox1" runat="server" style="border:none" Text="JohnSmith" ReadOnly="true"></asp:TextBox><asp:Button ID="Button1" runat="server" Text="Save" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:HyperLink ID="HyperLink2" runat="server" href="..">Cancel</asp:HyperLink>

            </ContentTemplate>
        </asp:UpdatePanel>
    




    </div>
    <script>
        $(document).ready(function () {
            $("#Button1").hide();
            $("#HyperLink2").hide();
            var txtboxval = "ok";
            var textboxvalue;
            $("#HyperLink1").click(function () {
                // $("#TextBox1").css("border","thick");
                $("#Button1").show();
                $("#HyperLink2").show();
                textboxvalue = $("#TextBox1").val();

                $("#TextBox1").removeAttr("style");
                $("#TextBox1").prop('readonly', false);
                txtboxval = $("#TextBox1").val();
               
                alert(txtboxval);
                return false;
            });
           
          
            $("#TextBox1").on('change keyup paste mouseup', function () {
                if ($(this).val() != txtboxval) {
                    txtboxval = $(this).val();
                    //alert(txtboxval);
                }
                return false;
            });

            $("#Button1").click(function () {
               
                $("#TextBox1").html(txtboxval);

                $("#TextBox1").css("border", "none");
                $("#TextBox1").prop('readonly', true);

                return false;

            });
            $("#HyperLink2").click(function () {

                $("#TextBox1").val(textboxvalue);
                $("#TextBox1").prop('readonly', false);
                $("#TextBox1").addClass('mycssclass');

                return false;

            });
            


        });




    </script>
    </form>
</body>
</html>
