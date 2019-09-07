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
    public partial class EmployeFeedback : System.Web.UI.Page
    {

        string BrncIP;
        int bic;
        DataSet dsBranchAmbData = new DataSet();
        DataSet dsBranchData = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            BrncIP = "172.18.200.173";
            if (!IsPostBack)
            {
                branchInfo();
                branchAmbianceList();
            }
        }

        public void branchInfo()
        {

            string connstring = ConfigurationManager.ConnectionStrings["mysqlConn"].ToString();

            MySqlConnection connection = new MySqlConnection(connstring);
            MySqlCommand cmdGetUserData = new MySqlCommand("SELECT a.branchimage,a.branchbic,a.branchname,a.robic, b.roname,b.zone,c.zonename,a.branchip FROM syndbranch as a inner join syndro as b inner join syndzone as c where a.robic=b.robic and b.zone=c.zonebic and a.branchip='" + BrncIP + "';", connection);

            connection.Open();

            MySqlDataAdapter adp = new MySqlDataAdapter();
            adp.SelectCommand = cmdGetUserData;
            adp.Fill(dsBranchData);

            bic = Convert.ToInt32(dsBranchData.Tables[0].Rows[0]["branchbic"].ToString());
            string branchName = dsBranchData.Tables[0].Rows[0]["branchbic"].ToString() + " - " + dsBranchData.Tables[0].Rows[0]["branchname"].ToString();
            lblbranch.Text = branchName;

            connection.Close();
        }


        public void branchAmbianceList()
        {
            string connstring = ConfigurationManager.ConnectionStrings["mysqlConn"].ToString();

            MySqlConnection connection = new MySqlConnection(connstring);
            MySqlCommand cmdGetUserData = new MySqlCommand("SELECT * FROM branchambiance where bic='" + bic + "'", connection);

            MySqlDataAdapter adp = new MySqlDataAdapter();
            adp.SelectCommand = cmdGetUserData;
            adp.Fill(dsBranchAmbData);

           
            brnchFeedbackStatus.DataSource = dsBranchAmbData;
            brnchFeedbackStatus.DataBind();
        }

        public void btnSubmit_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in brnchFeedbackStatus.Rows)
            {


                Label ambLbl = (row.FindControl("amb_id") as Label);
                Label branchAmb = (row.FindControl("ambiance") as Label);

                DropDownList drpList = (row.FindControl("drpRating") as DropDownList);
                TextBox txt = (row.FindControl("comment") as TextBox);

                //TextBox txtemid = (row.FindControl("txtEmpId") as TextBox);
                TextBox txtemid = (TextBox)(brnchFeedbackStatus.FooterRow.FindControl("txtEmpId"));

                int id = Convert.ToInt32(ambLbl.Text.ToString());
                string amb = branchAmb.Text.ToString();
                int Ambrat = Convert.ToInt32(drpList.SelectedValue.ToString());
                string admComment = txt.Text.ToString();
                //BIC
               
                int eid = Convert.ToInt32(txtemid.Text.Trim().ToString());
                //BrnIP

                int brbic = Convert.ToInt32(dsBranchData.Tables[0].Rows[0]["branchbic"].ToString());

                SaveEmpFeedback(id, amb, Ambrat, admComment, brbic, eid, BrncIP);

            }
        }

        public void  SaveEmpFeedback(int aid, string ambi,int Ambrat, string admComment,int ebic,int emid, string BrnchIP)
        {

            string connstring = ConfigurationManager.ConnectionStrings["mysqlConn"].ToString();

            MySqlConnection connection = new MySqlConnection(connstring);
            MySqlCommand cmdGetUserData = new MySqlCommand("INSERT INTO `empfeedback` (`ambid`, `ambarea`, `emprating`, `empcomment`, `empbic`, `empid`, `ip`) VALUES ('" + aid + "', '" + ambi + "', '" + Ambrat + "', '" + admComment + "', '" + ebic + "', '" + emid + "', '" + BrnchIP + "');", connection);

            connection.Open();

            int i = cmdGetUserData.ExecuteNonQuery();

            if (i == 0)
            {
                System.Web.UI.ScriptManager.RegisterStartupScript(Page, typeof(Page), "Script", "alert('Opps Somthing went wrong... Try Again');", true);


                connection.Close();
            }
            else
            {
                System.Web.UI.ScriptManager.RegisterStartupScript(Page, typeof(Page), "Script", "alert('Branch Rating Updated Successfully...');", true);
                connection.Close();
            }

        }

    }
}