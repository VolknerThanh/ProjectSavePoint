using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewDetails : System.Web.UI.Page
{
    ListItem ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        DataListItem item = (DataListItem)btn.NamingContainer;
        
        Label lbl_ID = (Label)item.FindControl("prodID");
        Label lbl_Amount = (Label)item.FindControl("prodAmount");

        DropDownList ddlist = (DropDownList)item.FindControl("ddlist");
        
        string numUD = Request.Form["prodQuantity"];

        if (int.Parse(lbl_Amount.Text) <= 0)
            Response.Write("Out of stock !");
        else if (int.Parse(numUD) > int.Parse(lbl_Amount.Text))
            Response.Write("Not enough !");
        else if (int.Parse(numUD) < 1)
            Response.Write("<script>alert(' Quanity must larger than 0');</script>");
        else
        {
            if (Session["myCart"] == null)
            {
                ds = new ListItem();
                Session["myCart"] = ds;
            }
            ds = (ListItem)Session["myCart"];

            string id = Request.QueryString["ID"];
            string query = "select * from ShoesStorage where id = " + id;
            DataTable data = CSDL.Instance.ExecuteQuery(query);
            DataRow dtrow = data.Rows[0];
            ds.AddItem(new cartItem(int.Parse(id), dtrow["shoesName"].ToString(), dtrow["shoesImage"].ToString(), int.Parse(dtrow["shoesPrice"].ToString()), int.Parse(dtrow["shoesAmount"].ToString()), dtrow["shoesStatus"].ToString(), dtrow["shoesType"].ToString(), int.Parse(numUD), ddlist.Text ));

        }


        //Response.Write(numUD);

        //string thisID = lbl_ID.Text;

        //Response.Write(thisID);

    }





    protected void btnBuy_Click(object sender, EventArgs e)
    {
        /*
        Button btn = (Button)sender;
        DataListItem item = (DataListItem)btn.NamingContainer;

        Label lbl_ID = (Label)item.FindControl("prodID");
        Label lbl_Amount = (Label)item.FindControl("prodAmount");

        string numUD = Request.Form["prodQuantity"];

        if (int.Parse(lbl_Amount.Text) <= 0)
            Response.Write("Out of stock !");
        else if (int.Parse(numUD) > int.Parse(lbl_Amount.Text))
            Response.Write("Not enough !");
        else if (int.Parse(numUD) < 1)
            Response.Write("<script>alert(' Quanity must larger than 0');</script>");
        else
        {
            if (ds == null)
            {
                ds = new ListItem();
                Session["myCart"] = ds;
            }

            string id = Request.QueryString["ID"];
            string query = "select * from ShoesStorage where id = " + id;
            ds = (ListItem)Session["myCart"];
            DataTable data = CSDL.Instance.ExecuteQuery(query);
            DataRow dtrow = data.Rows[0];
            ds.AddItem(new cartItem(int.Parse(id), dtrow["shoesName"].ToString(), dtrow["shoesImage"].ToString(), int.Parse(dtrow["shoesPrice"].ToString()), int.Parse(dtrow["shoesAmount"].ToString()), dtrow["shoesStatus"].ToString(), dtrow["shoesType"].ToString(), 1));

        }
        */
        Response.Redirect("Cart.aspx");

    }
}