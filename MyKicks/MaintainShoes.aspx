<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MaintainShoes.aspx.cs" Inherits="MyKicks.MaintainShoes" %>

<%@ MasterType VirtualPath="~/MasterPage.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <%--Link database to dropdownlist--%>
    <asp:SqlDataSource runat="server" ID="sdsDropDownListBrand"
        ConnectionString="<%$ConnectionStrings:MyKicks%>"
        SelectCommand="SELECT BrandID, Brand
                         FROM Brand
                        ORDER BY Brand">

    </asp:SqlDataSource>

    <%--Link database to dropdownlist--%>
    <asp:SqlDataSource runat="server" ID="sdsDropDownListDeadstock"
        ConnectionString="<%$ConnectionStrings:MyKicks%>"
        SelectCommand="SELECT Deadstock
                         FROM Shoe">

    </asp:SqlDataSource>


    <%--Create datasource for ListView for brand.--%>
    <asp:SqlDataSource runat="server" ID="sdsListViewShoe"
        ConnectionString="<%$ConnectionStrings:MyKicks%>"
        OldValuesParameterFormatString="original_{0}"
        SelectCommand="SELECT *
                         FROM Shoe
                        ORDER BY Style;"
        InsertCommand="INSERT
                         INTO Shoe
                            (
                              BrandID,
                              Shoe,
                              Style,
                              Color,
                              Price,
                              Size,
                              Quanity,
                              ReleaseDate,
                              Deadstock,
                              Image
                            )
                       VALUES
                            (
                              @BrandID,
                              @Shoe,
                              @Style,
                              @Color,
                              @Price,
                              @Size,
                              @Quanity,
                              @ReleaseDate,
                              @Deadstock,
                              @Image
                            ) ;"
        UpdateCommand="UPDATE Shoe
                          SET BrandID = @BrandID,
                              Shoe = @Shoe,
                              Style = @Style,
                              Color = @Color,
                              Price = @Price,
                              Size = @Size,
                              Quanity = @Quanity,
                              ReleaseDate = @ReleaseDate,
                              Deadstock = @Deadstock,
                              Image = @Image
                        WHERE ShoeID = @original_ShoeID;"
        DeleteCommand="DELETE
                         FROM Shoe
                        WHERE ShoeID = @original_ShoeID;">

    </asp:SqlDataSource><br />

    <%--Needed when using Ajax--%>
    <asp:ScriptManager runat="server" />

    <%--Create Update panel for Ajax--%>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <div class="table-container-center ">
                <div class="shoes-format">
                    <%--Table to format ListView--%>
                    <asp:Table runat="server" SkinID="skiTable">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label runat="server" ID="lblMessage" />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <%--Listview--%>
                                <asp:ListView runat="server" ID="livShoe"
                                    DataKeyNames="ShoeID"
                                    DataSourceID="sdsListViewShoe"
                                    InsertItemPosition="FirstItem"
                                    OnItemInserted="livShoe_ItemInserted"
                                    OnItemUpdated="livShoe_ItemUpdated"
                                    OnItemDeleted="livShoe_ItemDeleted"
                                    OnItemCanceling="livShoe_ItemCanceling">

                                    <%--Used to create sort titles in html--%>
                                    <LayoutTemplate>
                                        <asp:Table runat="server">
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <table>
                                                        <tr>
                                                            <th></th>
                                                            <th style="text-align: center">
                                                                <asp:LinkButton runat="server"
                                                                    CausesValidation="false"
                                                                    CommandArgument="BrandID"
                                                                    CommandName="Sort">
                                                            BrandID
                                                                </asp:LinkButton>
                                                            </th>
                                                            <th style="text-align: center">
                                                                <asp:LinkButton runat="server"
                                                                    CausesValidation="false"
                                                                    CommandArgument="Shoe"
                                                                    CommandName="Sort">
                                                           Shoe
                                                                </asp:LinkButton>
                                                            </th>
                                                            <th style="text-align: center">
                                                                <asp:LinkButton runat="server"
                                                                    CausesValidation="false"
                                                                    CommandArgument="Style"
                                                                    CommandName="Sort">
                                                            Style
                                                                </asp:LinkButton>
                                                            </th>
                                                            <th style="text-align: center">
                                                                <asp:LinkButton runat="server"
                                                                    CausesValidation="false"
                                                                    CommandArgument="Color"
                                                                    CommandName="Sort">
                                                            Color
                                                                </asp:LinkButton>
                                                            </th>
                                                            <th style="text-align: center">
                                                                <asp:LinkButton runat="server"
                                                                    CausesValidation="false"
                                                                    CommandArgument="Price"
                                                                    CommandName="Sort">
                                                            Price
                                                                </asp:LinkButton>
                                                            </th>
                                                            <th style="text-align: center">
                                                                <asp:LinkButton runat="server"
                                                                    CausesValidation="false"
                                                                    CommandArgument="Size"
                                                                    CommandName="Sort">
                                                            Size
                                                                </asp:LinkButton>
                                                            </th>
                                                            <th style="text-align: center">
                                                                <asp:LinkButton runat="server"
                                                                    CausesValidation="false"
                                                                    CommandArgument="Quanity"
                                                                    CommandName="Sort">
                                                            Quanity
                                                                </asp:LinkButton>
                                                            </th>
                                                            <th style="text-align: center">
                                                                <asp:LinkButton runat="server"
                                                                    CausesValidation="false"
                                                                    CommandArgument="ReleaseDate"
                                                                    CommandName="Sort">
                                                            ReleaseDate
                                                                </asp:LinkButton>
                                                            </th>
                                                            <th style="text-align: center">
                                                                <asp:LinkButton runat="server"
                                                                    CausesValidation="false"
                                                                    CommandArgument="Deadstock"
                                                                    CommandName="Sort">
                                                            Deadstock
                                                                </asp:LinkButton>
                                                            </th>
                                                            <th style="text-align: center">
                                                                <asp:LinkButton runat="server"
                                                                    CausesValidation="false"
                                                                    CommandArgument="Image"
                                                                    CommandName="Sort">
                                                            Image
                                                                </asp:LinkButton>
                                                            </th>
                                                        </tr>
                                                        <tr runat="server" id="itemPlaceHolder" />
                                                    </table>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </LayoutTemplate>

                                    <%--Insert Template--%>
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Button runat="server" ID="btnModify" CausesValidation="false" CommandName="Edit" CssClass="btnFormat-ColorOnly" Text="Modify" />
                                                <asp:Button runat="server" ID="btnDelete" CausesValidation="false" CommandName="Delete" CssClass="btnFormat-ColorOnly" OnClientClick="return confirm('Are you sure you want to delete this item? Click Ok to delete. Click Cancel to keep it.') " Text="Delete" />
                                            </td>
                                            <%--Copy Area Start  Set Enabled="false" --%>
                                            <td>
                                                <asp:DropDownList runat="server" ID="ddlBrand" Enabled="false" DataSourceID="sdsDropDownListBrand" DataTextField="Brand" DataValueField="BrandID" SelectedValue='<%# Bind("BrandID") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtshoe" Enabled="false" Text='<%# Bind("Shoe") %>' Width="380" />
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtStyle" Enabled="false" Text='<%# Bind("Style") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtColor" Enabled="false" Text='<%# Bind("Color") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtPrice" Enabled="false" Text='<%# Bind("Price") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtSize" Enabled="false" Text='<%# Bind("Size") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtQuanity" Enabled="false" Text='<%# Bind("Quanity") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtReleaseDate" Enabled="false" Text='<%# Bind("ReleaseDate") %>' />
                                            </td>
                                            <td>
                                                <asp:DropDownList runat="server" ID="ddlDeadstock" Enabled="false" DataSourceID="sdsDropDownListDeadstock" DataTextField="Deadstock" DataValueField="Deadstock" SelectedValue='<%# Bind("Deadstock") %>' Width="105" />
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtImage" Enabled="false" Text='<%# Bind("Image") %>' Width="420" />
                                            </td>
                                            <%-- Copy Area End--%>
                                    </ItemTemplate>

                                    <%--Insert Item Template--%>
                                    <InsertItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Button runat="server" ID="btnAddSave" CausesValidation="true" CommandName="Insert" CssClass="btnFormat-ColorOnly" Text="Save" Width="71" />
                                                <asp:Button runat="server" ID="btnAddCancel" CausesValidation="false" CommandName="Cancel" CssClass="btnFormat-ColorOnly" Text="Cancel" Width="68" />
                                            </td>
                                            <%--Copy Area Start Set Enabled="true" --%>
                                            <td>
                                                <asp:DropDownList runat="server" ID="ddlBrand" Enabled="true" DataSourceID="sdsDropDownListBrand" DataTextField="Brand" DataValueField="BrandID" SelectedValue='<%# Bind("BrandID") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtshoe" Enabled="true" Text='<%# Bind("Shoe") %>' Width="380" />
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtStyle" Enabled="true" Text='<%# Bind("Style") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtColor" Enabled="true" Text='<%# Bind("Color") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtPrice" Enabled="true" Text='<%# Bind("Price") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtSize" Enabled="true" Text='<%# Bind("Size") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtQuanity" Enabled="true" Text='<%# Bind("Quanity") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtReleaseDate" Enabled="true" Text='<%# Bind("ReleaseDate") %>' />
                                            </td>
                                            <td>
                                                <asp:DropDownList runat="server" ID="ddlDeadstock" Enabled="true" SelectedValue='<%# Bind("Deadstock") %>' Width="105">
                                                    <asp:ListItem Text="Yes" Value="Yes" />
                                                    <asp:ListItem Text="No" Value="No" />
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtImage" Enabled="true" Text='<%# Bind("Image") %>' Width="420" />
                                            </td>
                                            <%-- Copy Area End--%>
                                        </tr>
                                    </InsertItemTemplate>

                                    <%--Edit Item Template--%>
                                    <EditItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Button runat="server" ID="btnModifySave" CausesValidation="true" CommandName="Update" CssClass="btnFormat-ColorOnly" Text="Save" Width="71" />
                                                <asp:Button runat="server" ID="btnModifyCancel" CausesValidation="false" CommandName="Cancel" CssClass="btnFormat-ColorOnly" Text="Cancel" Width="68" />
                                            </td>
                                            <%--Copy Area Start Set Enabled="true" --%>
                                            <td>
                                                <asp:DropDownList runat="server" ID="ddlBrand" Enabled="true" DataSourceID="sdsDropDownListBrand" DataTextField="Brand" DataValueField="BrandID" SelectedValue='<%# Bind("BrandID") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtshoe" Enabled="true" Text='<%# Bind("Shoe") %>' Width="380" />
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtStyle" Enabled="true" Text='<%# Bind("Style") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtColor" Enabled="true" Text='<%# Bind("Color") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtPrice" Enabled="true" Text='<%# Bind("Price") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtSize" Enabled="true" Text='<%# Bind("Size") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtQuanity" Enabled="true" Text='<%# Bind("Quanity") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtReleaseDate" Enabled="true" Text='<%# Bind("ReleaseDate") %>' />
                                            </td>
                                            <td>
                                                <asp:DropDownList runat="server" ID="ddlDeadstock" Enabled="false" SelectedValue='<%# Bind("Deadstock") %>' Width="105">
                                                    <asp:ListItem Text="Yes" Value="Yes" />
                                                    <asp:ListItem Text="No" Value="No" />
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtImage" Enabled="true" Text='<%# Bind("Image") %>' Width="420" />
                                            </td>
                                            <%-- Copy Area End--%>
                                        </tr>
                                    </EditItemTemplate>
                                </asp:ListView>
                                <br />

                                <%--DataPager--%>
                                <asp:Table runat="server" Font-Bold="true">
                                    <asp:TableRow>
                                        <asp:TableCell>
                                    <asp:DataPager runat="server" PagedControlID="livShoe" PageSize="22">
                                        <Fields>
                                            <asp:NextPreviousPagerField NextPageText="Next" 
				                                PreviousPageText="Previous" 
				                                ShowFirstPageButton="true" 
				                                ShowLastPageButton="false" 
				                                ShowNextPageButton="false" 
				                                ShowPreviousPageButton="true" />
                                            <asp:NumericPagerField ButtonCount="3" />
			                                <asp:NextPreviousPagerField NextPageText="Next" 
				                                PreviousPageText="Previous" 
				                                ShowFirstPageButton="false" 
				                                ShowLastPageButton="true" 
				                                ShowNextPageButton="true" 
				                                ShowPreviousPageButton="false" />
                                        </Fields>
                                    </asp:DataPager>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>

                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <%--Table to format ListView Ends Here--%>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <%--Update Panel Ends Here--%>

</asp:Content>
