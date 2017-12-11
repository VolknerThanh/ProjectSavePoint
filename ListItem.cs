using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ListItem
/// </summary>
public class ListItem
{
    public List<cartItem> ds { set; get; }
    public ListItem()
    {
        ds = new List<cartItem>();
    }
    int getIndexOf(int this_ID)
    {
        foreach(cartItem item in ds)
        {
            if (item.id == this_ID)
                return ds.IndexOf(item);
        }
        return -1;
    }
    public void AddItem(cartItem item)
    {
        int index = getIndexOf(item.id);

        if(index == -1)
        {
            ds.Add(item);
        }
        else
        {
            ds[index].quantity += item.quantity;
        }
    }
    public void Delete(int rowID)
    {
        ds.RemoveAt(rowID);
    }
    public void Update(int rowID, int Quantity)
    {
        if(Quantity > 0)
        {
            ds[rowID].quantity = Quantity;
        }
        else
        {
            Delete(rowID);
        }
    }
    public double TotalValue
    {
        get
        {
            if(ds == null)
                return 0;
            else
            {
                double total = 0;
                foreach(var item in ds)
                {
                    total += (item.quantity * item.shoesPrice);
                }
                return total;
            }
        }
    }
}