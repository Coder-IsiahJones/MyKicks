<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MyKicks.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title>Login</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.ico" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/util.css" />
    <link rel="stylesheet" type="text/css" href="css/main.css" />
    <!--===============================================================================================-->
</head>
<body>
    <form id="form1" runat="server">
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100 p-l-50 p-r-50 p-t-77 p-b-30">
                    <form class="login100-form validate-form">
                        <span class="login100-form-title p-b-55">Login
                        </span>

                        <%--Email Address--%>
                        <div class="wrap-input100 validate-input m-b-16">
                            <asp:TextBox runat="server" ID="txtEmailAddress" class="input100" placeholder="Email Address" />
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <span class="lnr lnr-envelope"></span>
                            </span>
                        </div>

                        <%--Passowrd--%>
                        <div class="wrap-input100 validate-input m-b-16">
                            <asp:TextBox runat="server" ID="txtPassword" class="input100" placeholder="Password" TextMode="Password" />
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <span class="lnr lnr-lock"></span>
                            </span>
                        </div>

                        <%--Needed when using Ajax--%>
                        <asp:ScriptManager runat="server" />

                        <%--Create Update panel for Ajax--%>
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>

                                <%--Login--%>
                                <div class="container-login100-form-btn p-t-25">
                                    <asp:Button runat="server" ID="btnLogin" class="login100-form-btn" OnClick="btnLogin_Click" Text="Login" />
                                </div>

                                <br />
                                <br />

                                <asp:Label runat="server" ID="lblMessage" />
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <%--Not a member message--%>
                        <div class="text-center w-full p-t-115">
                            <asp:Label runat="server" class="txt1" Text="Not a member?" />
                            <asp:LinkButton runat="server" ID="btnSignUp" class="txt1 bo1 hov1" OnClick="btnSignUp_Click" Text="Sign up now" Enabled="false" />
                        </div>

                    </form>
                </div>
            </div>
        </div>




        <!--===============================================================================================-->
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>
    </form>
</body>
</html>
