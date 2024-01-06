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
    
    
class Cashflow
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
    }
}

function getCashflowById($conn, $cf_id)
{
    $cashflows = [];

    $sql = "SELECT * FROM cashflow WHERE cf_id = $cf_id";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $cashflows[] = new Cashflow($row);
        }
    }

    return $cashflows;
}

// Example usage with a specific cf_id (replace with your desired cf_id)
$cf_id = $_GET['cfid'];
$selectedCashflows = getCashflowById($conn, $cf_id);
 
if (isset($_POST['chupdate'])) {

$cf_idToUpdate = $_POST['chid'];  // Replace with the specific cf_id you want to update
$newDescription = $_POST['chdesc'];
$newInvestment = $_POST['chinv'];
$newCashFlowType = $_POST['chtype'];
$newNotes = $_POST['chnotes'];
$newCategory = $_POST['chcat'];
$newTaxCategory = $_POST['chtax'];
$newFID = $_POST['chfid'];


// SQL update query
$sql = "UPDATE cashflow 
        SET description = '$newDescription', 
            investment = $newInvestment, 
            cash_flow_type = '$newCashFlowType', 
            category = '$newCategory', 
            tax_category = '$newTaxCategory', 
            notes = '$newNotes', 
            f_id = '$newFID'
        WHERE cf_id = $cf_idToUpdate";

        if ($conn->query($sql) === TRUE) {
      echo "<script>alert('Record updated successfully');window.location.replace('cashflow.php');</script>";
    } else {
      echo "<script>alert('Error updating record: " . $conn->error . "')</script>";
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
            <h3 class="content-header-title">Edit Cashflow Data</h3>
          </div>
          <div class="content-header-right col-md-8 col-12">
            <div class="breadcrumbs-top float-md-right">
              <div class="breadcrumb-wrapper mr-1">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="index.php">Home</a>
                  </li>
                  <li class="breadcrumb-item active">Edit Cashflow
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
                  <h4 class="card-title">Edit Cashflow by ID</h4>
              </div>
              <div class="card-block">
                  <div class="card-body">
                      <form method="post">
                        <?php foreach ($selectedCashflows as $cflows) { ?>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">ID</label>
      <input required type="text" name="chid" readonly class="form-control" value="<?= $cflows->cf_id  ?>" id="inputEmail4" placeholder="0">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Income ID</label>
      <input required type="text" name="chiid" readonly class="form-control" id="inputPassword4" value="<?= $cflows->inc_ID  ?>" placeholder="email">
    </div>
  </div>
  <div class="form-group">
    <label for="inputAddress">Description</label>
    <input required type="text" name="chdesc" class="form-control" id="inputAddress"  value="<?= $cflows->description  ?>" placeholder="Full Name">
  </div>
 
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Investment</label>
      <input required type="text"  name="chinv" class="form-control" value="<?= $cflows->investment ?>" id="inputEmail4" placeholder="0">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Cash Flow Type</label>
      <select  name="chtype" class="form-control"  aria-label="Default select example">
  <option value="Operating" <?php if($cflows->cash_flow_type=="Operating"){ echo " selected "; }  ?>>Operating</option>
  <option value="Investing" <?php if($cflows->cash_flow_type=="Investing"){ echo " selected "; }  ?>>Investing</option>
  <option value="Financing" <?php if($cflows->cash_flow_type=="Financing"){ echo " selected "; }  ?>>Financing</option>
</select>
   
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputAddress">Tax Cetgory</label>
    <input required type="text" name="chtax" class="form-control" id="inputAddress"  value="<?= $cflows->tax_category  ?>" placeholder="Full Name">
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Category</label>
      <input required type="text" name="chcat"  class="form-control" value="<?= $cflows->category ?>" id="inputEmail4" placeholder="0">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Notes</label>
      <input required type="text"  name="chnotes"  class="form-control" id="inputPassword4" value="<?= $cflows->notes  ?>" placeholder="email">
    </div>
  </div>
  
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Date Created</label>
      <input required type="text" readonly name="chdate" class="form-control" value="<?= $cflows->created_at ?>" id="inputEmail4" placeholder="0">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Financial ID</label>
      <input required type="text"  name="chfid" readonly class="form-control" id="inputPassword4" value="<?= $cflows->f_id  ?>" placeholder="email">
    </div>
  </div>
  <div class="form-group">
    <div class="form-check">
      <input required class="form-check-input" type="checkbox" id="gridCheck">
      <label class="form-check-label" for="gridCheck">
        I Confirm all the details are correct
      </label>
    </div>
  </div>
  <button type="submit" name="chupdate" class="btn btn-primary">Sign in</button>
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