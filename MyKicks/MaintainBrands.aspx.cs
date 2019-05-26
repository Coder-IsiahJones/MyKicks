using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace MyKicks
{
    public partial class MaintainBrands : System.Web.UI.Page
    {
        //Define the variable used to store the newly inserted primary key
        Int32 i32NewlyInsertedPrimaryKey;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Check if user login was used
            if (Session["UserName"] != null)
            {

            }
            else
            {
                Response.Redirect("Login.aspx");
            }

            this.Master.LogText = " ";
            this.Master.Message = " ";
            this.Master.PageTitle = " ";
            this.Master.User = " ";

        }

        protected void sdsFormViewBrand_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            //Get the primary key of the newly inserted row. This is used in
            // the FormViewItemInserted method to position the associated
            //DropDownList and FormView on the newly inserted row.

            if (e.Exception == null)
            {
                i32NewlyInsertedPrimaryKey = (Int32)e.Command.Parameters["@BrandID"].Value;
            }
        }

        protected void fovBrand_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            //Make sure the database call was successful
            if (e.Exception == null)
            {
                if (e.AffectedRows == 1)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Brand successfully deleted.";
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Brand NOT successfully deleted. Please report this message to....";
                }
                //Refresh page
                ddlBrand.DataBind();
                fovBrand.DataBind();
            }
            else
            {
                if (((SqlException)e.Exception).Number.Equals(547))
                {
                    //A foreign key constraint violation has occurred.
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Brand NOT successfully deleted. To delete this activity, you must first delete all its associated lines.";
                    e.ExceptionHandled = true;
                }
                else
                {
                    //Some other exception has occured.
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Brand NOT successfully deleted. The following error occurred: " + e.Exception.Message;
                    e.ExceptionHandled = true;
                }
            }
        }

        protected void fovBrand_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            //Make sure the database call was succesful
            if (e.Exception == null)
            {
                if (e.AffectedRows == 1)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Brand successfully modified.";
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Brand NOT successsfully modified. Please report this message to...";
                    e.KeepInEditMode = true;
                }
                //Refresh the page data
                String strSelectedValue;
                strSelectedValue = ddlBrand.SelectedValue;
                ddlBrand.DataBind();
                ddlBrand.SelectedValue = strSelectedValue.ToString();
                fovBrand.DataBind();
            }
            else
            {
                //An exception has occured
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Brand NOT successfully modified. Please report the following message.....: " + e.Exception.Message;
                e.KeepInEditMode = true;
                e.ExceptionHandled = true;
            }
        }

        protected void fovBrand_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            //Make sure the db call was successfull
            if (e.Exception == null)
            {
                if (e.AffectedRows == 1)
                {

                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Brand was successfully added.";
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Brand NOT successfully added.";
                    e.KeepInInsertMode = true;
                }

                //refresh the page data
                ddlBrand.DataBind();
                ddlBrand.SelectedValue = i32NewlyInsertedPrimaryKey.ToString();
                fovBrand.DataBind();

            }
            else
            {
                //Display error message
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Brand NOT successfully added. The following error occurred: " + e.Exception.Message;
                e.KeepInInsertMode = true; //Keep in insert mode if error occures
                e.ExceptionHandled = true;
            }
        }

        protected void fovBrand_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            //Cancel the insert or update operation
            if (e.CancelingEdit)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Operation cancelled. No data was affected.";
            }
        }
    }
}