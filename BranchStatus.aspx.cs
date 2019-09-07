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
    public partial class BranchStatus : System.Web.UI.Page
    {

        string bic, adminname;
        DataSet dsUerData = new DataSet();
        DataSet dsUerAdminData = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            dsUerAdminData = (DataSet)Session["usrData"];

            bic = dsUerAdminData.Tables[0].Rows[0]["branch"].ToString();

         //  admBranch.Text = Session["adminBranch"].ToString();


            admBranch.Text = bic + " - "+dsUerAdminData.Tables[0].Rows[0]["branchname"].ToString(); ;

            if (!IsPostBack)
            {
                branchAmbianceList();
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

        adminname = uname.Text.ToString();

        }


        public void branchAmbianceList()
        {
            string connstring = ConfigurationManager.ConnectionStrings["mysqlConn"].ToString();

            MySqlConnection connection = new MySqlConnection(connstring);
            MySqlCommand cmdGetUserData = new MySqlCommand("SELECT * FROM branchambiance where bic='"+bic+"'", connection);

            MySqlDataAdapter adp = new MySqlDataAdapter();
            adp.SelectCommand = cmdGetUserData;
            adp.Fill(dsUerData);

            brnchStatus.DataSource = dsUerData;
            brnchStatus.DataBind();
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in brnchStatus.Rows)
            {


                Label ambLbl = (row.FindControl("amb_id") as Label);
                Label branchAmb = (row.FindControl("ambiance") as Label);

                FileUpload ambImg = (row.FindControl("areaimage") as FileUpload);

                string filename = ambImg.FileName.ToString();


                //Image path saving to database
                string AmbianceImage = "AmbImages/" + filename.ToString();

               

                DropDownList drpList = (row.FindControl("drpRating") as DropDownList);
                TextBox txt = (row.FindControl("comment") as TextBox);


                //Image Saving to AmbImages Folder
                ambImg.PostedFile.SaveAs(Server.MapPath("~/AmbImages/") + filename);


                int id = Convert.ToInt32(ambLbl.Text.ToString());
                string amb = branchAmb.Text.ToString();

                int Ambrat = Convert.ToInt32(drpList.SelectedValue.ToString());
                string admComment = txt.Text.ToString();


                SaveAmbiance(id, amb, AmbianceImage, Ambrat, admComment);

               
            }
        }

        public void SaveAmbiance(int aid,string Aambiance,string aimage, int aratings, string adminCommnt)
        {

            string connstring = ConfigurationManager.ConnectionStrings["mysqlConn"].ToString();

            MySqlConnection connection = new MySqlConnection(connstring);
            MySqlCommand cmdGetUserData = new MySqlCommand("INSERT INTO `branchstatus` (`id`, `bic`, `ambiancearea`, `ambimage`, `ambrating`, `admincomment`, `admin`) VALUES ('" + aid + "', '" + bic + "', '" + Aambiance + "', '" + aimage + "', '" + aratings + "', '" + adminCommnt + "', '" + adminname + "');", connection);

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