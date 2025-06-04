<%@page isELIgnored="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Graph</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link rel="icon" href="/stockcompsys/images/SYMBOL.jpg" type="image/x-icon">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <style>
    .container {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      padding: 20px;
      max-width: 1200px;
      margin: auto;
    }
    .text-section {
      width: 35%;
      height: 500px;
      padding: 20px;
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      font-weight: 600;
      font-size: large;
    }
    .text-section h1 {
      font-family: Georgia, 'Times New Roman', Times, serif;
      color: #2d30f0;
    }
    .text-section span {
      font-weight: bold;
    }
    .graph-section {
      width: 65%;
      height: 500px;
      padding: 20px;
      display: flex;
      justify-content: center;
      align-items: center;
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    canvas {
      max-width: 100%;
      width: 700px;
      height: 300px;
      background: white;
      border-radius: 8px;
      padding: 10px;
      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3);
    }
    .comparison-container {
      text-align: center;
      max-width: 1300px;
      margin: auto;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
      background-color: white;
    }
    .comparison-table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }
    th, td {
      padding: 12px;
      border-bottom: 1px solid #ddd;
      text-align: center;
    }
    th {
      font-size: 1.5rem;
      font-weight: bold;
      color: #2d30f0;
    }
    .param {
      font-weight: bold;
      text-align: left;
      padding-left: 20px;
      color: #2d30f0;
    }
    @media (max-width: 768px) {
      .container {
        flex-direction: column;
        gap: 20px;
      }
      .text-section, .graph-section {
        width: 100%;
      }
    }
     .navbar {
            display: flex;
            justify-content: space-;
            align-items: center;
            background: radial-gradient(circle, rgba(2,0,36,1) 0%, rgba(9,9,121,1) 0%, rgba(0,212,255,1) 200%);
            color: white;
            padding: 8px 20px;
        }
        
    .navbar img{
    border-radius:50%
    }
  </style>
</head>
<body>
  <div class="navbar">
    <div><img src="/stockcompsys/images/logoupdate.PNG" alt="logo" width="70px" height="50px"></div>
    <div><h1>Comparison </h1></div>
  </div>

  <div class="container">
    <div class="text-section">
      <h1>Welcome to Instocks</h1>
      <p>
        Welcome to Instocks, the ultimate destination for stock market enthusiasts and investors seeking clarity in complexity. Instocks isn't just a website; it's your trusted partner on the path to smarter investment decisions. Whether you’re a seasoned trader or a curious beginner, Instocks equips you with the tools, data, and insights to navigate the ever-changing financial landscape with confidence.
            <span >Your Journey Begins Here</span>  
        At Instocks.
      </p>
    </div>
    <div class="graph-section">
      <canvas id="myGraph"></canvas>
    </div>
  </div>

  <div class="comparison-container">
    <h1>Company Comparison</h1>
    <table class="comparison-table">
      <tr>
        <th></th>
        <th id="company1"></th>
        <th id="company2"></th>
      </tr>
      <tr><td class="param">Market Capitalization:</td><td id="market1"></td><td id="market2"></td></tr>
      <tr><td class="param">EBITDA:</td><td id="ed1"></td><td id="ed2"></td></tr>
      <tr><td class="param">PE Ratio:</td><td id="pe1"></td><td id="pe2"></td></tr>
      <tr><td class="param">Dividend Yield:</td><td id="dpy1"></td><td id="dpy2"></td></tr>
      <tr><td class="param">Dividend Per Share:</td><td id="dps1"></td><td id="dps2"></td></tr>
      <tr><td class="param">Equity Per Share:</td><td id="eps1"></td><td id="eps2"></td></tr>
    </table>
  </div>

  <script>
    let urlParams = new URLSearchParams(window.location.search);
    let receivedData = urlParams.get("tickerarr");
    console.log("Received Data: " + receivedData);
    let selectedStocks = [];
    let alldates=[];
    let avg1=[];
    let avg2=[];
    let avg=[];
    let dates=[];

    if (receivedData) {
      receivedData = receivedData.split(',');
    } else {
      receivedData = [];
    }

    const label1 = receivedData[1] || "Company 1";
    const label2 = receivedData[4] || "Company 2";

        // Fetch and display data
    if (receivedData.length > 0) {
      (async () => {
    await displaygraph(receivedData[0], 1, receivedData[2]); // stock 1
    await displaygraph(receivedData[3], 2, receivedData[5]); // stock 2
        avg.push(avg1,avg2);
    await selectStock(receivedData[0], 1);
    await selectStock(receivedData[3], 2);

    createChart(); // ✅ This now runs after data is ready
  })();
    }

    async function displaygraph(ticker, index,type) {
      try{
        let response="";
        let url="";
        let timeSeries="";
        let data="";
        if(Number(type)===1)
        {
          url=`https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=${ticker}&outputsize=full&apikey=L2JMUJMZVDPYPNYG`;
          console.log(url);
          response=await fetch(url);
          if(response.ok)
          {
              data=await response.json();
                console.log("Data:"+data);
                console.log(response);
                timeSeries=data["Time Series (Daily)"];
                console.log("Timeseries: "+JSON.stringify(timeSeries,null, 2));
          }
        }
        else{
          url=`https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=${ticker}&interval=5min&apikey=L2JMUJMZVDPYPNYG`;
          console.log(url);  
          response=await fetch(url);
          if(response.ok)
          {
          data=await response.json();
          console.log("Data: ",data);
                console.log(response);
                timeSeries=data["Time Series (5min)"];
                console.log("Timeseries: "+JSON.stringify(timeSeries,null, 2));
          }
        }
        if(response.ok)
          {
                
                
                dates=Object.keys(timeSeries).slice(0, 10).reverse(); // Get the last 10 dates
                console.log("TimeSeries dates: "+dates);

                dates.forEach((date)=>{
                  const values=timeSeries[date];
                  console.log("Values: ",values);
                  
                  const highKey = Object.keys(values).find(key => key.toLowerCase().includes("high"));
                  const lowKey = Object.keys(values).find(key => key.toLowerCase().includes("low"));



                  const high = parseFloat(values[highKey]);
                  const low = parseFloat(values[lowKey]);
                  console.log("High: ",high);
                  console.log(" Low: ",low);
                  if(index===1)
                {
                  avg1.push((high+low)/2);
                  console.log("Avg1 :"+avg1);
                }
                else if(index===2)
                {
                  avg2.push((high+low)/2);
                  console.log(alldates);
                  console.log("Avg2 :"+avg2);
                }
                console.log(alldates);
                }
                
              );
              

          }
          else
          {
            console.error("Stock data not found for ticker:", receivedData[0]);
            alert("Stock data not found."); 
          }

      }
      catch(error) {
        console.error("Error fetching stock data:", error);
      }
    }

    // Setup Chart.js graph
    function createChart()
    { 
    const ctx = document.getElementById('myGraph').getContext('2d');

    const fallbackdates = ["16-04-25", "17-04-25", "18-04-25", "19-04-25", "20-04-25","21-04-25","22-04-25","23-04-25","24-04-25","25-04-25"];
    const fallbackavg1 = [125.3, 119.6, 173.9, 189.5, 193.2,125.3, 119.6, 173.9, 189.5, 193.2];
    const fallbackavg2 = [165.5, 159.7, 186.4, 110.7, 196.7,165.5, 159.7, 186.4, 110.7, 196.7];
    const finalavg1 = avg1.length ? avg1 : fallbackavg1;
    const finaldates=dates.length? dates:fallbackdates;
    const finalavg2 = avg2.length ? avg2 : fallbackavg2;

    const comparisonChart = new Chart(ctx, {
      type: 'line',
      data: {
        labels: finaldates,
        datasets: [
          {
            label: label1,
            data: finalavg1, // Placeholder values
            borderColor: 'rgba(255, 99, 132, 1)',
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            borderWidth: 2,
            fill: true
          },
          {
            label: label2,
            data: finalavg2, // Placeholder values
            borderColor: 'rgba(54, 162, 235, 1)',
            backgroundColor: 'rgba(54, 162, 235, 0.2)',
            borderWidth: 2,
            fill: true
          }
        ]
      },
      options: {
        responsive: true,
        scales: {
          y: { beginAtZero: true }
        }
      }
    });
  }
    document.getElementById("company1").textContent = label1;
    document.getElementById("company2").textContent = label2;
  
  
    async function selectStock(ticker, index) {
      try {
        const response = await fetch(`https://www.alphavantage.co/query?function=OVERVIEW&symbol=${ticker}&apikey=L2JMUJMZVDPYPNYG`);
        if (response.ok) {
          const data = await response.json();
          selectedStocks.push(data);
          console.log(data);
          displayPara(data, index);
        } else {
          console.error("Stock data not found for ticker:", ticker);
          alert("Stock data not found.");
        }
      } catch (error) {
        console.error("Error fetching stock data:", error);
      }
    }

    function displayPara(data, index) 
    {
      document.getElementById(`market${index}`).textContent = formatNum(data.MarketCapitalization);
      document.getElementById(`ed${index}`).textContent = formatNum(data.EBITDA);
      document.getElementById(`pe${index}`).textContent = data.PERatio || "29.6";
      document.getElementById(`dps${index}`).textContent = data.DividendPerShare || "3.16";
      document.getElementById(`dpy${index}`).textContent = data.DividendYield || "0.0091";
      document.getElementById(`eps${index}`).textContent = data.EPS || "12.65";
    }

    function formatNum(value) {
      return value ? Number(value).toLocaleString() : "N/A";
    }
  </script>

  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>