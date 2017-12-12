using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class All : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        string selectedValue = rdbtn_price.SelectedValue;

        
        if (rdbtn_price.SelectedIndex == 0)
            this_price.Text = "0";
        else if (rdbtn_price.SelectedIndex == 1)
            this_price.Text = "500000";
        else if (rdbtn_price.SelectedIndex == 2)
            this_price.Text = "1000000";
        else if (rdbtn_price.SelectedIndex == 3)
            this_price.Text = "2000000";
        else
            this_price.Text = "3000000";
        
    }

    protected void rdbtn_price_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
}