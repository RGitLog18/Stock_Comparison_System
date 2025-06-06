<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page isELIgnored="true" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stock Comparison News</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="icon" href="/stockcompsys/images/SYMBOL.jpg" type="image/x-icon">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        body {
            background-color: #f4f4f4;
            color: #333;
        }
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: radial-gradient(circle, rgba(2,0,36,1) 0%, rgba(9,9,121,1) 0%, rgba(0,212,255,1) 200%);
            color: white;
            padding: 12px 30px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        .logo{
            display: flex;
            gap: 20px;
            height: 50px;
        }
        .logo h1{
            margin: 0;
            padding-top: 12px;
        }
        .logo img {
            height: 50px;
            border-radius: 50%;
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
            color: #000000;
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
          padding: 10px;
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

        .news-section {
            text-align: center;
            padding: 50px 30px;
        }
        .news-section h1 {
            font-family: Garamond;
            font-size: 40px;
        }
        .news-section h1 {
            font-family: Garamond;
            font-size: 40px;
            background: linear-gradient(280deg, #000000, #8abff7, #061e89);
            background-size: 200% 200%;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: gradientAnimation 3s ease infinite;
            transition: background 2s;
        }

        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        .progress-container {
            width: 50%;
            height: 8px;
            background-color: #f1f1f1;
            border-radius: 5px;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 8px;
        }

        .progress-segment {
            height: 50%;
        }
        .blue {
             width: 35%; background-color: #4f6df5; 
            }
        .green {
             width: 35%; background-color: #2ec4a6; 
            }
        .yellow {
             width: 30%; background-color: #f5b800; 
        } 

        .news-cards {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 30px;
            padding: 15px;
        }
        .card {
            background: #fff;
            padding: 20px;
            width: 320px;
            border-radius: 10px;
            text-align: center;
            position: relative;
            transition: transform 0.3s ease-in-out;
            overflow: hidden;
            z-index: 1;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
        }
        .card img{
            width: 60%;
            height: auto;
            border-radius: 10px;
        }
        .card:hover {
            box-shadow: 0px 4px 15px rgba(86, 171, 241, 0.959);
            transform: scale3d(1.1, 1.1, 1.1);
        }
        .card p {
            font-size: 16px;
            color: #555;
            margin: 15px 0;
        }
        .read-more {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
            position: relative;
            padding: 10px;
        }
        .read-more::after {
            content: '→';
            position: relative;
            right: -10px;
            transition: right 0.3s ease-in-out;
        }
        .read-more:hover::after {
            right: -20px;
        }
        .knowmore {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .knowmore:hover {
            background-color: #0056b3;
            scale: 1.05;
            transition: background 0.3s ease-in-out;
        }
        .sponsors {
            overflow: hidden;
            background: #ffffff;
            padding: 20px 0;
            margin-top: 50px;
        }
        .sponsors img {
            width: 150px;
        }
        @keyframes scrollSponsors {
            0% { transform: translateX(100%); }
            50% { transform: translateX(-50%); }
            100% { transform: translateX(-100%); }
        }
        .f-heading {
            font-size: 2rem;
            text-align: center;
            margin-bottom: 20px;
            color: #000;
            background: linear-gradient(280deg, #000000, #8abff7, #061e89);
            background-size: 200% 200%;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: gradientAnimation 3s ease infinite;
        }
        

.wrapper {
  margin-top: 2rem;
  width: 90%;
  max-width: 1536px;
  margin-inline: auto;
  height: 100px;
  position: relative;
  overflow: hidden;
  mask-image: linear-gradient(
    to right,
    rgba(0, 0, 0, 0),
    rgba(0, 0, 0, 1) 20%,
    rgba(0, 0, 0, 1) 80%,
    rgba(0, 0, 0, 0)
  );
}

@keyframes scrollLeft {
  to {
    left: -200px;
  }
}

@keyframes scrollRight {
  to {
    right: -200px;
  }
}

.itemLeft,
.itemRight {
  width: 200px;
  height: 100px;
  border-radius: 6px;
  position: absolute;
  animation-timing-function: linear;
  animation-duration: 30s;
  animation-iteration-count: infinite;
}

.itemLeft {
  left: max(calc(200px * 8), 100%);
  animation-name: scrollLeft;
}


.item1 {
  animation-delay: calc(30s / 8 * (8 - 1) * -1);
}

.item2 {
  animation-delay: calc(30s / 8 * (8 - 2) * -1);
}

.item3 {
  animation-delay: calc(30s / 8 * (8 - 3) * -1);
}

.item4 {
  animation-delay: calc(30s / 8 * (8 - 4) * -1);
}

.item5 {
  animation-delay: calc(30s / 8 * (8 - 5) * -1);
}

.item6 {
  animation-delay: calc(30s / 8 * (8 - 6) * -1);
}

.item7 {
  animation-delay: calc(30s / 8 * (8 - 7) * -1);
}

.item8 {
  animation-delay: calc(30s / 8 * (8 - 8) * -1);
}

        @media (max-width: 768px) {
            .nav-tabs {
                display: none;
            }
            .nav-tabs.active {
                display: flex;
                flex-direction: column;
                position: absolute;
                top: 60px;
                right: 20px;
                background: rgb(216, 245, 255);
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
               /* padding: 15px; */
                border-radius: 6px;
                
            }
            .nav-tabs.active a {
                padding: 20px;
                display: block;
                color: #000;

            }
            .nav-tabs.active a:hover{
                background: linear-gradient(280deg, #122b9a, #235ebf, #4a90e2, #abd1fc, #003aae);
                transition: background 0.3s ease-in-out;
                color: #fff;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="logo">
           <img src="/stockcompsys/images/logoupdate.PNG" alt="logo">
            <h1>Latest News</h1>
     </div>
                
        <div class="icons">
            <img src="/stockcompsys/images/avatar.png" alt="Profile Picture" id="avatar" onclick="toggleProfile()">
        </div>
        <!-- Profile -->
     <div id="profileSidebar" class="sidebar">
        <div class="close-btn" onclick="toggleProfile()">&times;</div>
        <img src="/stockcompsys/images/avatar.png" alt="Profile Picture">
        <h3 class="profilename"><%=session.getAttribute("username")%>  <i class="fa-solid fa-edit" id="editname"></i></h3>

        <ul class="menu">

            <li onclick="toggleDropdown('productsDropdown')">
                <i class="fa-solid fa-box"></i> Navigate To
                <i class="fa-solid fa-chevron-down" style="margin-left:auto;"></i>
            </li>
            <ul class="submenu" id="productsDropdown">
                    <li onclick="location.href='communitychat.jsp'"><i class="fa-solid fa-user-group"></i>Community</li>
                    <li onclick="location.href='brokers.jsp'"><i class="fa-solid fa-handshake"></i>Brokers</li>
                    <li style="cursor: not-allowed; background-color: #4a90e2; color: white;"><i class="fa-solid fa-newspaper"></i>News</li>
                    <li onclick="location.href='homepage.jsp'"><i class="fa-solid home"></i>Home</li>
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
        </ul>
        
    </div>

        <!-- <span class="more-option" id="avatar">&#x22EE;</span>
        <div class="popover" id="popover">
            <a href="index.html"><button>Logout<i class="fa-duotone fa-solid fa-right-from-bracket"></i></button></a>
           <a><button>Help<i class="fa-regular fa-circle-question"></i></button></a>
        </div> -->
    </nav>
    <section class="news-section">
        <h1>We are in the news!</h1>
        <div style="display: flex; justify-content: center;">
        <div class="progress-container">
            <div class="progress-segment blue"></div>
            <div class="progress-segment green"></div>
            <div class="progress-segment yellow"></div>
        </div>
    </div>
        <div class="news-cards">
            <div class="card">
                <img src="/stockcompsys/images/news1.avif" alt="TechCrunch">
                <p>StockCompare raises $50M in funding.
                Recognized as a top innovator in fintech.
                Partnering with global leaders to expand services.</p>
                <a href="#" class="read-more">Read more</a>
            </div>
            <div class="card">
                <img src="/stockcompsys/images/news2.png" alt="Mint">
                <p>Expanding investment opportunities.
                Empowering users with data-driven insights.
                Transforming the way people compare stocks.</p>
                <a href="#" class="read-more">Read more</a>
            </div>
            <div class="card">
                <img src="/stockcompsys/images/news3.avif" alt="YourStory">
                <p>One of the fastest-growing stock comparison platforms.
                Providing users with cutting-edge tools to analyze and compare stocks.
                Featured in top financial publications for its innovative approach.</p>
                <a href="#" class="read-more">Read more</a>
            </div>
            </div>
            <div style="text-align: center; margin-top: 20px;">
                <button class="knowmore">
                    Know More
                </button>
        </div>
</div>    
</section>
    <section class="sponsors">
        <h1 class="f-heading">Our Sponsers</h1>
        <div class="wrapper">
            <img src="/stockcompsys/images/c1.svg" class="itemLeft item1" alt="sponsors" />
            <img src="/stockcompsys/images/c2.png" class="itemLeft item2" alt="sponsors" />
            <img src="/stockcompsys/images/c3.png" class="itemLeft item3" alt="sponsors" />
            <img src="/stockcompsys/images/c4.png" class="itemLeft item4" alt="sponsors" />
            <img src="/stockcompsys/images/c5.png" class="itemLeft item5" alt="sponsors" />
            <img src="/stockcompsys/images/c6.svg" class="itemLeft item6" alt="sponsors" />
            <img src="/stockcompsys/images/c9.svg" class="itemLeft item7" alt="sponsors" />
            <img src="/stockcompsys/images/c8.svg" class="itemLeft item8" alt="sponsors" />
          </div>
          
    </section>
    <script>
        //  // popover
        //  document.getElementById("avatar").addEventListener("click", function(event) {
        //     var popover = document.getElementById("popover");
        //     popover.style.display = popover.style.display === "block" ? "none" : "block";
        // });

        // document.addEventListener("click", function(event) {
        //     var popover = document.getElementById("popover");
        //     var avatar = document.getElementById("avatar");
        //     if (!avatar.contains(event.target) && !popover.contains(event.target)) {
        //         popover.style.display = "none";
        //     }
        // });


         // profile sidebar
function toggleProfile() {
    document.getElementById('profileSidebar').classList.toggle('active');
}

function addEditListener() {
    // edit name
    const editIcon = document.getElementById("editname");
    if (editIcon) {
        editIcon.addEventListener("click", function () {
            const profileNameElement = document.querySelector('.profilename');
            let currentName = profileNameElement.childNodes[0].nodeValue.trim();

            profileNameElement.innerHTML = `<input type="text" id="nameInput" value="${currentName}"> <i class="fa-solid fa-check" id="checkname"></i>`;
            
            document.getElementById("checkname").addEventListener("click", function () {
                const newName = document.getElementById("nameInput").value.trim();
                localStorage.setItem("profileName", newName);
                profileNameElement.innerHTML = `${newName} <i class="fa-solid fa-edit" id="editname"></i>`;
                                addEditListener();
            });
        });
    }
}

function toggleDropdown(id) {
    const allDropdowns = document.querySelectorAll('.submenu');

    allDropdowns.forEach(drop => {
        if (drop.id !== id) {
            drop.style.display = "none";  // Close others
        }
    });

    const current = document.getElementById(id);
    if (current.style.display === "block") {
        current.style.display = "none";
    } else {
        current.style.display = "block";
    }
}



// Load the profile name from localStorage on page load
window.addEventListener("DOMContentLoaded", function () {
    const storedName = localStorage.getItem("profileName");
    const profileNameElement = document.querySelector('.profilename');
    if (storedName) {
        profileNameElement.innerHTML = `${storedName} <i class="fa-solid fa-edit" id="editname"></i>`;
    }
    // Attach the edit listener
    addEditListener();
});
    </script>
</body>
</html>