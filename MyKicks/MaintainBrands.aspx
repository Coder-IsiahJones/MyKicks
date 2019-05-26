<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MaintainBrands.aspx.cs" Inherits="MyKicks.MaintainBrands" %>
<%@ MasterType VirtualPath="~/MasterPage.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <%--Link database to dropdownlist--%>
            <asp:SqlDataSource runat="server" ID="sdsDropDownListBrand"
                ConnectionString="<%$ConnectionStrings:MyKicks%>"
                SelectCommand="SELECT BrandID, Brand
                                 FROM Brand
                                ORDER BY BrandID">

            </asp:SqlDataSource>

            <%--Create datasource for formview for brand.--%>
            <asp:SqlDataSource runat="server" ID="sdsFormViewBrand"
                ConnectionString="<%$ConnectionStrings:MyKicks%>"
                OnInserted="sdsFormViewBrand_Inserted"
                OldValuesParameterFormatString="original_{0}"
                SelectCommand="SELECT *
                                 FROM Brand
                                WHERE BrandID = @BrandID
                                ORDER BY Brand"
                InsertCommand="INSERT
                                 INTO Brand
                                    (
                                      Brand,
                                      Address,
                                      City,
                                      State,
                                      ZipCode,
                                      Phone,
                                      EmailAddress,
                                      URL
                                    )
                               VALUES
                                    (
                                      @Brand,
                                      @Address,
                                      @City,
                                      @State,
                                      @ZipCode,
                                      @Phone,
                                      @EmailAddress,
                                      @URL
                                    ) ;
                               SELECT @BrandID = SCOPE_IDENTITY();"
                UpdateCommand="UPDATE Brand
                                  SET Brand = @Brand,
                                      Address = @Address,
                                      City = @City,
                                      State = @State,
                                      ZipCode = @ZipCode,
                                      Phone = @Phone,
                                      EmailAddress = @EmailAddress,
                                      URL = @URL
                                WHERE BrandID = @original_BrandID;"
                DeleteCommand="DELETE
                                 FROM Brand
                                WHERE BrandID = @original_BrandID;">

                <%--Connects dropdownlist to formview control--%>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlBrand" Name="BrandID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>

                <%--Get new OrderLine info--%>
                <InsertParameters>
                    <asp:Parameter Direction="Output" Name="BrandID" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>

    <%--Needed when using Ajax--%>
    <asp:ScriptManager runat="server" />

    <%--Create Update panel for Ajax--%>
    <asp:UpdatePanel runat="server" >
        <ContentTemplate>

            <div class="table-container">

            
            <asp:Label runat="server" ID="lblMessage" /><br />

            <%--Used to foramt FormView--%>
            <asp:Table runat="server" CssClass="tableFormat" SkinID="skiTable">
                <asp:TableRow>
                    <asp:TableCell>
                        <%--Main table--%>
                        <asp:Table runat="server">
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Label runat="server" ID="lblBrandID" SkinID="skiLabelTitle" Text="Brand" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:DropDownList runat="server" ID="ddlBrand" AutoPostBack="true" CssClass="FormViewFormat" DataSourceID="sdsDropDownListBrand" DataTextField="Brand" DataValueField="BrandID" />
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>

                        <%--Create formview for brand.--%>
                        <asp:FormView runat="server" ID="fovBrand" 
                            DataKeyNames="BrandID"
                            DataSourceID="sdsFormViewBrand"
                            OnItemDeleted="fovBrand_ItemDeleted"
                            OnItemUpdated="fovBrand_ItemUpdated"
                            OnItemInserted="fovBrand_ItemInserted"
                            OnModeChanging="fovBrand_ModeChanging">

                            <%--Item Template--%>
                            <ItemTemplate>
                                <asp:Button runat="server" ID="btnAdd" CausesValidation="false" CommandName="New" CssClass="btnFormat" Text="Add" />
                                <asp:Button runat="server" ID="btnModify" CausesValidation="false" CommandName="Edit" CssClass="btnFormat" Text="Modify" />
                                <asp:Button runat="server" ID="btnDelete" CausesValidation="false" CommandName="Delete" CssClass="btnFormat" OnClientClick="return confirm('Are you sure you want to delete this item? Click Ok to delete. Click Cancel to keep it.') " Text="Delete" />

                                <%--Copy Area Start (SetDesignModeState Enabled="False".) --%>
                                <div>
                                    <form>
                                        <asp:Label runat="server" ID="lblBrand" SkinID="skiLabelTitle" Text="Brand" />
                                        <asp:TextBox runat="server" ID="txtBrand" CssClass="FormViewFormat" Enabled="false" placeholder="Brand" Text='<%# Bind("Brand") %>' />

                                        <asp:Label runat="server" ID="lblAddress" SkinID="skiLabelTitle" Text="Address" />
                                        <asp:TextBox runat="server" ID="txtAddress" CssClass="FormViewFormat" Enabled="false" placeholder="Address" Text='<%# Bind("Address") %>' />

                                        <asp:Label runat="server" ID="lblCity" SkinID="skiLabelTitle" Text="City" />
                                        <asp:TextBox runat="server" ID="txtCity" CssClass="FormViewFormat" Enabled="false" placeholder="City" Text='<%# Bind("City") %>' />

                                        <asp:Label runat="server" ID="lblState" SkinID="skiLabelTitle" Text="State" />
                                        <asp:TextBox runat="server" ID="txtState" CssClass="FormViewFormat" Enabled="false" placeholder="State" Text='<%# Bind("State") %>' />

                                        <asp:Label runat="server" ID="lblZipCode" SkinID="skiLabelTitle" Text="Zip Code" />
                                        <asp:TextBox runat="server" ID="txtZipCode" CssClass="FormViewFormat" Enabled="false" placeholder="Zip Code" Text='<%# Bind("ZipCode") %>' />

                                        <asp:Label runat="server" ID="lblPhone" SkinID="skiLabelTitle" Text="Phone" />
                                        <asp:TextBox runat="server" ID="txtPhone" CssClass="FormViewFormat" Enabled="false" placeholder="Phone" Text='<%# Bind("Phone") %>' />

                                        <asp:Label runat="server" ID="lblEmailAddress" SkinID="skiLabelTitle" Text="Email Address" />
                                        <asp:TextBox runat="server" ID="txtEmailAddress" CssClass="FormViewFormat" Enabled="false" placeholder="Email Address" Text='<%# Bind("EmailAddress") %>' />

                                        <asp:Label runat="server" ID="lblUrl" SkinID="skiLabelTitle" Text="URL" />
                                        <asp:TextBox runat="server" ID="txtUrl" CssClass="FormViewFormat" Enabled="false" placeholder="Url" Text='<%# Bind("URL") %>' />
                                    </form>
                                </div>
                                <%-- Copy Area End--%>
                            </ItemTemplate>

                            <%--Insert Item Template--%>
                            <InsertItemTemplate>
                                <asp:Button runat="server" ID="btnAddSave" CausesValidation="true" CommandName="Insert" CssClass="btnFormat" Text="Save" />
                                <asp:Button runat="server" ID="btnAddCancel" CausesValidation="false" CommandName="Cancel" CssClass="btnFormat" Text="Cancel" />

                                <%--Copy Area Start (SetDesignModeState Enabled="True".) --%>
                                <div>
                                    <form>
                                        <asp:Label runat="server" ID="lblBrand" SkinID="skiLabelTitle" Text="Brand" />
                                        <asp:TextBox runat="server" ID="txtBrand" CssClass="FormViewFormat" Enabled="true" placeholder="Brand" Text='<%# Bind("Brand") %>' />

                                        <asp:Label runat="server" ID="lblAddress" SkinID="skiLabelTitle" Text="Address" />
                                        <asp:TextBox runat="server" ID="txtAddress" CssClass="FormViewFormat" Enabled="true" placeholder="Address" Text='<%# Bind("Address") %>' />

                                        <asp:Label runat="server" ID="lblCity" SkinID="skiLabelTitle" Text="City" />
                                        <asp:TextBox runat="server" ID="txtCity" CssClass="FormViewFormat" Enabled="true" placeholder="City" Text='<%# Bind("City") %>' />

                                        <asp:Label runat="server" ID="lblState" SkinID="skiLabelTitle" Text="State" />
                                        <%--<asp:TextBox runat="server" ID="txtState" CssClass="FormViewFormat" Enabled="true" placeholder="State" Text='<%# Bind("State") %>' />--%>
                                        <asp:DropDownList ID="ddlState" runat="server" CssClass="FormViewFormat" Enabled="true" SelectedValue='<%# Bind("State") %>'>
                                            <asp:ListItem Value="AL">Alabama</asp:ListItem>
                                            <asp:ListItem Value="AK">Alaska</asp:ListItem>
                                            <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                                            <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                                            <asp:ListItem Value="CA">California</asp:ListItem>
                                            <asp:ListItem Value="CO">Colorado</asp:ListItem>
                                            <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                                            <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                                            <asp:ListItem Value="DE">Delaware</asp:ListItem>
                                            <asp:ListItem Value="FL">Florida</asp:ListItem>
                                            <asp:ListItem Value="GA">Georgia</asp:ListItem>
                                            <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                                            <asp:ListItem Value="ID">Idaho</asp:ListItem>
                                            <asp:ListItem Value="IL">Illinois</asp:ListItem>
                                            <asp:ListItem Value="IN">Indiana</asp:ListItem>
                                            <asp:ListItem Value="IA">Iowa</asp:ListItem>
                                            <asp:ListItem Value="KS">Kansas</asp:ListItem>
                                            <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                                            <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                                            <asp:ListItem Value="ME">Maine</asp:ListItem>
                                            <asp:ListItem Value="MD">Maryland</asp:ListItem>
                                            <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                                            <asp:ListItem Value="MI">Michigan</asp:ListItem>
                                            <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                                            <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                                            <asp:ListItem Value="MO">Missouri</asp:ListItem>
                                            <asp:ListItem Value="MT">Montana</asp:ListItem>
                                            <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                                            <asp:ListItem Value="NV">Nevada</asp:ListItem>
                                            <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                                            <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                                            <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                                            <asp:ListItem Value="NY">New York</asp:ListItem>
                                            <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                                            <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                                            <asp:ListItem Value="OH">Ohio</asp:ListItem>
                                            <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                                            <asp:ListItem Value="OR">Oregon</asp:ListItem>
                                            <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                                            <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                                            <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                                            <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                                            <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                                            <asp:ListItem Value="TX">Texas</asp:ListItem>
                                            <asp:ListItem Value="UT">Utah</asp:ListItem>
                                            <asp:ListItem Value="VT">Vermont</asp:ListItem>
                                            <asp:ListItem Value="VA">Virginia</asp:ListItem>
                                            <asp:ListItem Value="WA">Washington</asp:ListItem>
                                            <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                                            <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                                            <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                                        </asp:DropDownList>

                                        <asp:Label runat="server" ID="lblZipCode" SkinID="skiLabelTitle" Text="Zip Code" />
                                        <asp:TextBox runat="server" ID="txtZipCode" CssClass="FormViewFormat" Enabled="true" placeholder="Zip Code" Text='<%# Bind("ZipCode") %>' />

                                        <asp:Label runat="server" ID="lblPhone" SkinID="skiLabelTitle" Text="Phone" />
                                        <asp:TextBox runat="server" ID="txtPhone" CssClass="FormViewFormat" Enabled="true" placeholder="Phone" Text='<%# Bind("Phone") %>' />

                                        <asp:Label runat="server" ID="lblEmailAddress" SkinID="skiLabelTitle" Text="Email Address" />
                                        <asp:TextBox runat="server" ID="txtEmailAddress" CssClass="FormViewFormat" Enabled="true" placeholder="Email Address" Text='<%# Bind("EmailAddress") %>' />

                                        <asp:Label runat="server" ID="lblUrl" SkinID="skiLabelTitle" Text="URL" />
                                        <asp:TextBox runat="server" ID="txtUrl" CssClass="FormViewFormat" Enabled="true" placeholder="Url" Text='<%# Bind("URL") %>' />
                                    </form>
                                </div>
                                <%-- Copy Area End--%>
                            </InsertItemTemplate>

                            <%--Edit Item Template--%>
                            <EditItemTemplate>
                                <asp:Button runat="server" ID="btnModifySave" CausesValidation="true" CommandName="Update" CssClass="btnFormat" Text="Save" />
                                <asp:Button runat="server" ID="btnModifyCancel" CausesValidation="false" CommandName="Cancel" CssClass="btnFormat" Text="Cancel" />

                                <%--Copy Area Start (SetDesignModeState Enabled="True".) --%>
                                <div>
                                    <form>
                                        <asp:Label runat="server" ID="lblBrand" SkinID="skiLabelTitle" Text="Brand" />
                                        <asp:TextBox runat="server" ID="txtBrand" CssClass="FormViewFormat" Enabled="true" placeholder="Brand" Text='<%# Bind("Brand") %>' />

                                        <asp:Label runat="server" ID="lblAddress" SkinID="skiLabelTitle" Text="Address" />
                                        <asp:TextBox runat="server" ID="txtAddress" CssClass="FormViewFormat" Enabled="true" placeholder="Address" Text='<%# Bind("Address") %>' />

                                        <asp:Label runat="server" ID="lblCity" SkinID="skiLabelTitle" Text="City" />
                                        <asp:TextBox runat="server" ID="txtCity" CssClass="FormViewFormat" Enabled="true" placeholder="City" Text='<%# Bind("City") %>' />

                                        <asp:Label runat="server" ID="lblState" SkinID="skiLabelTitle" Text="State" />
                                        <%--<asp:TextBox runat="server" ID="txtState" CssClass="FormViewFormat" Enabled="true" placeholder="State" Text='<%# Bind("State") %>' />--%>
                                         <asp:DropDownList ID="ddlState" runat="server" CssClass="FormViewFormat" Enabled="true" SelectedValue='<%# Bind("State") %>'>
                                            <asp:ListItem Value="AL">Alabama</asp:ListItem>
                                            <asp:ListItem Value="AK">Alaska</asp:ListItem>
                                            <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                                            <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                                            <asp:ListItem Value="CA">California</asp:ListItem>
                                            <asp:ListItem Value="CO">Colorado</asp:ListItem>
                                            <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                                            <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                                            <asp:ListItem Value="DE">Delaware</asp:ListItem>
                                            <asp:ListItem Value="FL">Florida</asp:ListItem>
                                            <asp:ListItem Value="GA">Georgia</asp:ListItem>
                                            <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                                            <asp:ListItem Value="ID">Idaho</asp:ListItem>
                                            <asp:ListItem Value="IL">Illinois</asp:ListItem>
                                            <asp:ListItem Value="IN">Indiana</asp:ListItem>
                                            <asp:ListItem Value="IA">Iowa</asp:ListItem>
                                            <asp:ListItem Value="KS">Kansas</asp:ListItem>
                                            <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                                            <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                                            <asp:ListItem Value="ME">Maine</asp:ListItem>
                                            <asp:ListItem Value="MD">Maryland</asp:ListItem>
                                            <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                                            <asp:ListItem Value="MI">Michigan</asp:ListItem>
                                            <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                                            <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                                            <asp:ListItem Value="MO">Missouri</asp:ListItem>
                                            <asp:ListItem Value="MT">Montana</asp:ListItem>
                                            <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                                            <asp:ListItem Value="NV">Nevada</asp:ListItem>
                                            <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                                            <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                                            <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                                            <asp:ListItem Value="NY">New York</asp:ListItem>
                                            <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                                            <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                                            <asp:ListItem Value="OH">Ohio</asp:ListItem>
                                            <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                                            <asp:ListItem Value="OR">Oregon</asp:ListItem>
                                            <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                                            <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                                            <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                                            <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                                            <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                                            <asp:ListItem Value="TX">Texas</asp:ListItem>
                                            <asp:ListItem Value="UT">Utah</asp:ListItem>
                                            <asp:ListItem Value="VT">Vermont</asp:ListItem>
                                            <asp:ListItem Value="VA">Virginia</asp:ListItem>
                                            <asp:ListItem Value="WA">Washington</asp:ListItem>
                                            <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                                            <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                                            <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                                        </asp:DropDownList>

                                        <asp:Label runat="server" ID="lblZipCode" SkinID="skiLabelTitle" Text="Zip Code" />
                                        <asp:TextBox runat="server" ID="txtZipCode" CssClass="FormViewFormat" Enabled="true" placeholder="Zip Code" Text='<%# Bind("ZipCode") %>' />

                                        <asp:Label runat="server" ID="lblPhone" SkinID="skiLabelTitle" Text="Phone" />
                                        <asp:TextBox runat="server" ID="txtPhone" CssClass="FormViewFormat" Enabled="true" placeholder="Phone" Text='<%# Bind("Phone") %>' />

                                        <asp:Label runat="server" ID="lblEmailAddress" SkinID="skiLabelTitle" Text="Email Address" />
                                        <asp:TextBox runat="server" ID="txtEmailAddress" CssClass="FormViewFormat" Enabled="true" placeholder="Email Address" Text='<%# Bind("EmailAddress") %>' />

                                        <asp:Label runat="server" ID="lblUrl" SkinID="skiLabelTitle" Text="URL" />
                                        <asp:TextBox runat="server" ID="txtUrl" CssClass="FormViewFormat" Enabled="true" placeholder="Url" Text='<%# Bind("URL") %>' />
                                    </form>
                                </div>
                                <%-- Copy Area End--%>
                            </EditItemTemplate>
                        </asp:FormView>
                        <br />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <%--Format table for FormView ends here--%>
                </div>
        </ContentTemplate>

    </asp:UpdatePanel>
    <%--Update Panel Ends Here--%>
</asp:Content>
