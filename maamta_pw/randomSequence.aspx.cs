﻿using System;
using System.Collections.Generic;
using System.Globalization;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;
using System.Text.RegularExpressions;

namespace maamta_pw
{
    public partial class lab_investigation : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["LocalMySql"].ConnectionString;

        static int Random_Sequence;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["WebForm"] = "randomSequence";
              //  ShowData();
            }
        }

        public void showalert(string message)
        {
            string script = @"alert('" + message + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", script, true);
        }



        protected void btnSearch_Click(object sender, EventArgs e)
        {
            ShowData();
        }




        private void ShowData()
        {

            if (GridView1.PageIndex == 0)
            {
                Random_Sequence = 0;
            }
            else if (GridView1.PageIndex == 1)
            {
                Random_Sequence = 200;
            }
            else if (GridView1.PageIndex == 2)
            {
                Random_Sequence = 400;
            }
            else if (GridView1.PageIndex == 3)
            {
                Random_Sequence = 600;
            }
            else if (GridView1.PageIndex == 4)
            {
                Random_Sequence = 800;
            }
            else if (GridView1.PageIndex == 5)
            {
                Random_Sequence = 1000;
            }
            else if (GridView1.PageIndex == 6)
            {
                Random_Sequence = 1200;
            }
            else if (GridView1.PageIndex == 7)
            {
                Random_Sequence = 1400;
            }
            else if (GridView1.PageIndex == 8)
            {
                Random_Sequence = 1600;
            }
            else if (GridView1.PageIndex == 9)
            {
                Random_Sequence = 1800;
            }


            MySqlConnection con = new MySqlConnection(constr);
            try
            {
                con.Open();
                MySqlCommand cmd;
                if (DropDownList1.SelectedValue == "0")
                {
                    showalert("Please select Site");
                    DropDownList1.Focus();
                }
                else
                {
                    cmd = new MySqlCommand("select a.form_crf_3a_id,a.Site,a.study_code,a.pw_crf_3a_2, a.pw_crf_3a_3,a.pw_crf_3a_18,a.pw_crf_3a_19,a.study_code,a.dssid,b.Randomization_ID,b.treatment from view_crf3a as a left join lab_investigation as b on a.pw_crf_3a_18=b.Randomization_ID      LEFT JOIN fixed_pregnant_woman AS c ON c.assis_id=a.assis_id              WHERE (CASE WHEN c.site !='' THEN c.site ELSE a.site END)   like '" + DropDownList1.SelectedValue + "%'            order by str_to_date(a.pw_crf_3a_2, '%d-%m-%Y'), STR_TO_DATE(a.pw_crf_3a_3,  '%H:%i')", con);

                    MySqlDataAdapter sda = new MySqlDataAdapter();
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        DataTable dt = new DataTable();
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                            con.Close();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script type=\"text/javascript\">alert('" + ex.Message + "')</script>");
            }
            finally
            {
                con.Close();
            }
        }


        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            ShowData();
        }




        protected void btnExport_Click(object sender, EventArgs e)
        {
            ExcelExport();
        }


        public void ExcelExportMessage()
        {
            //if (DropDownList1.SelectedValue != "0")
            //{
            //    GridView2.Caption = "<h3/><b>Site: " + DropDownList1.SelectedItem.Text;
            //}
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //base.VerifyRenderingInServerForm(control);
        }


        private void Exportdata()
        {
            MySqlConnection con = new MySqlConnection(constr);
            try
            {

                con.Open();
                MySqlCommand cmd;
                if (DropDownList1.SelectedValue == "0")
                {
                    showalert("Please select Site");
                    DropDownList1.Focus();
                }
                else
                {
                    cmd = new MySqlCommand("select a.form_crf_3a_id,a.Site,a.study_code,a.pw_crf_3a_2, a.pw_crf_3a_3,a.pw_crf_3a_18,a.pw_crf_3a_19,a.study_code,a.dssid,b.Randomization_ID,b.treatment from view_crf3a as a left join lab_investigation as b on a.pw_crf_3a_18=b.Randomization_ID       LEFT JOIN fixed_pregnant_woman AS c ON c.assis_id=a.assis_id                      WHERE (CASE WHEN c.site !='' THEN c.site ELSE a.site END)   like '" + DropDownList1.SelectedValue + "%'             order by str_to_date(a.pw_crf_3a_2, '%d-%m-%Y'), STR_TO_DATE(a.pw_crf_3a_3,  '%H:%i')", con);

                    MySqlDataAdapter sda = new MySqlDataAdapter();
                    {
                        cmd.Connection = con;
                        cmd.CommandTimeout = 999999;
                        cmd.CommandType = CommandType.Text;
                        sda.SelectCommand = cmd;
                        DataTable dt = new DataTable();
                        {
                            sda.Fill(dt);
                            GridView2.DataSource = dt;
                            GridView2.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script type=\"text/javascript\">alert('" + ex.Message + "')</script>");
            }
            finally
            {
                con.Close();
            }
        }



        public void ExcelExport()
        {
            try
            {
                Response.Clear();
                Response.AddHeader("content-disposition", "attachment;filename=RANDOM SEQUENCE (" + DateTime.Today.ToString("dd-MM-yyyy") + ").xls");
                Response.Charset = "";

                Response.ContentType = "application/vnd.xls";
                System.IO.StringWriter stringWrite = new System.IO.StringWriter();
                System.Web.UI.HtmlTextWriter htmlWrite =
                new HtmlTextWriter(stringWrite);
                GridView2.AllowPaging = false;
                ExcelExportMessage();
                GridView2.CaptionAlign = TableCaptionAlign.Top;

                Exportdata();
                for (int i = 0; i < GridView2.HeaderRow.Cells.Count; i++)
                {
                    GridView2.HeaderRow.Cells[i].Style.Add("background-color", "#e17055");
                    GridView2.HeaderRow.Cells[i].Style.Add("Color", "white");
                    GridView2.HeaderRow.Cells[i].Style.Add("font-size", "15px");
                    GridView2.HeaderRow.Cells[i].Style.Add("height", "30px");
                }
                GridView2.RenderControl(htmlWrite);
                Response.Write(stringWrite.ToString());
                Response.End();

            }
            catch (Exception ex)
            {
                Response.Write("<script type=\"text/javascript\">alert(" + ex.Message + ")</script>");
            }
        }



        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {

            
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                TableCell cell1 = e.Row.Cells[5];
                cell1.BackColor = System.Drawing.Color.FromName("#cef5cb");

                if (e.Row.Cells[6].Text.ToUpper() != e.Row.Cells[7].Text)
                {
                    TableCell cell0 = e.Row.Cells[6];
                    cell0.BackColor = System.Drawing.Color.FromName("#ff7675");
                    TableCell cell = e.Row.Cells[6];
                    cell.ForeColor = System.Drawing.Color.FromName("#ffffff");
                }


                
                
                
                // To Check Randomization Sequence 


                Regex re = new Regex(@"([a-zA-Z]+)(\d+)");
                Match result = re.Match(e.Row.Cells[4].Text);
                string alphaPart = result.Groups[1].Value;
                int numberPart = Convert.ToInt32(result.Groups[2].Value);

                Random_Sequence = Random_Sequence + 1;

                if (numberPart != Random_Sequence)
                {
                    TableCell cell0 = e.Row.Cells[4];
                    cell0.BackColor = System.Drawing.Color.FromName("#ff7675");
                    TableCell cell = e.Row.Cells[4];
                    cell.ForeColor = System.Drawing.Color.FromName("#ffffff");
                }


            }
        }



    }
}