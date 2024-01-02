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

// Greedy Algorithm

class IncomeStatementEntry
{
    public $is_id;
    public $revenue;
    public $cost_of_goods_sold;
    public $operating_expenses;
    public $other_expenses;
    public $taxes;
    public $createdBY;
    public $fi_id;
    public $net_income;

    public function __construct($row)
    {
        $this->is_id = $row['is_id'];
        $this->revenue = $row['revenue'];
        $this->cost_of_goods_sold = $row['cost_of_goods_sold'];
        $this->operating_expenses = $row['operating_expenses'];
        $this->other_expenses = $row['other_expenses'];
        $this->taxes = $row['taxes'];
        $this->createdBY = $row['createdBY'];
        $this->fi_id = $row['fi_id'];
        $this->net_income = $this->calculateNetIncome();
    }

    private function calculateNetIncome()
    {
        return $this->revenue - ($this->cost_of_goods_sold + $this->operating_expenses + $this->other_expenses + $this->taxes);
    }
}

function maximizeNetIncome($conn)
{
    $entries = [];

    // Fetch entries from the income_statement table
    $sql = "SELECT * FROM income_statement ";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $entries[] = new IncomeStatementEntry($row);
        }
    }

    return $entries;
}

// Example usage:
$selectedEntries = maximizeNetIncome($conn);



class CashflowEntry
{
    public $cf_id;
    public $description;
    public $investment;
    public $cash_flow_type;
    public $category;
    public $adminCreator;
    public $tax_category;
    public $notes;
    public $created_at;
    public $inc_ID;
    public $f_id;
    public $net_income;

    public function __construct($row)
    {
        $this->cf_id = $row['cf_id'];
        $this->description = $row['description'];
        $this->investment = $row['investment'];
        $this->cash_flow_type = $row['cash_flow_type'];
        $this->category = $row['category'];
        $this->adminCreator = $row['adminCreator'];
        $this->tax_category = $row['tax_category'];
        $this->notes = $row['notes'];
        $this->created_at = $row['created_at'];
        $this->inc_ID = $row['inc_ID'];
        $this->f_id = $row['f_id'];
        $this->net_income = $this->calculateNetIncome();
    }

    private function calculateNetIncome()
    {
        // Calculate net income based on the cash flow type
        switch ($this->cash_flow_type) {
            case 'Operating':
                return $this->investment;
            case 'Investing':
                return -$this->investment;
            case 'Financing':
                return 0; // Assuming financing activities have no impact on net income in this example
            default:
                return 0;
        }
    }
}

function maximizeNetIncome1($conn)
{
    $entries = [];

    // Fetch entries from the cashflow table
    $sql = "SELECT * FROM cashflow ";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $entries[] = new CashflowEntry($row);
        }
    }

    return $entries;
}

// Example usage:
$cashFlow = maximizeNetIncome1($conn);



class Project
{
    public $projectID;
    public $projectName;
    public $projectDescription;
    public $projectPrice;
    public $createdBY;

    public function __construct($row)
    {
        $this->projectID = $row['projectID'];
        $this->projectName = $row['projectName'];
        $this->projectDescription = $row['projectDescription'];
        $this->projectPrice = $row['projectPrice'];
        $this->createdBY = $row['createdBY'];
    }
}

function maximizeTotalProjectPrice($conn, $budget)
{
    $projects = [];

    // Fetch projects from the projects table
    $sql = "SELECT * FROM projects ORDER BY projectPrice DESC";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $projects[] = new Project($row);
        }
    }

    $selectedProjects = [];
    $totalPrice = 0;

    foreach ($projects as $project) {
        // Check if adding the project stays within budget
        if (($totalPrice + $project->projectPrice) <= $budget) {
            $selectedProjects[] = $project;
            $totalPrice += $project->projectPrice;
        }
    }

    return ['selectedProjects' => $selectedProjects, 'totalPrice' => $totalPrice];
}

// Example usage with a budget of 15000
$result = maximizeTotalProjectPrice($conn, 15000);
$selectedProjects = $result['selectedProjects'];
$totalPrice = $result['totalPrice'];



class Client
{
    public $clientID;
    public $clientFullName;
    public $clientContact;
    public $clientEmail;
    public $clientAddress;
    public $clientAge;

    public function __construct($row)
    {
        $this->clientID = $row['clientID'];
        $this->clientFullName = $row['clientFullName'];
        $this->clientContact = $row['clientContact'];
        $this->clientEmail = $row['clientEmail'];
        $this->clientAddress = $row['clientAddress'];
        $this->clientAge = $row['clientAge'];
    }
}

function maximizeTotalAge($conn, $budget)
{
    $clients = [];

    // Fetch clients from the clients table
    $sql = "SELECT * FROM clients ORDER BY clientAge DESC";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $clients[] = new Client($row);
        }
    }

    $selectedClients = [];
    $totalAge = 0;

    foreach ($clients as $client) {
        // Check if adding the client stays within budget
        if (($totalAge + $client->clientAge) <= $budget) {
            $selectedClients[] = $client;
            $totalAge += $client->clientAge;
        }
    }

    return ['selectedClients' => $selectedClients, 'totalAge' => $totalAge];
}

// Example usage with a budget of 150
$result = maximizeTotalAge($conn, 150);
$selectedClients = $result['selectedClients'];
$totalAge = $result['totalAge'];






?>