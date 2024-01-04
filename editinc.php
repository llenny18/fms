<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="Chameleon Admin is a modern Bootstrap 4 webapp &amp; admin dashboard html template with a large number of components, elegant design, clean and organized code.">
    <meta name="keywords" content="admin template, Chameleon admin template, dashboard template, gradient admin template, responsive admin template, webapp, eCommerce dashboard, analytic dashboard">
    <meta name="author" content="ThemeSelect">
    <?php  include("./title.php");
    
    
class IncomeStatementz
{
    public $is_id;
    public $revenue;
    public $cost_of_goods_sold;
    public $operating_expenses;
    public $other_expenses;
    public $taxes;
    public $createdBY;
    public $fi_id;

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
    }
}

function getIncomeStatementById($conn, $is_id)
{
    $incomeStatements = [];

    $sql = "SELECT * FROM income_statement WHERE is_id = 1";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $incomeStatements[] = new IncomeStatementz($row);
        }
    }

    return $incomeStatements;
}

// Example usage with a specific is_id (replace with your desired is_id)
$is_id = $_GET['incid'];
$selectedIncomeStatements = getIncomeStatementById($conn, $is_id);

if(isset($_POST['incupdate'])){


// Example data for the update
$is_idToUpdate = $_POST['incid'];  // Replace with the specific is_id you want to update
$newRevenue = $_POST['increvenue'];
$newCostOfGoodsSold = $_POST['inccogs'];
$newOperatingExpenses = $_POST['incoex'];
$newOtherExpenses = $_POST['incother'];
$newFiID = $_POST['incfid'];

// SQL update query
$sql = "UPDATE income_statement 
        SET revenue = $newRevenue, 
            cost_of_goods_sold = $newCostOfGoodsSold, 
            operating_expenses = $newOperatingExpenses, 
            other_expenses = $newOtherExpenses, 
            fi_id = '$newFiID'
        WHERE is_id = $is_idToUpdate";

if ($conn->query($sql) === TRUE) {
    echo "<script>alert('Record updated successfully');window.location.replace('incstatement.php');</script>";
  } else {
    echo "<script>alert('Error updating record: " . $conn->error."')</script>";
  }
}

    
    ?>
    <link rel="apple-touch-icon" href="theme-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="theme-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Muli:300,300i,400,400i,600,600i,700,700i%7CComfortaa:300,400,700" rel="stylesheet">
    <link href="https://maxcdn.icons8.com/fonts/line-awesome/1.1/css/line-awesome.min.css" rel="stylesheet">
    <!-- BEGIN VENDOR CSS-->
    <link rel="stylesheet" type="text/css" href="theme-assets/css/vendors.css">
    <!-- END VENDOR CSS-->
    <!-- BEGIN CHAMELEON  CSS-->
    <link rel="stylesheet" type="text/css" href="theme-assets/css/app-lite.css">
    <!-- END CHAMELEON  CSS-->
    <!-- BEGIN Page Level CSS-->
    <link rel="stylesheet" type="text/css" href="theme-assets/css/core/menu/menu-types/vertical-menu.css">
    <link rel="stylesheet" type="text/css" href="theme-assets/css/core/colors/palette-gradient.css">
    <!-- END Page Level CSS-->
    <!-- BEGIN Custom CSS-->
    <!-- END Custom CSS-->
  </head>
  <body class="vertical-layout vertical-menu 2-columns   menu-expanded fixed-navbar" data-open="click" data-menu="vertical-menu" data-color="bg-gradient-x-purple-blue" data-col="2-columns">

    <!-- fixed-top-->
    <nav class="header-navbar navbar-expand-md navbar navbar-with-menu navbar-without-dd-arrow fixed-top navbar-semi-light">
      <div class="navbar-wrapper">
        <div class="navbar-container content">
          <div class="collapse navbar-collapse show" id="navbar-mobile">
            <ul class="nav navbar-nav mr-auto float-left">
              <li class="nav-item d-block d-md-none"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ft-menu"></i></a></li>
              <li class="nav-item d-none d-md-block"><a class="nav-link nav-link-expand" href="#"><i class="ficon ft-maximize"></i></a></li>
              <li class="nav-item dropdown navbar-search"><a class="nav-link dropdown-toggle hide" data-toggle="dropdown" href="#"><i class="ficon ft-search"></i></a>
                <ul class="dropdown-menu">
                  <li class="arrow_box">
                    <form>
                      <div class="input-group search-box">
                        <div class="position-relative has-icon-right full-width">
                          <input required class="form-control" id="search" type="text" placeholder="Search here...">
                          <div class="form-control-position navbar-search-close"><i class="ft-x">   </i></div>
                        </div>
                      </div>
                    </form>
                  </li>
                </ul>
              </li>
            </ul>
            <ul class="nav navbar-nav float-right">         
              <li class="dropdown dropdown-language nav-item"><a class="dropdown-toggle nav-link" id="dropdown-flag" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="flag-icon flag-icon-us"></i><span class="selected-language"></span></a>
                <div class="dropdown-menu" aria-labelledby="dropdown-flag">
                  <div class="arrow_box"><a class="dropdown-item" href="#"><i class="flag-icon flag-icon-us"></i> English</a><a class="dropdown-item" href="#"><i class="flag-icon flag-icon-cn"></i> Chinese</a><a class="dropdown-item" href="#"><i class="flag-icon flag-icon-ru"></i> Russian</a><a class="dropdown-item" href="#"><i class="flag-icon flag-icon-fr"></i> French</a><a class="dropdown-item" href="#"><i class="flag-icon flag-icon-es"></i> Spanish</a></div>
                </div>
              </li>
            </ul>
            <ul class="nav navbar-nav float-right">
              <li class="dropdown dropdown-notification nav-item"><a class="nav-link nav-link-label" href="#" data-toggle="dropdown"><i class="ficon ft-mail">             </i></a>
                <div class="dropdown-menu dropdown-menu-right">
                  <div class="arrow_box_right"><a class="dropdown-item" href="#"><i class="ft-book"></i> Read Mail</a><a class="dropdown-item" href="#"><i class="ft-bookmark"></i> Read Later</a><a class="dropdown-item" href="#"><i class="ft-check-square"></i> Mark all Read       </a></div>
                </div>
              </li>
              <li class="dropdown dropdown-user nav-item"><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">             <span class="avatar avatar-online"><img src="theme-assets/images/portrait/small/avatar-s-19.png" alt="avatar"><i></i></span></a>
                <div class="dropdown-menu dropdown-menu-right">
                  <div class="arrow_box_right"><a class="dropdown-item" href="#"><span class="avatar avatar-online"><img src="theme-assets/images/portrait/small/avatar-s-19.png" alt="avatar"><span class="user-name text-bold-700 ml-1">John Doe</span></span></a>
                    <div class="dropdown-divider"></div><a class="dropdown-item" href="#"><i class="ft-user"></i> Edit Profile</a><a class="dropdown-item" href="#"><i class="ft-mail"></i> My Inbox</a><a class="dropdown-item" href="#"><i class="ft-check-square"></i> Task</a><a class="dropdown-item" href="#"><i class="ft-message-square"></i> Chats</a>
                    <div class="dropdown-divider"></div><a class="dropdown-item" href="#"><i class="ft-power"></i> Logout</a>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </nav>

    <!-- ////////////////////////////////////////////////////////////////////////////-->


    <?php include("./side.php"); ?>

    <div class="app-content content">
      <div class="content-wrapper">
        <div class="content-wrapper-before"></div>
        <div class="content-header row">
          <div class="content-header-left col-md-4 col-12 mb-2">
            <h3 class="content-header-title">Edit Income Statement Data</h3>
          </div>
          <div class="content-header-right col-md-8 col-12">
            <div class="breadcrumbs-top float-md-right">
              <div class="breadcrumb-wrapper mr-1">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="index.php">Home</a>
                  </li>
                  <li class="breadcrumb-item active">Edit Income Statement
                  </li>
                </ol>
              </div>
            </div>
          </div>
        </div>
        <div class="content-body"><!-- Basic Inputs start -->
<section class="basic-inputs">
  <div class="row match-height">
      <div class="col-xl-12 col-lg-6 col-md-12">
          <div class="card">
              <div class="card-header">
                  <h4 class="card-title">Edit Income Statement by ID</h4>
              </div>
              <div class="card-block">
                  <div class="card-body">
                      <form method="post">
                        <?php foreach ($selectedIncomeStatements as $inc) { ?>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Income Statement ID</label>
      <input required type="text" name="incid" readonly class="form-control" value="<?= $inc->is_id  ?>" id="inputEmail4" placeholder="0">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Financial ID</label>
      <input required type="text" readonly name="incfid" class="form-control" id="inputPassword4" value="<?= $inc->fi_id  ?>" placeholder="email">
    </div>
  </div>
  <div class="form-group">
    <label for="inputAddress">Revenue</label>
    <input required type="text" name="increvenue" class="form-control" id="inputAddress"  value="<?= $inc->revenue  ?>" placeholder="Full Name">
  </div>
 
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Cost of Goods Sold</label>
      <input required type="text"  name="inccogs" class="form-control" value="<?= $inc->cost_of_goods_sold ?>" id="inputEmail4" placeholder="0">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Operating Expenses</label>
      <input required type="text" name="incoex" class="form-control" id="inputPassword4" value="<?= $inc->operating_expenses  ?>" placeholder="email">
    </div>
  </div>
  <div class="form-group">
    <label for="inputAddress">Other Expenses</label>
    <input required type="text" name="incother" class="form-control" id="inputAddress"  value="<?= $inc->other_expenses  ?>" placeholder="Full Name">
  </div>
  <div class="form-group">
    <div class="form-check">
      <input required class="form-check-input" type="checkbox" id="gridCheck">
      <label class="form-check-label" for="gridCheck">
        I Confirm all the details are correct
      </label>
    </div>
  </div>
  <button type="submit"  name="incupdate" class="btn btn-primary">Sign in</button>
  <?php } ?>

</form>
                  </div>
              </div>
          </div>
      </div>
     
  </div>
</section>
<!-- Basic Inputs end -->

        </div>
      </div>
    </div>
    <!-- ////////////////////////////////////////////////////////////////////////////-->


   <footer class="footer footer-static footer-light navbar-border navbar-shadow">
    
    </footer>

    <!-- BEGIN VENDOR JS-->
    <script src="theme-assets/vendors/js/vendors.min.js" type="text/javascript"></script>
    <!-- BEGIN VENDOR JS-->
    <!-- BEGIN PAGE VENDOR JS-->
    <!-- END PAGE VENDOR JS-->
    <!-- BEGIN CHAMELEON  JS-->
    <script src="theme-assets/js/core/app-menu-lite.js" type="text/javascript"></script>
    <script src="theme-assets/js/core/app-lite.js" type="text/javascript"></script>
    <!-- END CHAMELEON  JS-->
    <!-- BEGIN PAGE LEVEL JS-->
    <script src="theme-assets/vendors/js/forms/tags/form-field.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL JS-->
  </body>
</html>