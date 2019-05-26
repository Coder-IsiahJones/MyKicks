using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace MyKicks
{
    public partial class MaintainShoes : System.Web.UI.Page
    {
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

        protected void livShoe_ItemInserted(object sender, ListViewInsertedEventArgs e)
        {
            //Make sure the db call was successfull
            if (e.Exception == null)
            {
                if (e.AffectedRows == 1)
                {

                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Shoe was successfully added.";
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Shoe NOT successfully added.";
                    e.KeepInInsertMode = true;
                }
            }
            else
            {
                //Display error message
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Shoe NOT successfully added. The following error occurred: " + e.Exception.Message;
                e.KeepInInsertMode = true; //Keep in insert mode if error occures
                e.ExceptionHandled = true;
            }
        }

        protected void livShoe_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
        {
            //Make sure the database call was successful.
            if (e.Exception == null)
            {
                if (e.AffectedRows == 1)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Shoe successfully modified.";
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Shoe NOT successfully modified. Please report this message to.....";
                    e.KeepInEditMode = true;
                }
            }
            else
            {
                //An exception has occured.
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Shoe NOT successfully modified. Please report the following message to..." + e.Exception.Message;
                e.KeepInEditMode = true;
                e.ExceptionHandled = true;
            }
        }

        protected void livShoe_ItemDeleted(object sender, ListViewDeletedEventArgs e)
        {
            //Make sure the database call was successful
            if (e.Exception == null)
            {
                if (e.AffectedRows == 1)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Shoe successfully deleted.";
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Shoe NOT successfully deleted. Please report this message to....";

                }
            }
            else
            {
                if (((SqlException)e.Exception).Number.Equals(547))
                {
                    //A foreign key constraint violation has occured.
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Shoe NOT successfully deleted because it is associated with at least one order line. To delete this Shoe, you must first delete all of its associtated order lines.";
                    e.ExceptionHandled = true;
                }
                else
                {
                    //Some other exception has occured.
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Shoe NOT successfully deleted. Please report the following message to...." + e.Exception.Message;
                    e.ExceptionHandled = true;
                }
            }
        }

        protected void livShoe_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            //Cancel the insert or update operation.
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = "Operation cancelled. No data was affected.";
        }

        protected void fupImage_DataBinding(object sender, EventArgs e)
        {

        }
    }
}