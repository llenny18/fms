<title>MGS Integrated Management System</title>

<?php 
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "financial";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

function incomes($conn){
$sql = "SELECT * FROM `income_statement`";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo '<tr>	<td scope="row">'.$row["is_id"].'</td>
            <td scope="row">'.$row["revenue"].'</td>
            <td scope="row">'.$row["cost_of_goods_sold"].'</td>
            <td scope="row">'.$row["operating_expenses"].'</td>
            <td scope="row">'.$row["other_expenses"].'</td>
            <td scope="row">'.$row["taxes"].'</td>
            <td scope="row">'.$row["fi_id"].'</td>
            <td><a href="http://" style="background-color: green; color: #ffffff; padding: 7px; border-radius: 5px;">Edit</a></td>
            </tr>';
  }
} else {
  echo "0 results";
}
}
function cashflows($conn){
$sql = "SELECT * FROM `cashflow`";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo '	<tr><td scope="row">'.$row["cf_id"].'</td>
            <td scope="row">'.$row["description"].'</td>
            <td scope="row">'.$row["investment"].'</td>
            <td scope="row">'.$row["cash_flow_type"].'</td>
            <td scope="row">'.$row["category"].'</td>
            <td scope="row">'.$row["tax_category"].'</td>
            <td scope="row">'.$row["notes"].'</td>
            <td scope="row">'.$row["created_at"].'</td>
            <td scope="row">'.$row["inc_ID"].'</td>
            <td scope="row">'.$row["f_id"].'</td>
            <td><a href="http://" style="background-color: green; color: #ffffff; padding: 7px; border-radius: 5px;">Edit</a></td>
  </tr>';
  }
} else {
  echo "0 results";
}
}



function clients($conn){
$sql = "SELECT * FROM `client_view`";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo '<tr>	<td scope="row">'.$row["clientID"].'</td>
            <td scope="row">'.$row["clientFullName"].'</td>
            <td scope="row">'.$row["clientContact"].'</td>
            <td scope="row">'.$row["clientEmail"].'</td>
            <td scope="row">'.$row["clientAddress"].'</td>
            <td scope="row">'.$row["clientAge"].' years old</td>
            
            <td><a href="http://" style="background-color: green; color: #ffffff; padding: 7px; border-radius: 5px;">Edit</a></td>
  </tr>';
  }
} else {
  echo "0 results";
}
}


function projects($conn){
$sql = "SELECT * FROM `projects`";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo '<tr>	<td scope="row">'.$row["projectID"].'</td>
            <td scope="row">'.$row["projectName"].'</td>
            <td scope="row">'.$row["projectDescription"].'</td>
            <td scope="row">'.$row["projectPrice"].'</td>
            
            <td><a href="http://" style="background-color: green; color: #ffffff; padding: 7px; border-radius: 5px;">Edit</a></td>
  </tr>';
  }
} else {
  echo "0 results";
}
}



?>