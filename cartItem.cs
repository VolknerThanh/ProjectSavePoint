using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for cartItem
/// </summary>
public class cartItem
{
    public int id { set; get; }
    public string shoesName { set; get; }
    public string shoesImage { get; set; }
    public int shoesPrice { set; get; }
    public int shoesAmount { set; get; }
    public string shoesStatus { get; set; }
    public string shoesType { get; set; }
    public int quantity { get; set; }
    public string footSize { set; get; }
    public cartItem()
    {
        id = 0;
        shoesName = "";
        shoesImage = "img/Logo.png";
        shoesPrice = 0;
        shoesAmount = 0;
        shoesStatus = "old";
        shoesType = "";
        quantity = 0;
        footSize = "0";
    }
    public cartItem(int ID, string Ten, string Hinh, int Gia, int Soluong, string TinhTrang, string Loai, int SoluongMua, string size)
    {
        id = ID;
        shoesName = Ten;
        shoesImage = Hinh;
        shoesPrice = Gia;
        shoesAmount = Soluong;
        shoesStatus = TinhTrang;
        shoesType = Loai;
        quantity = SoluongMua;
        footSize = size;
    }    
    
}