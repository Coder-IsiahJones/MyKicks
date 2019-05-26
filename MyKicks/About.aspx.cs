using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyKicks
{
    public partial class About : System.Web.UI.Page
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
    }
}