﻿<%@ Page Language="C#"  AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="no-cache"/>
    <meta http-equiv="Expires" content="-1"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Your Shoes || DiscoverYourself</title>
    <link rel="shortcut icon" href="img/Logo.ico"/>
    <!-- font -->
    <link href="https://fonts.googleapis.com/css?family=Abel|Amatic+SC|Raleway:100,200,300,400,500,600,700,800,900" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css"/>
    <!-- CSS -->
    <link rel="stylesheet" href="styles/normalize.css"/>
    <link rel="stylesheet" href="styles/main.css"/>
    <link rel="stylesheet" href="styles/size.css"/>
    <link rel="stylesheet" href="styles/images.css"/>

    <!-- JQuery -->
    <script src="lib/jquery-3.2.1.min.js"></script>
    <script src="lib/script.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>

    <menu type="context toolbar" class="menu">
        <div>
            <li><a href="homepage.html"><i class="fa fa-home"></i> Home</a></li>
            <li><a href="about.html"><i class="fa fa-info-circle" style="font-size:24px"></i> About</a></li>
            <li><a href="Cart.aspx"><i class="fa fa-cart-arrow-down" style="font-size:24px"></i> Your Cart</a></li>
            <li>
                <a href="#"><i class="fa fa-archive" style="font-size:24px"></i> Product</a>
                <ul class="submenu">
                    <li><a href="NewProducts.aspx">New</a></li>
                    <li><a href="SaleProducts.aspx">Sale-off</a></li>
                </ul>
            </li>
            <li>
               <a href="#"><i class="fa fa-venus" style="font-size:24px"></i> Women</a>
                <ul class="submenu">
                    <li><a href="Default.aspx?tag=nike">Nike</a></li>
                    <li><a href="Default.aspx?tag=converse">Converse</a></li>
                    <li><a href="Default.aspx?tag=adidas">Adidas</a></li>
                    <li><a href="Default.aspx?tag=ananas">Ananas</a></li>
                    <li><a href="Default.aspx?tag=hunter-female">Hunter</a></li>
                </ul>
            </li>
            <li>
                <a href="#"><i class="fa fa-mars" style="font-size:24px"></i> Men</a>
                <ul class="submenu">
                    <li><a href="Default.aspx?tag=nike">Nike</a></li>
                    <li><a href="Default.aspx?tag=converse">Converse</a></li>
                    <li><a href="Default.aspx?tag=adidas">Adidas</a></li>
                    <li><a href="Default.aspx?tag=ananas">Ananas</a></li>
                    <li><a href="Default.aspx?tag=hunter-male">Hunter</a></li>
                </ul>
            </li>
        </div>
    </menu>

    <form id="form1" runat="server">
        <div class ="container">
            <main>
        
                <div id="dgv_CartItem">
        
                    <asp:GridView ID="dgv_ListItem" runat="server" AutoGenerateColumns="False" Width="1259px" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                        <Columns>
                            <asp:BoundField DataField="shoesName" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" HeaderText="Product Name" >
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            </asp:BoundField>
                            <asp:ImageField DataImageUrlField="shoesImage" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ControlStyle-Width="100px" ControlStyle-Height="100px" HeaderText="Product Image">
<ControlStyle Height="100px" Width="100px"></ControlStyle>

<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            </asp:ImageField>
                            <asp:BoundField DataField="shoesPrice" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:C}" HeaderText="Product Price" ReadOnly="True" >
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="shoesType" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" HeaderText="Product Type" >
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Status" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="status" runat="server" Text='<%# int.Parse(Eval("shoesStatus").ToString()) == 1 ? "NEW" : "" %>'></asp:Label>
                                </ItemTemplate>

<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Quantity" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" HeaderText="Quantity" >
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="footSize" HeaderText="Foot Size">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Total" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# string.Format("{0,19:C}",double.Parse(Eval("shoesPrice").ToString())*int.Parse(Eval("Quantity").ToString())) %>'></asp:Label>
                                </ItemTemplate>

<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            </asp:TemplateField>
                            <asp:CommandField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ShowEditButton="True" >
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            </asp:CommandField>
                            <asp:CommandField ButtonType="Button" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" DeleteText="Delete" ShowDeleteButton="True" >
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            </asp:CommandField>
                        </Columns>
                    </asp:GridView>

                                <% Response.Write(Session["shoseStatus"]); %>
                    <asp:Label ID="lbl_totalCost" runat="server" Text="Label" Visible="False"></asp:Label>
                </div>
            </main>
        </div>
    </form>

    
    <footer id="footer">

        <div id="footer-left">
            <img src="img/Logo.jpg" style="width: 70%;" alt="logo">
        </div>
        <div id="footer-center-left">
            <h3 style="color: #23474c;"><span class="fa fa-info-circle"></span> Helpful information:</h3>
            <a href="size.html">Check foot size</a><br>
            <a href="guarantee.html">Check guarantee</a><br>
            <a href="#">Exchange Rules</a><br>
            <a href="#">Ohter shops</a>
        </div>
        <div id="footer-center-right">
            <h3 style="color: #23474c;"><span class="fa fa-phone-square"></span> Contact</h3>
            <span>0120 890 4612</span><br>
            <span>0120 756 4769</span><br>
        </div>
        <div id="footer-right">
            <h2 style="font-weight: 600;">Follow us</h2>
            <br>
            <a href="https://www.facebook.com/GoldenSunny.vn/" target="_blank"><span style="font-size:25px; padding-right: 10px;" class="fa fa-facebook-square"></span></a>
            <a href="https://twitter.com/Volkner7" target="_blank"><span style="font-size:25px; padding-right: 10px;" class="fa fa-twitter-square"></span></a>
            <a href="https://www.instagram.com/rainsilver_/" target="_blank"><span style="font-size:25px; padding-right: 10px;" class="fa fa-instagram"></span></a>
            <a href="https://www.youtube.com/channel/UCrp73TyEUkP7BUQsbcTkorw" target="_blank"><span style="font-size:25px; padding-right: 10px;" class="fa fa-youtube-square"></span></a>
        </div>

        <p id="footer-bottom">&copy; copyright 2017 YourShoes. All Rights Reserved</p>
    </footer>


</body>
</html>
