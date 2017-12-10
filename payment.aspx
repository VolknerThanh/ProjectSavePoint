<%@ Page Language="C#" AutoEventWireup="true" CodeFile="payment.aspx.cs" Inherits="payment" %>

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
    <!--
    <menu type="context toolbar" class="menu">
        <div>
            <li><a href="homepage.html"><i class="fa fa-home"></i> Home</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Profile</a></li>
            <li>
                <a href="#">Product</a>
                <ul class="submenu">
                    <li><a href="NewProducts.php">New</a></li>
                    <li><a href="Sale.php">Sale-off</a></li>
                </ul>
            </li>
            <li>
                <a href="#">Women</a>
                <ul class="submenu">
                    <li><a href="Default.aspx?tag=nike">Nike</a></li>
                    <li><a href="Default.aspx?tag=converse">Converse</a></li>
                    <li><a href="Default.aspx?tag=adidas">Adidas</a></li>
                    <li><a href="Default.aspx?tag=ananas">Ananas</a></li>
                    <li><a href="Default.aspx?tag=hunter-female">Hunter</a></li>
                </ul>
            </li>
            <li>
                <a href="#">Men</a>
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
        -->

    <form id="form1" runat="server">
    <div class='container'>
		<main>
    
        <asp:DataList ID="DataList1" runat="server" DataKeyField="id" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <td>
                    <asp:Image ID="Image1" runat="server" Height="500px" Width="500px" ImageUrl='<%# Eval("shoesImage", "{0}") %>' />
                </td>

                <td>
                    Shoes Id :
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    Name&nbsp;&nbsp;&nbsp;&nbsp; :
                    <asp:Label ID="shoesNameLabel" runat="server" Text='<%# Eval("shoesName") %>' />
                    <br />
                    Price&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
                    <asp:Label ID="shoesPriceLabel" runat="server" Text='<%# Eval("shoesPrice", "{0:C}") %>' />
                    <br />
                    Type&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
                    <asp:Label ID="shoesTypeLabel" runat="server" Text='<%# Eval("shoesType") %>' />
                    <br />
                    Status&nbsp;&nbsp;&nbsp;&nbsp; :
                    <asp:Label ID="shoesStatusLabel" runat="server" Text='<%#(int)Eval("shoesStatus") == 1 ? "NEW" : ""%>' />
                    <br />
                    Amount&nbsp;&nbsp; :
                    <asp:Label ID="shoesAmountLabel" runat="server" Text='<%# Eval("shoesAmount", "{0:D}") %>' />
                    <br />
                    How much you want to buy :<br />
                    <input id="Text1" type="number" />
                    <br />
                    Choose your size : &nbsp;
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>35</asp:ListItem>
                        <asp:ListItem>36</asp:ListItem>
                        <asp:ListItem>37</asp:ListItem>
                        <asp:ListItem>38</asp:ListItem>
                        <asp:ListItem>39</asp:ListItem>
                        <asp:ListItem>40</asp:ListItem>
                        <asp:ListItem>41</asp:ListItem>
                        <asp:ListItem>42</asp:ListItem>
                        <asp:ListItem>43</asp:ListItem>
                        <asp:ListItem>44</asp:ListItem>
                        <asp:ListItem>45</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="BtnAdd" CssClass="btn btn-1" runat="server" Text="Add To Cart" />
                </td>
<br />
            </ItemTemplate>
        </asp:DataList>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ShoesStorage] WHERE ([id] = @id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

            </main>
        </div>
    </form>

    <!--
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
    -->

</body>
</html>
