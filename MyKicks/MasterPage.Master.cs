using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Jones.Isiah.Chapter17
{
	public partial class MasterPage : System.Web.UI.MasterPage
	{

        public String User
        {
            set { lblUser.Text = value; }
        }

        public String PageTitle
        {
            set { lblPageTitle.Text = value; }
        }

        public System.Drawing.Color MessageForeColor
        {
            set { lblMessage.ForeColor = value; }
        }

        public String Message
        {
            set { lblMessage.Text = value; }
        }

        public String LogText
        {
            set { btnLog.Text = value; }
        }

		protected void Page_Load(object sender, EventArgs e)
		{

            //Footer Header Information 
            lblServerInfo.Text = " MyKickz ";
            lblVersionInfo.Text = " 1.0 ";
            lblDateInfo.Text = Convert.ToString(DateTime.Now.ToShortDateString() + " ");
            lblContactInfo.Text = " If you have questions or experience problems with this website, please contact...";

        }
	}
}