using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

namespace SyndAmbiance
{
    public partial class staffstatus : System.Web.UI.Page
    {
        string bic;
        int admId;
        DataSet dsUerData = new DataSet();
        DataSet dsUerAdminData = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            dsUerAdminData = (DataSet)Session["usrData"];

            bic = dsUerAdminData.Tables[0].Rows[0]["branch"].ToString();

            //  admBranch.Text = Session["adminBranch"].ToString();


            admBranch.Text = bic + " - " + dsUerAdminData.Tables[0].Rows[0]["branchname"].ToString();
            admId = Convert.ToInt32(dsUerAdminData.Tables[0].Rows[0]["usrid"].ToString());

            if (!IsPostBack)
            {
                branchStaffList();
                AdminIfo();
            }
        }


        public void AdminIfo()
        {
            Label ubic = (Label)Page.Master.FindControl("BranchBic");
            ubic.Text = bic;
            Image uimage = (Image)Page.Master.FindControl("uimage");

            Label uname = (Label)Page.Master.FindControl("admname");
            uname.Text = dsUerAdminData.Tables[0].Rows[0]["UsrName"].ToString();
            uimage.ImageUrl = dsUerAdminData.Tables[0].Rows[0]["photo"].ToString();

        }


        public void branchStaffList()
        {
            string connstring = ConfigurationManager.ConnectionStrings["mysqlConn"].ToString();

            MySqlConnection connection = new MySqlConnection(connstring);
            MySqlCommand cmdGetUserData = new MySqlCommand("SELECT * FROM staffinfo where branch='" + bic + "'", connection);

            MySqlDataAdapter adp = new MySqlDataAdapter();
            adp.SelectCommand = cmdGetUserData;
            adp.Fill(dsUerData);

            staffStatusRating.DataSource = dsUerData;
            staffStatusRating.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in staffStatusRating.Rows)
            {

                 CheckBox chkbox = (row.FindControl("confirmchk") as CheckBox);

                 if (chkbox.Checked == true)
                 {

                     Label sid = (row.FindControl("stffId") as Label);
                     DropDownList drpList = (row.FindControl("drpRating") as DropDownList);
                     TextBox txtcmt = (row.FindControl("comment") as TextBox);




                     int id = Convert.ToInt32(sid.Text.ToString());
                     int rating = Convert.ToInt32(drpList.SelectedValue.ToString());
                     string admComment = txtcmt.Text.ToString();
                     int admin = admId;


                     SaveStaffRating(id, admin, rating, admComment);
                 }
                 else
                 {
                     return;
                 }

            }
        }


        public void   SaveStaffRating(int id,int admin,int rating,string admComment)
        {
            string connstring = ConfigurationManager.ConnectionStrings["mysqlConn"].ToString();

            MySqlConnection connection = new MySqlConnection(connstring);
            MySqlCommand cmdGetUserData = new MySqlCommand("INSERT INTO `syndambiance`.`staffrating` (`staffid`, `adminid`, `rating`, `comment`) VALUES ('"+id+"', '"+admin+"', '"+rating+"', '"+admComment+"');", connection);

            connection.Open();

            int i = cmdGetUserData.ExecuteNonQuery();

            if (i == 0)
            {
                System.Web.UI.ScriptManager.RegisterStartupScript(Page, typeof(Page), "Script", "alert('Opps Somthing went wrong... Try Again');", true);


                connection.Close();
            }
            else
            {
                System.Web.UI.ScriptManager.RegisterStartupScript(Page, typeof(Page), "Script", "alert('Staff Rating Updated Successfully...');", true);
                connection.Close();
            }

        }
        
    }
}