<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UploadShoeImages.aspx.cs" Inherits="MyKicks.UploadShoeImages" %>

<%@ MasterType VirtualPath="~/MasterPage.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <%--Needed when using Ajax--%>
    <asp:ScriptManager runat="server" />

    <div class="container-shrink">
        <div class="container-afu">

            <act:AjaxFileUpload runat="server" ID="afuImages" CssClass="change-afu" AllowedFileTypes="jpg,jpeg" MaximumNumberOfFiles="50" OnUploadComplete="afuImages_UploadComplete1" />
        </div>
    </div>


</asp:Content>
