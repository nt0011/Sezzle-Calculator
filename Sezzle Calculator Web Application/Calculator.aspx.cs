using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using DynamicExpresso;

namespace Sezzle_Calculator_Web_Application
{
    public partial class Calculator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtDisplay.Text = "";
        }

        protected void btnBackspace_Click(object sender, EventArgs e)
        {
            string CharactersInTextBox = txtDisplay.Text;
            string FinalCharactersInTextBox = string.Empty;

            for (int i = 0; i < CharactersInTextBox.Length - 1; i++)
            {
                FinalCharactersInTextBox = FinalCharactersInTextBox + CharactersInTextBox[i];
            }

            txtDisplay.Text = FinalCharactersInTextBox;
        }

        protected void btnLeftBracket_Click(object sender, EventArgs e)
        {
            txtDisplay.Text = txtDisplay.Text + "(";
        }

        protected void btnRightBracket_Click(object sender, EventArgs e)
        {
            txtDisplay.Text = txtDisplay.Text + ")";
        }

        protected void btn0_Click(object sender, EventArgs e)
        {
            txtDisplay.Text = txtDisplay.Text + "0";
        }

        protected void btn1_Click(object sender, EventArgs e)
        {
            txtDisplay.Text = txtDisplay.Text + "1";
        }

        protected void btn2_Click(object sender, EventArgs e)
        {
            txtDisplay.Text = txtDisplay.Text + "2";
        }

        protected void btn3_Click(object sender, EventArgs e)
        {
            txtDisplay.Text = txtDisplay.Text + "3";
        }

        protected void btn4_Click(object sender, EventArgs e)
        {
            txtDisplay.Text = txtDisplay.Text + "4";
        }

        protected void btn5_Click(object sender, EventArgs e)
        {
            txtDisplay.Text = txtDisplay.Text + "5";
        }

        protected void btn6_Click(object sender, EventArgs e)
        {
            txtDisplay.Text = txtDisplay.Text + "6";
        }

        protected void btn7_Click(object sender, EventArgs e)
        {
            txtDisplay.Text = txtDisplay.Text + "7";
        }

        protected void btn8_Click(object sender, EventArgs e)
        {
            txtDisplay.Text = txtDisplay.Text + "8";
        }

        protected void btn9_Click(object sender, EventArgs e)
        {
            txtDisplay.Text = txtDisplay.Text + "9";
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            txtDisplay.Text = txtDisplay.Text + "+";
        }

        protected void btnSubtract_Click(object sender, EventArgs e)
        {
            txtDisplay.Text = txtDisplay.Text + "-";
        }

        protected void btnMultiply_Click(object sender, EventArgs e)
        {
            txtDisplay.Text = txtDisplay.Text + "*";
        }

        protected void btnDivide_Click(object sender, EventArgs e)
        {
            txtDisplay.Text = txtDisplay.Text + "/";
        }

        protected void btnDecimal_Click(object sender, EventArgs e)
        {
            txtDisplay.Text = txtDisplay.Text + ".";
        }

        protected void btnEquals_Click(object sender, EventArgs e)
        {
            string str = txtDisplay.Text;
            if (txtDisplay.Text == string.Empty)
            {
                Response.Write("<script>alert('No operation is being performed!')</script>");
            }
            else
            {
                var interpreter = new Interpreter();
                var result = interpreter.Eval(str);
                //Response.Write("<script>alert(\"" + result + "\")</script>");
                string fullexpression = str + " = " + result;
                //Response.Write("<script>alert(\"" + fullexpression + "\")</script>");

                txtDisplay.Text = result.ToString();

                string sql = "INSERT INTO [Result] (result) VALUES (@result)";

                using (SqlConnection connection = new SqlConnection(GetConnectionString()))
                {
                    using (SqlCommand cmd = new SqlCommand(sql, connection))
                    {
                        cmd.Parameters.AddWithValue("@result", fullexpression);
                        connection.Open();
                        cmd.ExecuteNonQuery();
                        fullexpression = "";
                    }
                }
            }
        }

        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings
                ["ConnectionString"].ConnectionString;
        }

        protected void grdResult_SelectedIndexChanged(object sender, EventArgs e)
        {

        }



        
    }
}