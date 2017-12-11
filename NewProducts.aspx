<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewProducts.aspx.cs" Inherits="NewProducts" %>

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
            <li><a href="#"><i class="fa fa-info-circle" style="font-size:24px"></i> About</a></li>
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
        
        <div style="background-image: url('img/bg.png');min-width :1500px; min-height:1720px;position:absolute;background-attachment: fixed;background-position: center;background-repeat: no-repeat;background-size: cover;opacity:0.85"></div>

        <div class='container'>
		    <main>
                <h1 class="ShoesTypeName">New Products</h1>

		        <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1" GroupItemCount="3">
                    <AlternatingItemTemplate>
                        <td runat="server" style="padding:20px;">
                            <div style=" background-color:white; box-shadow: 2px 2px 10px; margin: 20px 20px 5px;padding: 20px 20px 10px; position:relative;">
                            
                                <asp:ImageButton ID="ImageButton2" runat="server" CssClass="zoomOut" ImageUrl='<%# Eval("shoesImage", "{0}") %>' PostBackUrl='<%# Eval("id", "payment.aspx?ID={0}") %>'/>
                                <br />
                                <asp:Label ID="shoesNameLabel" runat="server" CssClass="labelName" Text='<%# Eval("shoesName", "{0}") %>' />
                                <br />
                                <asp:Label ID="shoesPriceLabel" runat="server" CssClass="labelPrice" Text='<%# Eval("shoesPrice", "{0:C}") %>'/>
                                <br />Type :
                                <asp:Label ID="shoesTypeLabel" runat="server" Text='<%# Eval("shoesType") %>' />
                                <br />
                                <%# (int)Eval("shoesStatus") == 1 ? "<div class='labelStatus'><i class='fa fa-bookmark-o' style='font-size:24px'></i>  NEW</div>" : "" %>

                                <div style="text-align:center;">
                                    <asp:Button ID="Button1" CssClass="btn btn-1" runat="server" Text="View Detail" PostBackUrl='<%# Eval("id", "ViewDetails.aspx?ID={0}") %>' />
                                </div>
                            </div>
                        </td>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <td runat="server" style="">id:
                            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                            <br />shoesName:
                            <asp:TextBox ID="shoesNameTextBox" runat="server" Text='<%# Bind("shoesName") %>' />
                            <br />shoesPrice:
                            <asp:TextBox ID="shoesPriceTextBox" runat="server" Text='<%# Bind("shoesPrice") %>' />
                            <br />shoesImage:
                            <asp:TextBox ID="shoesImageTextBox" runat="server" Text='<%# Bind("shoesImage") %>' />
                            <br />shoesType:
                            <asp:TextBox ID="shoesTypeTextBox" runat="server" Text='<%# Bind("shoesType") %>' />
                            <br />shoesStatus:
                            <asp:TextBox ID="shoesStatusTextBox" runat="server" Text='<%# Bind("shoesStatus") %>' />
                            <br />shoesAmount:
                            <asp:TextBox ID="shoesAmountTextBox" runat="server" Text='<%# Bind("shoesAmount") %>' />
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                            <br /></td>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>
    <td runat="server" />
                    </EmptyItemTemplate>
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                    <InsertItemTemplate>
                        <td runat="server" style="">shoesName:
                            <asp:TextBox ID="shoesNameTextBox" runat="server" Text='<%# Bind("shoesName") %>' />
                            <br />shoesPrice:
                            <asp:TextBox ID="shoesPriceTextBox" runat="server" Text='<%# Bind("shoesPrice") %>' />
                            <br />shoesImage:
                            <asp:TextBox ID="shoesImageTextBox" runat="server" Text='<%# Bind("shoesImage") %>' />
                            <br />shoesType:
                            <asp:TextBox ID="shoesTypeTextBox" runat="server" Text='<%# Bind("shoesType") %>' />
                            <br />shoesStatus:
                            <asp:TextBox ID="shoesStatusTextBox" runat="server" Text='<%# Bind("shoesStatus") %>' />
                            <br />shoesAmount:
                            <asp:TextBox ID="shoesAmountTextBox" runat="server" Text='<%# Bind("shoesAmount") %>' />
                            <br />
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                            <br /></td>
                    </InsertItemTemplate>
                    <ItemTemplate>
                       <td runat="server" style="padding:20px;">
                            <div style=" background-color:white; box-shadow: 2px 2px 10px; margin: 20px 20px 5px;padding: 20px 20px 10px;position:relative;">
                                <asp:ImageButton ID="ImageButton1" runat="server" CssClass="zoomOut" ImageUrl='<%# Eval("shoesImage", "{0}") %>' PostBackUrl='<%# Eval("id", "payment.aspx?ID={0}") %>' />
                                <br />
                                <asp:Label ID="shoesNameLabel" runat="server" CssClass="labelName" Text='<%# Eval("shoesName", "{0}") %>' />
                                <br />
                                <asp:Label ID="shoesPriceLabel" runat="server" CssClass="labelPrice" Text='<%# Eval("shoesPrice", "{0:C}") %>'></asp:Label>
                                <br />Type:
                                <asp:Label ID="shoesTypeLabel" runat="server" Text='<%# Eval("shoesType") %>' />
                                <br />
                                <%# (int)Eval("shoesStatus") == 1 ? "<div class='labelStatus'><i class='fa fa-bookmark-o' style='font-size:24px'></i>  NEW</div>" : "" %>

                                <div style="text-align:center;">
                                    <asp:Button ID="Button1" CssClass="btn btn-1" runat="server" Text="View Detail" PostBackUrl='<%# Eval("id", "ViewDetails.aspx?ID={0}") %>' />
                                </div>
                            </div>
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                        <tr id="groupPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="position:relative; left: 40%; padding:20px;">
                                    <asp:DataPager ID="DataPager1" runat="server" PageSize="6">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                            <asp:NumericPagerField />
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <td runat="server" style="">id:
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            <br />shoesName:
                            <asp:Label ID="shoesNameLabel" runat="server" Text='<%# Eval("shoesName") %>' />
                            <br />shoesPrice:
                            <asp:Label ID="shoesPriceLabel" runat="server" Text='<%# Eval("shoesPrice") %>' />
                            <br />shoesImage:
                            <asp:Label ID="shoesImageLabel" runat="server" Text='<%# Eval("shoesImage") %>' />
                            <br />shoesType:
                            <asp:Label ID="shoesTypeLabel" runat="server" Text='<%# Eval("shoesType") %>' />
                            <br />shoesStatus:
                            <asp:Label ID="shoesStatusLabel" runat="server" Text='<%# Eval("shoesStatus") %>' />
                            <br />shoesAmount:
                            <asp:Label ID="shoesAmountLabel" runat="server" Text='<%# Eval("shoesAmount") %>' />
                            <br /></td>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ShoesStorage] WHERE ([shoesStatus] = @shoesStatus)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="shoesStatus" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

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
			<a href="#">Check guarantee</a><br>
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
