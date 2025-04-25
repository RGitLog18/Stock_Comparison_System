<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page isELIgnored="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> STOCKLIST</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/fontawesome.min.css">
    <link rel="icon" href="/stockcompsys/images/SYMBOL.jpg" type="image/x-icon">
    <style>
         .background{
            background-color:white;
            background-size: cover;
            align-content: center;
            place-items: center;
        }

        .card {
            height: 10vh;
            width: 80vh;
            margin: 10px;
            background-color: rgb(219, 225, 241);
            border-radius: 12px;
            box-shadow: 0.5rem 1rem rgba(0,0,0,-1);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            transition: background-color 0.3s;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom:1px solid #000;
        }
        .card p {
            margin: 0;
            padding: 10px;
        }
        .card button {
            border-radius: 15px;
            padding: 5px 10px;
            border: 0px;
            background-color: rgb(50, 86, 184);
            color: aliceblue;
            height: 40px;
            border-radius: 50px;
            margin-right: 30px;
        }
        .card:hover{
            outline: .1rem solid #0965c1;
            outline-offset: 0;
            cursor: pointer;
            background-color:rgba(186, 234, 250, 0.978) ;
        }
        .head{
            color: aliceblue;
            background-color:  rgb(50, 86, 184);
            padding: 10px;
            font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif ;
            text-align: center;
            width: 100vw;
        }

        .search{
            margin: 10px;
            border: 2px double black;
            border-radius: 20px;
            width: 30vw;
            padding: 10px;
            color: black;
            position: relative;
            background-color:white;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .button{
            border-radius: 15px;
            padding: 15px;
            border: 0px;
            background-color:  rgb(50, 86, 184);
            color: aliceblue;
            align-items: center;
            align-content: center;
        }
        .icon {
            margin-left: 10px;
            float: right;
            /* align-content: end; */
        }

        .selected {
        border: 2px solid #333;
        }

        .card-hghlght {
        pointer-events: auto;
        transform: scale(1);
        transition: all 0.4s;
        }

        .card-hghlght:hover {
        opacity: 1;
        transform: scale(1.02);
        }

        .content:hover .card-hghlght:not(:hover) {
        opacity: 0.5;
        transform: scale(0.9);
        }

        .navbar{
            height: 50px;
            background: radial-gradient(circle, rgba(2,0,36,1) 0%, rgba(9,9,121,1) 0%, rgba(0,212,255,1) 200%);            
            width: 100%;
        }
        
        body{
            display: flex;
            flex-wrap: wrap;
        }
        .list{
            margin-left: 10vw;
        }

        .listcard{
            display: flex;
            width: 50%;
        }

        .selected_stocks{
            width: 30%;
            margin-left: 200px;
            /* background-color: #0965c1; */
            gap: 0px;
        }

        /* .select-button {
            display: none; /* Hide buttons initially */
        

        .stockselect{
            background-color: white;
            height:150px;
            width: 250px;
            margin-bottom: 50px;
            margin-left: 70px;
            box-shadow:  0 2px 5px rgb(71, 68, 68,90);
        }


        /* #enableButton{
            margin-top: 30px;
            margin-left: 115px;
            width: 150px;
            height: 50px;
        } */

        .stockcards{
            gap:50px;
            /* background-color: aliceblue; */
            margin-top: 50px;
            
        }

        @media screen and (max-width: 768px){
            .stockcards{
                display: none;
            }

            .listcard{
                display: block;
            }

            .card {
            width: 60vh;
            }

            .stockcards .button{
                display: block;
            }

            #cmp{
                margin-left: 30px;
            }
        }
        
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: radial-gradient(circle, rgba(2,0,36,1) 0%, rgba(9,9,121,1) 0%, rgba(0,212,255,1) 200%);
            color: white;
            padding: 8px 20px;
        }
        .logo{
            display: flex;
            gap: 20px;
            height: 50px;
        }
        .logo h1{
            margin: 0;
            font-size: 30px;
            padding-top: 8px;
        }
        .logo img {
            height: 50px;
            border-radius: 50%;
        }
        .nav-links {
            display: flex;
            gap: 20px;
            list-style: none;
            margin-left: 65vw;
            cursor: pointer;
  }
        .main-content {
            height: 100%;
         display: flex;
            flex: 1;
            overflow: hidden;
        }
/* profile */
.icons {
            display: flex;
            gap: 15px;
            align-items: center;
        }
        .wishlist, .avatar {
            cursor: pointer;
        }
        #avatar {
            height: 40px;
            border-radius: 50%;
        }

        /*profile Sidebar */
        .sidebar {
            position: fixed;
            top: 0;
            right: -350px;
            width: 300px;
            height: 100vh;
            background: white;
            box-shadow: -3px 0 10px rgba(0,0,0,0.2);
            transition: right 0.3s;
            padding: 20px;
            z-index: 999;
        }
        .sidebar.active {
            right: 0;
        }
        .sidebar .close-btn {
            text-align: right;
            font-size: 1.5em;
            cursor: pointer;
        }
        .sidebar img {
            width: 100px;
            display: block;
            margin: 10px auto;
            border-radius: 50%;
        }
        .profilename{
          text-align: center;
        }
        #editname{
          cursor: pointer;
          display: none;
        }
        .sidebar .menu {
            list-style: none;
            padding: 0;
        }
        .sidebar .menu li {
            padding: 10px;
            font-size: 1.2em;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .sidebar .menu li:hover {
            background: #add3ff;
        }
        #logout:hover {
            background: #ffcccc;

        }
        .submenu {
    display: none;
    list-style: none;
    padding-left: 30px;
    font-size: 0.95em;
}

.submenu li {
    padding: 8px 10px;
    cursor: pointer;
    color: #333;
}

.submenu li:hover {
    background-color: #f7f7f7;
}
    </style>
</head>
<body>
    <div class="navbar">
        <div class="logo">
            <img src="/stockcompsys/images/logoupdate.PNG" alt="logo">
            <h1>Stock Lists for Daily</h1>
     </div>        
        <div class="icons">
            <img src="/stockcompsys/images/avatar.png" alt="Profile Picture" id="avatar" onclick="toggleProfile()">
        </div>
        
            <!-- <button class="btn-toggle">Toggle Dark-Mode</button> -->
        <!-- <span class="more-option" id="avatar">&#x22EE;</span> -->
        <!-- <div class="popover" id="popover">
            <a href="index.html"><button>Logout<i class="fa-duotone fa-solid fa-right-from-bracket"></i></button></a>
           <a><button>Help<i class="fa-regular fa-circle-question"></i></button></a>
        </div> -->
        </div>
    </div>
     <!-- Profile -->
     <div id="profileSidebar" class="sidebar">
        <div class="close-btn" onclick="toggleProfile()">&times;</div>
        <img src="/stockcompsys/images/avatar.png" alt="Profile Picture">
        <h3 class="profilename"><%=session.getAttribute("username") %><i class="fa-solid fa-edit" id="editname"></i></h3>

        <ul class="menu">

            <li onclick="toggleDropdown('productsDropdown')">
                <i class="fa-solid fa-box"></i> Navigate To
                <i class="fa-solid fa-chevron-down" style="margin-left:auto;"></i>
            </li>
            <ul class="submenu" id="productsDropdown">
                <li  style="cursor: not-allowed; background-color: #4a90e2; color: white;"><i class="fa-solid fa-user-group"></i>Community</li>
                <li  onclick="location.href='brokers.jsp'"><i class="fa-solid fa-handshake"></i>Brokers</li>
                <li onclick="location.href='news.jsp'"><i class="fa-solid fa-newspaper"></i>News</li>
                <li onclick="location.href='homepage.jsp'"><i class="fa-solid fa-home"></i>Home</li>
        </ul>
        
            <li><i class="fa-solid fa-cog"></i> Settings</li>
        
            <li class="dark-mode-toggle"><i class="fa-solid fa-moon"></i> Dark Mode</li>
        
            <li onclick="toggleDropdown('aboutDropdown')">
                <i class="fa-solid fa-info-circle"></i> About Us
                <i class="fa-solid fa-chevron-down" style="margin-left:auto;"></i>
            </li>
            <ul class="submenu" id="aboutDropdown">
                <p>Our aim is to simplify stock market analysis through innovative digital solutions. With Instocks, we strive to bridge the gap between beginners and the complex world of stock trading.</p>
            </ul>
        
            <li onclick="toggleDropdown('helpDropdown')">
                <i class="fa-solid fa-question-circle"></i> Help
                <i class="fa-solid fa-chevron-down" style="margin-left:auto;"></i>
            </li>
            <ul class="submenu" id="helpDropdown">
                <li><i class="fa-solid fa-square-phone"></i> Contact Support</li>
                <li><i class="fa-solid fa-question-circle"></i> FAQs</li>
            </ul>
            <li id="logout" onclick="location.href='home.html';">
                <i class="fa-solid fa-sign-out"></i>Logout</li>
        </ul>
        
    </div>

    <div class="body" style="background-image: url(/stockcompsys/images/logo4.PNG); width: 100%;">
        <!-- sidebar -->
        <div>
            
        </div>

        <div class="listcard">
        <!-- stocklist -->
            <div class="list">
                <div class="card card-hghlght" id="card1" >
                    <p>Reliance Industry Ltd.</p>
                    <button  class="select-button" id="btn1">Select</button>
                </div>
                <div class="card card-hghlght demo-card">
                    <p>Tata Consultancy Service</p>
                    <button  class="select-button" id="btn2">Select</button>
                </div>
                <div class="card card-hghlght demo-card">
                    <p>Infosys Ltd.</p>
                    <button  class="select-button" id="btn3">Select</button>
                </div>
                <div class="card card-hghlght demo-card">
                    <p>HDFC Bank Ltd.</p>
                    <button  class="select-button" id="btn4">Select</button>
                </div>
                <div class="card card-hghlght demo-card">
                    <p>ICICI Bank Ltd.</p>
                    <button  class="select-button" id="btn5">Select</button>
                </div>
                <div class="card card-hghlght demo-card">
                    <p>StateBank of India(SBI)</p>
                    <button  class="select-button" id="btn6">Select</button>
                </div>
                <div class="card card-hghlght demo-card">
                    <p>Larsen & Tourbo Ltd.</p>
                    <button  class="select-button" id="btn7">Select</button>
                </div>
                <div class="card card-hghlght demo-card">
                    <p>ITC Ltd.</p>
                    <button  class="select-button" id="btn8">Select</button>
                </div>
                <div class="card card-hghlght demo-card">
                    <p>Bajaj FInance Ltd.</p>
                    <button  class="select-button" id="btn9">Select</button>
                </div>
                <div class="card card-hghlght demo-card">
                    <p>Hidustan Unilever Ltd.</p>
                    <button  class="select-button" id="btn10">Select</button>
                </div>
            </div>

            <!-- cards -->
            <div class="selected_stocks">
                <!-- <div class="enableButton">
                    <button id="enableButton">Select</button>
                    
                </div> -->
               
                <div class="stockcards">
                    <div class="stockselect">
                        <p style="text-align: center; color: #000; 
                        border-bottom: 1px solid black; height: 25px; color:rgb(228, 216, 216);background-color: rgb(21, 107, 182); padding: 3px;">
                        <strong>Add Stock</strong></p>

                        <label >
                            <img src="/stockcompsys/images/addstock.png" alt="add here" style="border:1px solid black;height: 75px; width: 90px;margin-left: 75px;"/>
                        </label>
                    </div>

                    <div class="stockselect">
                        <p style="text-align: center; color: #000; 
                        border-bottom: 1px solid black; height: 25px; color:rgb(228, 216, 216);background-color: rgb(21, 107, 182); padding: 3px;">
                        <strong>Add Stock</strong></p>

                        <label >
                            <img src="/stockcompsys/images/addstock.png" alt="add here" style="border:1px solid black;height: 75px; width: 90px;margin-left: 75px;"/>
                        </label>
                    </div>

                </div>

                <button id="cmp" style="width: 150px; height: 50px; 
                    margin-left: 120px; background-color: #0965c3; color: white;">Compare</button>
               
                
            </div>
        </div>


    </div>

    <!-- <script>
        document.getElementById("enableButton").addEventListener("click", function() {
            document.querySelectorAll(".select-button").forEach(button => button.style.display = "inline-block");
        });
    </script> -->

    <!-- <script type="text/javascript" src="./list_to_graph.js"></script> -->
    <script>
        document.addEventListener("DOMContentLoaded", 
        function () 
        {
            const selectButtons = document.querySelectorAll(".select-button");
            const stockSlots = document.querySelectorAll(".stockselect label");

            selectButtons.forEach(
                (button) => {
                button.addEventListener("click", function () 
                {
                    const stockName = this.parentElement.querySelector("p").innerText;

                    // Find the first available stock slot that still has an image
                    for (let slot of stockSlots) 
                    {
                        let img = slot.querySelector("img");
                        
                        if (img) 
                        {
                            // Remove the image
                            img.remove();

                            // Insert the stock name
                            let stockText = document.createElement("p");
                            stockText.innerText = stockName;
                            stockText.style.textAlign = "center";
                            stockText.style.fontWeight = "bold";
                            stockText.style.marginTop = "30px";

                            slot.appendChild(stockText);
                            break; // Stop after updating the first available slot
                        }
                    }
                });
            });
        });

       

    </script>

    <script>
        let a=[];
        let tickerandname = [];
        let selectedStocks = [];
        let comparebutton=document.querySelector("#cmp");

        async function link() {
            try {
            let response = await fetch("./dailycomparison.json");
            a = await response.json();
            } catch (error) {
            console.log(error);
            }
        }

        function selectStock(stock)
        {
            if (selectedStocks.length < 2) {
                // selectedStocks.push({ company: stock.company, data: data });
                console.log(`${stock.company}`);
                tickerandname.push(stock.ticker,stock.company,stock.identify);
                console.log(tickerandname);
            } else {
                alert("You have already selected 2 stocks.");
            }
        }

        comparebutton.addEventListener("click", () => {
            const encodedData = encodeURIComponent(tickerandname.join(','));
        window.location.href = `graph.jsp?tickerarr=${encodedData}`;
    
        });


        function addButtonEventListener(buttonId, arrayIndex) 
        {
            let button = document.getElementById(buttonId);
            button.addEventListener("click", () => {
            selectStock(a[arrayIndex]);
            });
        }

        for (let i = 1; i <= 10; i++) 
        {
            addButtonEventListener(`btn${i}`, i - 1);
        }
        
        link();
    </script>
    
</body>
</html>

<!-- <script>
  
    const buttons = document.querySelectorAll('.select-button');
    const stockcards = document.querySelector('.stockcards');

    buttons.forEach(button => {
        button.addEventListener('click', function () {
            const card = this.parentElement;
            const stockName = card.querySelector('p').innerText;

            const stockBox = document.createElement('div');
            stockBox.className = 'stockselect';
            stockBox.innerHTML = `
                <p style="text-align: center; color: #000; 
                border-bottom: 1px solid black; height: 25px; color:rgb(228, 216, 216);background-color: rgb(21, 107, 182); padding: 3px;">
                <strong>${stockName}</strong></p>
            `;

            stockcards.appendChild(stockBox);

            // Optionally disable button or change it
            this.disabled = true;
            this.innerText = "Selected";
        });
    });
</script> -->