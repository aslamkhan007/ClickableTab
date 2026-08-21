<%@ Page Title="" Language="C#" MasterPageFile="~/SiteOwnerPages/SiteOwner.Master" AutoEventWireup="true" CodeBehind="SwitchingSubstationTestReportPeriodic.aspx.cs" Inherits="CEIHaryana.SiteOwnerPages.SwitchingSubstationTestReportPeriodic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="shortcut icon" type="image/png" href="/css2/style.min.css" />
    <link rel="stylesheet" href="/css2/style.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.rawgit.com/harvesthq/chosen/gh-pages/chosen.jquery.min.js"></script>
    <link href="https://cdn.rawgit.com/harvesthq/chosen/gh-pages/chosen.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/solid.min.css" integrity="sha512-P9pgMgcSNlLb4Z2WAB2sH5KBKGnBfyJnq+bhcfLCFusrRc4XdXrhfDluBl/usq75NF5gTDIMcwI1GaG5gju+Mw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc" crossorigin="anonymous"></script>
    <script type="text/javascript">
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }

        //Allow Only Aplhabet, Delete and Backspace

        function isAlpha(keyCode) {

            return ((keyCode >= 65 && keyCode <= 90) || keyCode == 8 || keyCode == 32 || keyCode == 190)

        }

        function alphabetKey(e) {
            var allow = ' ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz \b'
            var k;
            k = document.all ? parseInt(e.keyCode) : parseInt(e.which);
            return (allow.indexOf(String.fromCharCode(k)) != -1);
        }
    </script>


    <script type="text/javascript">
        function alertWithRedirectdataRatingofinstallationPage() {

            alert('Rating Of Installation of Substation Transformer Created Successfully');
            window.location.href = "/SiteOwnerPages/TestReport.aspx";

        }
    </script>
    <script type="text/javascript">
        function alertWithRedirectNextProcessExistingPage() {

            alert('Rating Of Installation of Substation Transformer Created Successfully');
            window.location.href = "/SiteOwnerPages/PeriodicRenewal.aspx";

        }
    </script>

    <style>
        .headercolor1 {
            text-align: initial !important;
        }

        td {
            padding: 10px !important;
        }

        .submit {
            border: 1px solid #563d7c;
            border-radius: 5px;
            color: white;
            padding: 5px 10px 5px 10px;
            background: left 3px top 5px no-repeat #563d7c;
        }

            .submit:hover {
                border: 1px solid #563d7c;
                border-radius: 5px;
                color: white;
                padding: 5px 10px 5px 10px;
                background: left 3px top 5px no-repeat #26005f;
                box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            }

        .table-dark {
            text-align: center !important;
            background-color: #9292cc !important;
        }

        .col-md-4 {
            margin-bottom: 15px;
        }

        .form-control {
            box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
            margin-left: 0px !important;
            height: 30px;
            font-size: 13px;
        }

        select.form-control {
            box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
            margin-left: 0px !important;
            height: 30px;
        }

        label {
            font-size: 13px;
        }

        .form-control:focus {
            border: 2px solid #80bdff;
        }

        select.form-control:focus {
            border: 2px solid #80bdff;
        }

        .select2-container .select2-selection--single {
            height: 30px !important;
        }

        .select2-container--default .select2-selection--single {
            border: 1px solid #ccc !important;
            border-radius: 0px !important;
        }

        span.select2-selection.select2-selection--single {
            padding: 0px 0px 0px 5px;
            box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
            margin-left: 0px !important;
            height: 30px;
            border-radius: 5px !important;
        }

            span.select2-selection.select2-selection--single:focus {
                border: 2px solid #80bdff;
            }

        .card .card-title {
            font-size: 1rem !important;
        }

        .btn-primary:hover {
            box-shadow: rgba(50, 50, 93, 0.25) 0px 30px 60px -12px inset, rgba(0, 0, 0, 0.3) 0px 18px 36px -18px inset;
        }

        button.btn.btn-primary.mr-2 {
            padding: 10px 25px 10px 25px;
            font-size: 18px;
        }

        select.form-control.select-form.select2 {
            height: 30px !important;
            padding: 2px 0px 5px 10px;
        }

        ul.chosen-choices {
            border-radius: 5px;
        }

        input#customFile {
            padding: 0px 0px 0px 0px;
        }

        input#ContentPlaceHolder1_txtName {
            font-size: 12.5px !important;
        }


        input#ContentPlaceHolder1_txtagency {
            font-size: 12.5px;
        }

        .headercolor {
            background-color: #9292cc;
        }

        th {
            background: #9292cc;
        }

        .card .card-title {
            font-size: 20px !important;
            color: #010101;
            text-transform: capitalize;
            font-weight: 700;
        }



        div#row3 {
            margin-top: -20px;
        }

        svg#svgcross {
            height: 35px;
            width: 67px;
        }

        svg#svgcross1 {
            height: 35px;
            width: 67px;
        }

        svg#svgcross2 {
            height: 35px;
            width: 67px;
        }



        svg#search1:hover {
            height: 22px;
            width: 22px;
            fill: #4b49ac;
            transition: ease-out;
            margin-left: -2px;
            cursor: pointer;
        }

        th.textalignleft {
            text-align: justify !important;
            padding: 9px !important;
        }

        th.headercolor {
            width: 28% !important;
        }

        th {
            width: 1%;
        }

        .input-box {
            display: flex;
            align-items: center;
            max-width: 300px;
            background: #fff;
            border: 1px solid #a0a0a0;
            border-radius: 4px;
            padding-left: 0.5rem;
            overflow: hidden;
            font-family: sans-serif;
        }

            .input-box .prefix {
                font-weight: 300;
                font-size: 14px;
                color: black;
            }

            .input-box input {
                flex-grow: 1;
                font-size: 14px;
                background: #fff;
                border: none;
                outline: none;
                padding: 0.5rem;
            }

            .input-box:focus-within {
                border-color: #777;
            }

        input#ContentPlaceHolder1_txtapplication {
            width: 100% !important;
            border-radius: 5px;
            box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
            margin-left: 0px !important;
            height: 30px;
            font-size: 13px;
            background: #f9f9f9;
        }

        input#ContentPlaceHolder1_txtid {
            width: 100% !important;
            border-radius: 5px;
            box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
            margin-left: 0px !important;
            height: 30px;
            font-size: 13px;
            background: #f9f9f9;
        }

        input#ContentPlaceHolder1_txtInstallation {
            width: 100% !important;
            border-radius: 5px;
            box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
            margin-left: 0px !important;
            height: 30px;
            font-size: 13px;
            background: #f9f9f9;
        }

        input#ContentPlaceHolder1_txtNOOfInstallation {
            width: 100% !important;
            border-radius: 5px;
            box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
            margin-left: 0px !important;
            height: 30px;
            font-size: 13px;
            background: #f9f9f9;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="card" style="box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px; border-radius: 5px !important">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12" style="text-align: center;">
                        <h7 class="card-title fw-semibold mb-4" id="maincard">
                            RATING OF INSTALLATIONS (SWITCHING STATION)
                        </h7>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4" style="text-align: center;">
                        <label id="DataUpdated" runat="server" visible="false" style="color: red; font-size: 1.125rem">
                            Data Updated Successfully !!!.
                        </label>
                        <label id="DataSaved" runat="server" visible="false" style="color: red; font-size: 1.125rem">
                            Data Saved Successfully !!!.
                        </label>
                    </div>
                </div>
                <div class="row" style="margin-top: 10px;">
                    <div class="col-md-12" style="text-align: left;">
                        <h7 class="card-title fw-semibold mb-4" style="font-size: 20px !important;">Intimation/Installation Details</h7>
                    </div>
                </div>
                <div class="card-body" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px; background: #d4d7ec; margin-bottom: 25px; border-radius: 10px; margin-top: 10px; padding-top: 10px; padding-bottom: 5px;">
                    <div class="row">
                        <div class="col-3" id="Div8" runat="server">
                            <label for="Name">
                                Applicant
                            </label>
                            <asp:TextBox class="form-control" ID="txtapplication" Enabled="false" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="width: 100%"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtapplication" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Length of Line</asp:RequiredFieldValidator>
                        </div>
                        <div class="col-3" id="Div9" runat="server">
                            <label for="Name">
                                WorkIntimation ID
                            </label>
                            <asp:TextBox class="form-control" ID="txtid" Enabled="false" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtid" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Length of Line</asp:RequiredFieldValidator>
                        </div>
                        <div class="col-3" id="Div10" runat="server">
                            <label for="Name">
                                Type of Installation
                            </label>
                            <asp:TextBox class="form-control" ID="txtInstallation" Enabled="false" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtInstallation" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Length of Line</asp:RequiredFieldValidator>
                        </div>
                        <div class="col-3" id="Div12" runat="server">
                            <label for="Name">
                                No of Installation
                            </label>
                            <asp:TextBox class="form-control" ID="txtNOOfInstallation" Enabled="false" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtNOOfInstallation" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Length of Line</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div class="card-body" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px; padding: 25px 25px 25px 25px; margin-bottom: 25px; border-radius: 10px; margin-top: 10px;">
                    <div class="row">
                        <div class="col-3">
                            <label>
                                Voltage Level of Switching Station<samp style="color: red">* </samp>
                            </label>
                            <asp:DropDownList class="form-control  select-form select2" runat="server" AutoPostBack="true" ID="ddlVoltage" Style="width: 100% !important">
                                <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                <asp:ListItem Value="1" Text="Oil"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Dry"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" ControlToValidate="ddlVoltage" runat="server" ErrorMessage="Please Select Voltage Level" InitialValue="0" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-3">
                            <label>
                                Name of Switching Station
                                <samp style="color: red">* </samp>
                            </label>
                            <asp:TextBox class="form-control" AutoPostBack="true" ID="txtSwitchingStationName" MaxLength="30"  autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Red" ControlToValidate="txtSwitchingStationName" runat="server" ErrorMessage="Please Enter Name" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-3">
                            <label>
                                Type of Breaker
                                <samp style="color: red">* </samp>
                            </label>
                            <asp:DropDownList class="form-control  select-form select2" runat="server" AutoPostBack="true" ID="ddlBreakerType" OnSelectedIndexChanged="ddlBreakerType_SelectedIndexChanged" Style="width: 100% !important">
                                <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                <asp:ListItem Value="1" Text="VCB"></asp:ListItem>
                                <asp:ListItem Value="2" Text="SF6"></asp:ListItem>
                                <asp:ListItem Value="3" Text="Other"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ForeColor="Red" ControlToValidate="ddlBreakerType" runat="server" ErrorMessage="Please Breaker Type" InitialValue="0" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-3" id="otherbreakertype" runat="server" visible="false">
                            <label>
                                Other Breaker type
                                <samp style="color: red">* </samp>
                            </label>
                            <asp:TextBox class="form-control" AutoPostBack="true" ID="txtOtherbreakerType" MaxLength="30" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ForeColor="Red" ControlToValidate="txtOtherbreakerType" runat="server" ErrorMessage="Please Enter Type" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-3">
                            <label>
                                Total No. of Breakers
                                <samp style="color: red">* </samp>
                            </label>
                            <asp:TextBox class="form-control" AutoPostBack="true" MaxLength="3" ID="txtTotalBreakers" onKeyPress="return isNumberKey(event);" autocomplete="off" runat="server" Style="margin-left: 18px"  onBlur="validateInput();" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ForeColor="Red" ControlToValidate="txtTotalBreakers" runat="server" ErrorMessage="Please Enter No. of Breakers" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-3">
                            <label>
                                Capacity of Station Transformer(Kva)
                                <samp style="color: red">* </samp>
                            </label>
                            <asp:TextBox class="form-control" AutoPostBack="true" ID="txtStationTransformerCapacity" onKeyPress="return isNumberKey(event);" MaxLength="5" autocomplete="off" runat="server" Style="margin-left: 18px" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ForeColor="Red" ControlToValidate="txtStationTransformerCapacity" runat="server" ErrorMessage="Please Enter Transformer Capacity" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-3">
                            <label>
                                Serial no.
         <samp style="color: red">* </samp>
                            </label>
                            <asp:TextBox class="form-control" AutoPostBack="true" ID="txtSerialNo"   MaxLength="30"  autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ForeColor="Red" ControlToValidate="txtSerialNo" runat="server" ErrorMessage="Please Enter Transformer Capacity" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-3" id="Div5" runat="server">
                            <label for="Name">
                                Last inspection issue date
                                <samp style="color: red">* </samp>
                            </label>
                            <asp:TextBox class="form-control" type="date" ReadOnly="false" ID="txtLastInspectionIssueDate" onkeydown="return preventEnterSubmit(event)" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ForeColor="Red" ControlToValidate="txtLastInspectionIssueDate" ValidationGroup="Submit" ErrorMessage="Please Select last inspection date"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-4" style="text-align: center;">
                            <asp:Button type="submit" ID="btnSubmit" ValidationGroup="Submit" Text="Submit" runat="server" class="btn btn-primary mr-2" OnClick="btnSubmit_Click" />
                            <asp:Button type="submit" ID="btnReset" Text="Reset" runat="server" class="btn btn-primary mr-2" Style="padding-left: 18px; padding-right: 18px;" />
                            <asp:Button type="Back" ID="btnBack" Text="Back" runat="server" Visible="false" class="btn btn-primary mr-2" />
                        </div>
                    </div>
                </div>
                <div>
                </div>
            </div>
        </div>
        <footer class="footer">
        </footer>
        <script src="/Assets/js/js/vendor.bundle.base.js"></script>
        <script src="/Assets/js/chart.js/Chart.min.js"></script>
        <script src="/Assets/js/datatables.net/jquery.dataTables.js"></script>
        <script src="/Assets/js/datatables.net-bs4/dataTables.bootstrap4.js"></script>
        <script src="/Assets/js/dataTables.select.min.js"></script>
        <script src="/Assets/js/off-canvas.js"></script>
        <script src="/Assets/js/hoverable-collapse.js"></script>
        <script src="/Assets/js/template.js"></script>
        <script src="/Assets/js/settings.js"></script>
        <script src="/Assets/js/todolist.js"></script>
        <script src="/Assets/js/dashboard.js"></script>
        <script src="/Assets/js/Chart.roundedBarCharts.js"></script>
        <script type="text/javascript">
            function FileName() {
                var fileInput = document.getElementById('customFile');
                var selectedFileName = document.getElementById('customFileLocation');

                if (fileInput.files.length > 0) {
                    // Update the TextBox value with the selected file name
                    selectedFileName.value = fileInput.files[0].name;
                }
            }
        </script>

        <script>
            function preventEnterSubmit(event) {
                if (event.keyCode === 13) {
                    event.preventDefault(); // Prevent form submission
                    return false;
                }
            }
        </script>

        <script type="text/javascript">
            function SelectAllCheckboxes(headerCheckbox) {
                var checkboxes = document.querySelectorAll('[id*=CheckBox1]');
                for (var i = 0; i < checkboxes.length; i++) {
                    checkboxes[i].checked = headerCheckbox.checked;
                }
            }
        </script>
        <script>
            $('.select2').select2();
        </script>
        <script>
            $(".chosen-select").chosen({
                no_results_text: "Oops, nothing found!"
            })
        </script>


        <script type="text/javascript">
            function showHide1() {

                let experience = document.getElementById('ddlworktype');
                if (experience.value == 1) {
                    document.getElementById('individual').style.display = 'block';
                } else {
                    document.getElementById('individual').style.display = 'none';
                }
                if (experience.value == 1) {
                    document.getElementById('Agency').style.display = 'block';
                } else {
                    document.getElementById('Agency').style.display = 'none';
                }
            }
        </script>
        <script type="text/javascript">
            function allowAlphabets(event) {
                var keyCode = event.which || event.keyCode;

                // Allow only alphabetical keys
                if ((keyCode >= 65 && keyCode <= 90) || (keyCode >= 97 && keyCode <= 122)) {
                    return true;
                } else {
                    event.preventDefault();
                    return false;
                }
            }
        </script>

        <script type="text/javascript">
            function restrictInput(event) {
                var keyCode = event.which || event.keyCode;
                var inputValue = event.target.value + String.fromCharCode(keyCode);

                // Allow only digits (0-9)
                if (keyCode < 48 || keyCode > 57) {
                    event.preventDefault();
                    return false;
                }

                // Check if the input value is between 1 and 25
                var numValue = parseInt(inputValue);

                if (isNaN(numValue) || numValue < 1 || numValue > 25) {
                    event.preventDefault();
                    return false;
                }

                return true;
            }
        </script>
        <script type="text/javascript">
            function alertWithRedirect() {
                if (confirm('User Created Successfully User Id And password will be sent Via Text Mesaage.')) {
                    window.location.href = "/Contractor/Work_Intimation.aspx";
                } else {
                }
            }
        </script>

        <script type="text/javascript">
            let isCheck = false;
            function validateInput(event) {

                var textBox = event.target;
                var keyCode = event.keyCode || event.which;


                if ((keyCode >= 65 && keyCode <= 90) ||
                    (keyCode >= 48 && keyCode <= 57) ||
                    keyCode === 8) {
                    return true;
                } else if (keyCode >= 97 && keyCode <= 122) {

                    textBox.value += String.fromCharCode(keyCode - 32);
                    return false;
                } else {
                    return false;
                }
            }
            function CheckInput() {
                if (isCheck) {
                    return false;
                }
                if (Page_ClientValidate()) {
                    isCheck = true;
                    return true;
                } else {
                    return false;
                }
            }

            function preventEnterSubmit(e) {
                if (e.keyCode === 13) {
                    e.preventDefault();
                    return false;
                }
                return true;
            }
        </script>
        <script type="text/javascript">
            window.onload = function () {
                var today = new Date().toISOString().split('T')[0];
                document.getElementById('<%= txtLastInspectionIssueDate.ClientID %>').setAttribute('max', today);
            };
        </script>

        <script type="text/javascript">
            function alertWithRedirectdataRatingofinstallationPage() {

                alert('Rating Of Installation of Switching Station Created Successfully');
                window.location.href = "/SiteOwnerPages/TestReport.aspx";

            }
        </script>
        <script type="text/javascript">
            function alertWithRedirectNextProcessExistingPage() {

                alert('Rating Of Installation of Switching Station Created Successfully');
                window.location.href = "/SiteOwnerPages/PeriodicRenewal.aspx";

            }
        </script>

      <script type="text/javascript">

          function validateInput() {
              var input = document.getElementById('<%= txtTotalBreakers.ClientID %>').value;
        var number = parseInt(input, 10);

        // Check if the number is within the range of 1 to 100
        if (number < 1 || number > 100 || isNaN(number)) {
            alert("Please enter a number between 1 and 100.");
            document.getElementById('<%= txtTotalBreakers.ClientID %>').value = ""; // Clear the input
              }
          }
</script>
</asp:Content>
