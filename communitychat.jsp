<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://kit.fontawesome.com/3e13e2f9bf.js" crossorigin="anonymous"></script>    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Community Chat</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/fontawesome.min.css">
     <link rel="icon" href="/stockcompsys/images/SYMBOL.jpg" type="image/x-icon">
  
    <style>
        html{
            scroll-behavior: smooth;
        }
        body {
          font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            display: flex;
            flex-direction: column;
            height: 210vh;
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

        .input-container {
            display: flex;
     align-items: center;
            gap: 10px;
            padding: 10px;
            background: white;
        }
 .chat-container {
            flex: 3;
            display: flex;
            flex-direction: column;
            padding: 20px;
            background-image: url("/stockcompsys/images/snowfall_light_peach.gif");
         background-size: cover;
            overflow-y: auto;
            width: 400px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .messages {
            flex: 1;
            overflow-y: auto;
            padding-bottom: 10px;
            height: 300px;
            overflow-y: auto;
            border-bottom: 2px solid #ddd;
            padding-bottom: 10px;
            margin-bottom: 10px;
        }
        .message {
            display: flex;
            align-items: flex-start;
            background: #a7def7;
            padding: 10px 10px 2px;
            border-radius: 10px;
            border-bottom-right-radius: 0px;
            margin-bottom: 5px;
            position: relative;
        }
        .message img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }
        .message-content {
             display: flex;
            flex-direction: column;
            position: relative;
        }
        .sender {
            font-weight: bold;
              color: #007BFF;
        }
        .text{
            margin-top: 5px;
            position: relative;
        }
        .time {
            display: flex;
            justify-content: flex-end;
            font-size: 0.8em;
            color: gray;
            text-align: right;
            position: relative;
            top: -8px;
            left: 160px;
        }
        .input-container {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-top: 10px;
        }
        .input-container input[type="text"] {
            flex-grow: 1;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .input-container img {
            width: 40px;
            height: 40px;
            cursor: pointer;
        }
        .input-container img:hover {
            scale: 1.1;
            transition: scale 0.3s ease-in-out;
            transform: translateY(5);
        }
        .modal {
        display: none;
        position: fixed;
          z-index: 1000;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0,0,0,0.8);
        justify-content: center;
        align-items: center;
    }
    .modal-content {
        max-width: 90%;
        max-height: 90%;
    }
    .close {
        position: absolute;
        top: 10px;
        right: 20px;
        font-size: 30px;
        color: white;
        cursor: pointer;
    }
        .sidebar2 {
            flex: 1;
            background: #f8f9fa;
            padding: 20px;
            overflow-y: auto;
            border-left: 2px solid #ddd;
        }
        .review {
            background: white;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
     word-wrap: break-word; /* Ensures long words break */
    overflow-wrap: break-word;
    white-space: normal; /* Allows text to wrap */
    max-width: 100%; 
    padding: 10px;
    margin: 5px 0;
    border-radius: 5px;
}

.review p {
    margin: 5px 0;
    max-height: 100px; /* Limits height */
    overflow-y: auto; /* Adds scrollbar for long messages */
}

        
        .stars {
            color: gold;
        }
        /* Footer  */
        .footer {
            background: radial-gradient(circle, rgba(2,0,36,1) 0%, rgba(9,9,121,1) 0%, rgba(0,212,255,1) 200%);
            height: 100vh;
            padding: 40px;
            padding-bottom: 0px;
            color: #ffffff;
        }
        .row{
            display: flex;
            justify-content: space-between;
        }

        .sub-title{
     color: #ffffff;
     font-size: 55px;
     font-weight: 600;
}

.contact-left p{
    margin-top: 30px;
}
.contact-left p i{
    color: #94a7ff;
    margin-right: 15px;
    font-size: 25px;
}
.contact-left{
    width: 50%;
    margin-left: 15vh;
    margin-right: 10vh;
}
.social-icons{
    margin-top: 30px;
}
.social-icons a{
    text-decoration: none;
    font-size: 30px;
    margin-right: 15px;
color: #4363f3;
    transition: transform 0.5s;

}
.social-icons i:hover {
    color: #96a9ff;
    transform: translateY(-5px);
    transform: translateY(-5px) scale(1.1);
    transition: transform 0.3s ease-in-out;
}
.btn.btn2{
    display: inline-block;
    background: #334fcd ;
}
form input, form textarea{
    width: 80%;
    border: 0;
    outline: 0;
    background: #a8b1d1;
    padding: 15px;
    margin: 15px 0;
    color: #011662;
    font-size: 18px;
    border-radius: 6px;
}
form .btn2{
    background-color: #011662;
    color: #ffffff;
    padding: 14px 60px;
    font-size: 18px;
margin-top: 20px;
cursor: pointer;
border: 0;
outline: 0;
border-radius: 10px;
}
#scrollToTop {
position: fixed; 
bottom: 20px; 
right: 20px; 
width: 50px; 
height: 50px; 
border-radius: 50%; 
background-color: #007BFF; 
color: white;
 border: none; 
display: none; 
justify-content: center; 
align-items: center; 
cursor: pointer; 
box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
transition: background-color 0.3s ease;
box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
animation: rotate-shadow 2s infinite linear;
}
@keyframes rotate-shadow {
    0% {
        box-shadow: 0 0 10px rgba(141, 198, 255, 0.637);
    }
    25% {
        box-shadow: 10px 0 10px rgba(141, 198, 255, 0.637);
    }
    50% {
        box-shadow: 0 10px 10px rgba(141, 198, 255, 0.637);
    }
    75% {
        box-shadow: -10px 0 10px rgba(141, 198, 255, 0.637);
    }
    100% {
        box-shadow: 0 0 10px rgba(141, 198, 255, 0.637);
    }
}
        #scrollToTop:hover {
    background-color: #c0defd; 
    color: #007BFF;
    transform: scale(1.1); 
    transition: transform 0.3s ease-in-out;
}
/* body {
  --text-color: #222;
  --bkg-color: #fff;
}
body.dark-theme {
  --text-color: #eee;
  --bkg-color: #121212;
}

@media (prefers-color-scheme: dark) {
  /* defaults to dark theme */
  /* body {
    --text-color: #eee;
    --bkg-color: #121212;
  }
  body.light-theme {
    --text-color: #222;
    --bkg-color: #fff;
  }


* {
  font-family: Arial, Helvetica, sans-serif;
}

body {
  background: var(--bkg-color);
}

h1,
p {
  color: var(--text-color);
}  */
#loading-screen {
    position: fixed;
    width: 100%;
    height: 100%;
    backdrop-filter: blur(20px);
    -webkit-backdrop-filter: blur(15px); 
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    z-index: 9999;
}
@media (max-width: 768px) {
    body{
        height: 250vh;
    }
    .footer{
        height: 140vh;
    }
    .footer .row {
        flex-direction: column;
        align-items: center;
    }

    .contact-left, .contact-right {
        width: 100%;
        margin: 0;
        text-align: center;
    }

    .contact-left p {
        margin-top: 20px;
    }

    .social-icons {
        justify-content: center;
    }

    form input, form textarea {
        width: 90%;
    }

    form .btn2 {
        width: 30%;
    }
}

    </style>
</head>
<body>
    <div id="loading-screen">
        <img src="/stockcompsys/images/rupee.gif" alt="Loading..." height="20%"/>
        <p>Loading...</p>
    </div>
    
    <div class="navbar">
        <div class="logo">
            <a href="#"><img src="/stockcompsys/images/logoupdate.PNG" alt="logo"></a>
            <h1>Community</h1>
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
    <div class="main-content">
        <div class="chat-container">
            <div class="messages" id="messages"></div>
            <div class="input-container">
                <input type="file" id="imageInput" accept="image/*" style="display: none;">
                <img src="/stockcompsys/images/plus.png" alt="Upload" id="imageUploadBtn">
                <input type="text" id="messageInput" placeholder="Type a message...">
                <img src="/stockcompsys/images/send.png" alt="Send" onclick="sendMessage()">
            </div>
        </div>

        
        
        <!-- Modal for displaying images -->
        <div id="imageModal" class="modal">
            <span class="close" onclick="closeModal()">&times;</span>
            <img class="modal-content" id="modalImage">
        </div>

        <!-- sidebar -->
        <div class="sidebar2" id="sidebar">
            <div class="review">
                <p><strong>Thale</strong></p>
                <p>Great platform! Love the community.</p>
                <p class="stars">★★★★★</p>
            </div>
            <div class="review">
                <p><strong>john doe</strong></p>
                <p>Very helpful discussions.</p>
                <p class="stars">★★★★☆</p>
            </div>
        </div>
    </div>

        <div  class="footer" id="contact">
            <div class="container">
                <div class="row">
                    <div class="contact-left">
                        <h1 class="sub-title">Feedback</h1>
                        <p>Your feedback helps us assist you better!<br> Keep sharing your thoughts and keep learning and improving with INSTOCK!</p>
                        <p><i class="fa-solid fa-paper-plane"></i>contact@example.com</p>
                        <p><i class="fa-solid fa-square-phone"></i>0123456789</p>
                        <div class="social-icons">
                           <a href="#"> <i class="fa-brands fa-facebook"></i> </a>
                           <a href="#"> <i class="fa-brands fa-twitter"></i> </a>
                           <a href="#"> <i class="fa-brands fa-linkedin"></i> </a>
                           <a href="#"> <i class="fa-brands fa-instagram"></i> </a>
                        </div>
                    </div>
                    <button id="scrollToTop" alt="Scroll to Top">
                        <i class="fa-solid fa-arrow-up"></i>
                    </button>

                    <script>
                        const scrollToTopButton = document.getElementById("scrollToTop");

                        window.addEventListener("scroll", () => {
                            if (window.scrollY > 300) {
                                scrollToTopButton.style.display = "flex";
                            } else {
                                scrollToTopButton.style.display = "none";
                            }
                        });

                        scrollToTopButton.addEventListener("click", () => {
                            window.scrollTo({ top: 0, behavior: "smooth" });
                        });
                    </script>
                    <div class="contact-right">
                        <form name="submit-to-google-sheet">
                            <input type="text" name="Name" placeholder="Your Name" required>
                            <input type="email" name="Email" placeholder="Your Emal" required>
                            <textarea name="Message" rows="6" placeholder="Your message..."></textarea>
                            <button class=" btn btn2" type="submit" >Submit</button>
                            
                        </form>
                    </div>
                </div>
            </div>
           </div>
    
    <!----------------------- SCRIPT ------------------------>

    <script>

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
                profileNameElement.innerHTML =` ${newName} <i class="fa-solid fa-edit" id="editname"></i>`;
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


        // Open modal
        document.getElementById("imageUploadBtn").addEventListener("click", function () {
            document.getElementById("imageInput").click();
        });

        function sendMessage() {
            var input = document.getElementById("messageInput");
            var messageText = input.value.trim();
            var imageInput = document.getElementById("imageInput");
            var imageFile = imageInput.files[0];
            var currentTime = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
            
            if (messageText === "" && !imageFile) return;

            var messagesContainer = document.getElementById("messages");
            var messageElement = document.createElement("div");
            messageElement.classList.add("message");
            
            var avatar = document.createElement("img");
            avatar.src = "/stockcompsys/images/avatar.png"; // Default placeholder avatar
            
            var content = document.createElement("div");
            content.classList.add("message-content");
            
            var senderElement = document.createElement("div");
            senderElement.classList.add("sender");
            var currentname="<%=session.getAttribute("username")%>";
            senderElement.textContent = currentname||"users";
            
            var textElement = document.createElement("div");
            textElement.classList.add("text");
            textElement.textContent = messageText;
            
            var timeElement = document.createElement("div");
            timeElement.classList.add("time");
            timeElement.textContent = currentTime;
            
            // Append elements to the message container
            content.appendChild(senderElement);
            if (messageText !== "") content.appendChild(textElement);

            // Display image if uploaded
            if (imageFile) {
    var imageElement = document.createElement("img");
    imageElement.src = URL.createObjectURL(imageFile);
    imageElement.style.maxWidth = "100%";  //image doesn't go out of the container
    imageElement.style.borderRadius = "5px";
    imageElement.style.cursor = "pointer";

    // Open image in modal when clicked
    imageElement.onclick = function () {
        document.getElementById("modalImage").src = imageElement.src;
        document.getElementById("imageModal").style.display = "flex";
    };
 
    content.appendChild(imageElement);
}
document.querySelector(".close").addEventListener("click", function() {
        document.getElementById("imageModal").style.display = "none";
    });

    document.getElementById("imageModal").addEventListener("click", function(event) {
        if (event.target === this) {  
            this.style.display = "none";
        }
    });
            content.appendChild(timeElement);
            
            messageElement.appendChild(avatar);
            messageElement.appendChild(content);
            messagesContainer.appendChild(messageElement);
            messagesContainer.scrollTop = messagesContainer.scrollHeight;
            
            // Clear input fields
            input.value = "";
            imageInput.value = "";
        }
</script>


<script> 
    document.addEventListener("DOMContentLoaded", function () {
        loadFeedback(); // Load stored feedback on page load
    });

    document.querySelector("form[name='submit-to-google-sheet']").addEventListener("submit", function(event) {
        event.preventDefault(); // Prevent default form submission
        
        var name = this.Name.value;
        var message = this.Message.value;
        
        if (name.trim() === "" || message.trim() === "") {
            alert("Please fill in all fields before submitting.");
            return;
        }

        var review = {
            name: name,
            message: message,
            stars: "★★★★★" // Default 5 stars
        };

        saveFeedback(review);
        addReviewToUI(review);
        
        this.reset(); // Reset form after submission
        alert("Thank you for your feedback!");
    });

    function saveFeedback(review) {
        let feedbackList = JSON.parse(localStorage.getItem("feedback")) || [];
        feedbackList.push(review);
        localStorage.setItem("feedback", JSON.stringify(feedbackList));
    }

    function loadFeedback() {
        let feedbackList = JSON.parse(localStorage.getItem("feedback")) || [];
        feedbackList.forEach(addReviewToUI);
    }

    function addReviewToUI(review) {
        var reviewSection = document.getElementById("sidebar");
        var reviewDiv = document.createElement("div");
        reviewDiv.classList.add("review");

        var namePara = document.createElement("p");
        namePara.innerHTML = "<strong>" + review.name + "</strong>";

        var messagePara = document.createElement("p");
        messagePara.textContent = review.message;

        var starsPara = document.createElement("p");
        starsPara.classList.add("stars");
        starsPara.textContent = review.stars;

        reviewDiv.appendChild(namePara);
        reviewDiv.appendChild(messagePara);
        reviewDiv.appendChild(starsPara);

        reviewSection.appendChild(reviewDiv);
    }
</script>




        <!-- //FEEDBACK FORM -->
        <script>
    document.querySelector("form[name='submit-to-google-sheet']").addEventListener("submit", function(event) {
        event.preventDefault(); // Prevent default form submission
        
        var name = this.Name.value;
        var message = this.Message.value;
        
        if (name.trim() === "" || message.trim() === "") {
            return;
        }
        
        var reviewSection = document.getElementById("sidebar");
        var reviewDiv = document.createElement("div");
        reviewDiv.classList.add("review");
        
        var namePara = document.createElement("p");
        namePara.innerHTML = "<strong>" + name + "</strong>";
        
        var messagePara = document.createElement("p");
        messagePara.textContent = message;
        
        var starsPara = document.createElement("p");
        starsPara.classList.add("stars");
        starsPara.textContent = "★★★★★"; // Default 5 stars
        
        reviewDiv.appendChild(namePara);
        reviewDiv.appendChild(messagePara);
        reviewDiv.appendChild(starsPara);
        
        reviewSection.appendChild(reviewDiv);
        
        this.reset(); // Reset form after submission
        alert("Thank you for your feedback!");


    });

    
</script>

        <!-- // Dark mode toggle
//         const btn = document.querySelector(".btn-toggle");
// const prefersDarkScheme = window.matchMedia("(prefers-color-scheme: dark)");

// const currentTheme = localStorage.getItem("theme");
// if (currentTheme == "dark") {
//   document.body.classList.toggle("dark-theme");
// } else if (currentTheme == "light") {
//   document.body.classList.toggle("light-theme");
// }

// btn.addEventListener("click", function () {
//   if (prefersDarkScheme.matches) {
//     document.body.classList.toggle("light-theme");
//     var theme = document.body.classList.contains("light-theme")
//       ? "light"
//       : "dark";
//   } else {
//     document.body.classList.toggle("dark-theme");
//     var theme = document.body.classList.contains("dark-theme")
//       ? "dark"
//       : "light";
//   }
//   localStorage.setItem("theme", theme);
// }); -->
    </script> 
    <!-- Laoding -->
    <script>
        window.onload = function () {
            setTimeout(() => {
                document.getElementById("loading-screen").style.display = "none";
            }, 3000); // 3000ms = 3 seconds
        };

        // popover
                // Save feedbacks and messages to localStorage
       

        // Load messages from localStorage
        window.onload = function () {
            setTimeout(() => {
                document.getElementById("loading-screen").style.display = "none";
            }, 3000); // 3000ms = 3 seconds

            // Load messages
            const savedMessages = loadFromLocalStorage("messages");
            const messagesContainer = document.getElementById("messages");
            savedMessages.forEach(message => {
                const messageElement = document.createElement("div");
                messageElement.classList.add("message");

                const avatar = document.createElement("img");
                avatar.src = "/stockcompsys/images/avatar.png";

                const content = document.createElement("div");
                content.classList.add("message-content");

                const senderElement = document.createElement("div");
                senderElement.classList.add("sender");
                senderElement.textContent = "<%=session.getAttribute("username") %>";

                const textElement = document.createElement("div");
                textElement.classList.add("text");
                textElement.textContent = message.text;

                const timeElement = document.createElement("div");
                timeElement.classList.add("time");
                timeElement.textContent = message.time;

                content.appendChild(senderElement);
                if (message.text) content.appendChild(textElement);

                if (message.image) {
                    const imageElement = document.createElement("img");
                    imageElement.src = message.image;
                    imageElement.style.maxWidth = "100%";
                    imageElement.style.borderRadius = "5px";
                    imageElement.style.cursor = "pointer";

                    imageElement.onclick = function () {
                        document.getElementById("modalImage").src = imageElement.src;
                        document.getElementById("imageModal").style.display = "flex";
                    };

                    content.appendChild(imageElement);
                }

                content.appendChild(timeElement);
                messageElement.appendChild(avatar);
                messageElement.appendChild(content);
                messagesContainer.appendChild(messageElement);
            });

        };

        // Modify sendMessage to save messages
        function sendMessage() {
            var input = document.getElementById("messageInput");
            var messageText = input.value.trim();
            var imageInput = document.getElementById("imageInput");
            var imageFile = imageInput.files[0];
            var currentTime = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });

            if (messageText === "" && !imageFile) return;

            var messagesContainer = document.getElementById("messages");
            var messageElement = document.createElement("div");
            messageElement.classList.add("message");

            var avatar = document.createElement("img");
            avatar.src = "/stockcompsys/images/avatar.png";

            var content = document.createElement("div");
            content.classList.add("message-content");

            var senderElement = document.createElement("div");
            senderElement.classList.add("sender");
            senderElement.textContent = "<%=session.getAttribute("username") %>";

            var textElement = document.createElement("div");
            textElement.classList.add("text");
            textElement.textContent = messageText;

            var timeElement = document.createElement("div");
            timeElement.classList.add("time");
            timeElement.textContent = currentTime;

            content.appendChild(senderElement);
            if (messageText !== "") content.appendChild(textElement);

            if (imageFile) {
                var imageElement = document.createElement("img");
                imageElement.src = URL.createObjectURL(imageFile);
                imageElement.style.maxWidth = "100%";
                imageElement.style.borderRadius = "5px";
                imageElement.style.cursor = "pointer";

                imageElement.onclick = function () {
                    document.getElementById("modalImage").src = imageElement.src;
                    document.getElementById("imageModal").style.display = "flex";
                };

                content.appendChild(imageElement);
            }

            content.appendChild(timeElement);
            messageElement.appendChild(avatar);
            messageElement.appendChild(content);
            messagesContainer.appendChild(messageElement);
            messagesContainer.scrollTop = messagesContainer.scrollHeight;

            const savedMessages = loadFromLocalStorage("messages");
            savedMessages.push({
                text: messageText,
                time: currentTime,
                image: imageFile ? URL.createObjectURL(imageFile) : null
            });
            saveToLocalStorage("messages", savedMessages);

            input.value = "";
            imageInput.value = "";
        }

        
    </script>
    
</body>
</html>