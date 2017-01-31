<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="stopwatch.aspx.cs" Inherits="LabJQuery.labtask1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="myscripts/jquery-1.11.0.min.js"></script>
    <link href="stylestopwatch.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 338px;
        }
        .auto-style3 {
            width: 367px;
        }
        .auto-style4 {
            width: 74px;
        }
        .auto-style5 {
            width: 67px;
        }
        .auto-style6 {
            width: 63px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2 style="text-align:center"> STOPWATCH </h2>
    <div>
       
        <table class="auto-style1"  style="margin:0px auto; width:500px">
            <tr>
                <td class="auto-style2">&nbsp;&nbsp;Hours</td>
                <td class="auto-style3">Minutes</td>
                <td>Seconds</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <input id="hours" type="text" /></td>
                <td class="auto-style3">
                    <input id="minutes" type="text" /></td>
                <td>
                    <input id="seconds" type="text" /></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" style="text-align:center">
                    <input id="strt" type="button" value="Start" /> </td>
                <td class="auto-style3" style="text-align:center">
                    <input id="stp" type="button" value="Stop" /></td>
                <td style="text-align:center">
                    <input id="paus" type="button" value="Pause" /></td>
                <td>&nbsp;</td>
            </tr>
            <tr style="text-align:center">
                <br />
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="Label1" runat="server" Text="0"></asp:Label>:<asp:Label ID="Label2" runat="server" Text="00"></asp:Label>:<asp:Label ID="Label3" runat="server" Text="00"></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
        <script>
            $(document).ready(function () {
            var flag = false;
            var hour = 0;
            var minute = 0;
            var second = 0;
            var dechour = 0;
            var decminutes=0;
            var decseconds = 0;
            $("#hours").change(function () {
                $('#<%=Label1.ClientID%>').html($("#hours").val()); 
            });
            $("#minutes").change(function () {
                $('#<%=Label2.ClientID%>').html($("#minutes").val()); 
            });

            $("#seconds").change(function () {
                  $('#<%=Label3.ClientID%>').html($("#seconds").val()); 
                

            });

            function myTimer() {

                if (decseconds > 0) {
                    decseconds = decseconds - 1;
                    $('#<%=Label3.ClientID%>').html(decseconds);
                }
                else if (decminutes > 0) {
                    decminutes = decminutes - 1;
                    $('#<%=Label2.ClientID%>').html(decminutes);
                }
                else if(dechour>0){
                    dechour = dechour - 1;
                    $('#<%=Label1.ClientID%>').html(dechour);
                }

                else if ((decseconds === 0) && (decminutes === 0) && (dechour === 0)) {
                    alert("Time Out");
                    clearInterval(myVar);
                }
               
            }

                $("#strt").click(function () {
                    $('#<%=Label1.ClientID%>').html($("#hours").val()); 
                    $('#<%=Label2.ClientID%>').html($("#minutes").val()); 
                     $('#<%=Label3.ClientID%>').html($("#seconds").val()); 
                    hour = parseInt($("#hours").val());
                    minute = parseInt($("#minutes").val());
                    second = parseInt($("#seconds").val());
                  
                    dechour = hour * 3600;
                    decminutes = minute*60;
                    decseconds = second;
                           
                myVar = setInterval(function () { myTimer() }, 1000);






            });
            $("#stp").click(function () {
                clearInterval(myVar);
                 $('#<%=Label1.ClientID%>').html("0"); 
                 $('#<%=Label2.ClientID%>').html("00"); 
                 $('#<%=Label3.ClientID%>').html("00"); 
            });
                $("#paus").click(function () {
                  if(flag==false){ 
                     clearInterval(myVar);
                     $("#paus").attr('value', 'resume');
                     flag = true;
                 }
                  else if (flag == true) {
                        $("#paus").attr('value', 'pause');
                        dechour = parseInt($('#<%=Label1.ClientID%>').html());
                        decminutes = parseInt($('#<%=Label2.ClientID%>').html());
                        decseconds = parseInt($('#<%=Label3.ClientID%>').html());
                        
                        myVar = setInterval(function () { myTimer() }, 1000);
                    
                    }


                });
           

            
        });
        </script>

    </form>
</body>
</html>
