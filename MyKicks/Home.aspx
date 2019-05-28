<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MyKicks.Home" %>
<%@ MasterType VirtualPath="~/MasterPage.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
 


   <%--Create datasource for ListView for brand.--%>
    <asp:SqlDataSource runat="server" ID="sdsListViewShoe"
        ConnectionString="<%$ConnectionStrings:MyKicks%>"
        OldValuesParameterFormatString="original_{0}"
        SelectCommand="SELECT Image, Style, Color, Size, Shoe
                         FROM Shoe">

        </asp:SqlDataSource>

    <asp:ListView runat="server" ID="livShoe"
        DataSourceID="sdsListViewShoe">
        <ItemTemplate>

            <div class="responsive">
                <figure class="imghvr-fade">
                    <div class="gallery">

                        <asp:Image runat="server" ImageUrl='<%# "~/ShoeImages/" + Eval("Image") %>' />
                        <div class="description">
                            <figcaption>
                                <asp:Label runat="server" ID="lblDescription" Text='<%# Bind("Shoe") %>' /><br />
                                <asp:Label runat="server" ID="lblStyle" Text='<%# Bind("Style") %>' />
                                <asp:Label runat="server" ID="lblColor" Text='<%# Bind("Color") %>' /><br />
                                <div class="size">
                                    <asp:Label runat="server" ID="lblSize" Text='<%# Bind("Size") %>' />
                                </div>
                            </figcaption>

                        </div>
                </div>
                    </figure>
                    
            </div>

        </ItemTemplate>

    </asp:ListView>
   
</asp:Content>
