using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cart : System.Web.UI.Page
{
    ListItem cart;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["myCart"] == null )
            Session["myCart"] = new ListItem();

        cart = (ListItem)Session["myCart"];

        if(!IsPostBack)
            FillData();
        
        
    }

    private void FillData()
    {
        dgv_ListItem.DataSource = cart.ds;
        dgv_ListItem.DataBind();

        if(cart.ds.Count==0)
            lbl_totalCost.Visible = false;
        else
        {
            lbl_totalCost.Text = string.Format("Total cost : {0,19:C}", cart.TotalValue);
            lbl_totalCost.Visible = true;
        }
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        dgv_ListItem.EditIndex = -1;

        FillData();
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        dgv_ListItem.EditIndex = e.NewEditIndex;
        FillData();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        TextBox txtQuantity = (TextBox)dgv_ListItem.Rows[e.RowIndex].Cells[5].Controls[0];

        cart.Update(e.RowIndex, int.Parse(txtQuantity.Text));

        dgv_ListItem.EditIndex = -1;

        FillData();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        cart.Delete(e.RowIndex);

        FillData();
    }
}