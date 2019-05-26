using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace MyKicks
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            String strSQL = "";
            //Develop the SQL call. (User)
            strSQL = "";
            strSQL = "SELECT UserID, FirstName + ' ' + MiddleInitial + ' ' + LastName AS FullName ";
            strSQL += " FROM [User] ";
            strSQL += "WHERE EmailAddress = @EmailAddress ";
            strSQL += "  AND Password = @Password ";

            //Define the network connection to the SQL Server database
            SqlConnection objSqlConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["MyKicks"].ConnectionString);

            //Set up the SQL command object
            SqlCommand objSqlCommand = new SqlCommand();
            objSqlCommand.Connection = objSqlConnection;
            objSqlCommand.CommandType = CommandType.Text;
            objSqlCommand.CommandText = strSQL;

            //Define the input parameters
            objSqlCommand.Parameters.AddWithValue("@EmailAddress", txtEmailAddress.Text);
            objSqlCommand.Parameters.AddWithValue("@Password", txtPassword.Text);

            //Open the connection and execute the data reader.
            objSqlConnection.Open();
            SqlDataReader objSqlDataReader = objSqlCommand.ExecuteReader();

            //Attempt to retrieve the row from the table
            if (objSqlDataReader.Read())
            {
                //Create steps for secure login
                String strFullName;
                strFullName = objSqlDataReader["FullName"].ToString() + "!";

                //Secure login
                Session["UserName"] = strFullName;

                //Redirect
                Response.Redirect("Home.aspx");
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Invalid Email Address and Password combination. Please try again.";
            }
            //Close the data reader and the connection
            objSqlDataReader.Close();
            objSqlConnection.Close();
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {

        }
    }
}