<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintSubstationTransformerTestReport.aspx.cs" Inherits="CEIHaryana.UserPages.PrintSubstationTransformerTestReport" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css2/styles.css" rel="stylesheet" />
    <link rel="shortcut icon" type="image/png" href="/css2/style.min.css" />
    <link rel="stylesheet" href="/css2/style.css" />
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

    <link href="ScriptCalendar/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="ScriptCalender/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="ScriptCalender/jquery-ui.min.js"></script>

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

    <style>
        div#SubmitBy {
            margin-top: 1px;
        }

        div#SubmitDate {
            margin-top: 1px;
        }

        div#Div10 {
            margin-top: 1px;
        }

        div#Div12 {
            margin-top: 1px;
        }

        div#Div13 {
            margin-top: 1px;
        }

        .page1 {
            box-sizing: border-box;
            min-height: 100vh;
            border-radius: 10px;
            border: solid 1px black;
            padding: 25px;
        }

        .page2 {
            box-sizing: border-box;
            min-height: 100vh;
            border-radius: 10px;
            border: solid 1px black;
            padding: 25px;
        }

        input#txtInstallationType {
            font-size: 20px !important;
            font-weight: 700;
            text-align: end;
        }

        input#txtTestReportId {
            font-size: 25px !important;
            font-weight: 700;
            text-align: initial;
            border-bottom: 0px solid !important;
        }

        .col-4 {
            top: 0px;
            left: 0px;
            margin-top: 2%;
        }

        .col-3 {
            margin-top: 3%;
        }

        .col-12 {
            margin-top: 3%;
        }

        .col-9 {
            margin-top: 3%;
        }

        .form-control {
            margin-left: 0px !important;
            font-size: 16px !important;
            height: 30px;
            border-bottom: 1px solid !important;
            border: 0px solid black;
            border-radius: 0px;
            margin-top: 5px;
        }

        label {
            font-size: 18px;
            margin-top: 5px;
            font-weight: 600;
        }

        .card {
            border: none !important;
        }

            .card .card-title {
                color: #010101;
                margin-bottom: 1.2rem;
                text-transform: capitalize;
                font-size: 20px;
                font-weight: 600;
            }

        u {
            font-size: 22px;
        }

        input#txtInstallationType {
            border-bottom: 0px solid !important;
        }

        @media print {
            #Header, #Footer {
                display: none !important;
            }
        }

        input {
            background: white !important;
        }
    </style>
    <script>

        function
            printDiv(printableDiv) {
            debugger;
            var printContents = document.getElementById(printableDiv).innerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;

            window.print();

            document.body.innerHTML = originalContents;

        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="content-wrapper">
                <div class="card" style="box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px; border-radius: 5px !important">
                    <div class="col-12" style="text-align: end; margin-top: auto; margin-bottom: auto;">
                        <asp:Button ID="btnPrint" Text="Print" runat="server" class="btn btn-primary mr-2"
                            Style="margin-top: 5px; margin-bottom: -40px; font-size: 20px; padding-left: 25px; padding-right: 25px; position: fixed; margin-left: -100px; z-index: 50; background: blue !important;" OnClientClick="printDiv('printableDiv');" />
                    </div>
                    <div class="card-body">
                        <div id="printableDiv">
                            
                            <!-- WATERMARK INJECTED HERE -->
                            <div class="page-watermark">C&nbsp;E&nbsp;I</div>

                            <div class="page1">
                                <div class="row" style="margin-bottom: 15PX;">
                                    <div class="col-sm-12" style="text-align: center; padding-top: 8px; padding-bottom: 8px; border-radius: 10px;">
                                        <h6 class="card-title fw-semibold mb-4" style="font-weight: 700; margin-bottom: 0px !important; font-size: 32PX;">Work Completion and Test Report</h6>
                                        <div class="row">
                                            <div class="col-12" style="margin-top: 0px; padding-left: 0px;">
                                                <asp:TextBox class="form-control" ID="txtTestReportId" runat="server" ReadOnly="true" autocomplete="off" onKeyPress="return alphabetKey(event);" TabIndex="1"
                                                    MaxLength="30" Style="margin-left: 18px; text-align: center;">
                                                </asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <h6 class="card-title fw-semibold mb-4" style="font-weight: 700; margin-bottom: 0px !important;"><u>Details</u></h6>
                                <div id="IntimationData" runat="server" visible="true">
                                    <div class="row">
                                        <div class="col-4">
                                            <label for="Name">
                                                Electrical Installation For
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtInstallation" ReadOnly="true" onkeydown="return preventEnterSubmit(event)" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        </div>
                                        <div class="col-4">
                                            <div id="agency" runat="server" visible="false">
                                                <label for="agency">Name of Organization</label>
                                                <asp:TextBox class="form-control" ID="txtagency" ReadOnly="true" onkeydown="return preventEnterSubmit(event)" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                            </div>
                                            <div id="individual" runat="server">
                                                <label for="Name">
                                                    Name of Owner/ Consumer
                                                </label>
                                                <asp:TextBox class="form-control" ID="txtName" ReadOnly="true" onkeydown="return preventEnterSubmit(event)" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-4" id="individual5">
                                            <label for="Name">
                                                Contact Details 
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtPhone" ReadOnly="true" onkeydown="return preventEnterSubmit(event)" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4">
                                            <div id="individual2" runat="server">
                                                <label for="Name">Type of Premises</label>
                                                <asp:TextBox class="form-control" ID="TxtPremises" ReadOnly="true" onkeydown="return preventEnterSubmit(event)" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div id="individual3" runat="server">
                                                <label for="Name">
                                                    Highest Voltage Level of Work
                                                </label>
                                                <asp:TextBox class="form-control" ID="txtVoltagelevel" ReadOnly="true" onkeydown="return preventEnterSubmit(event)" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div id="individual6" runat="server">
                                                <label for="Name">
                                                    Work Start Date
                                                </label>
                                                <asp:TextBox class="form-control" ID="txtStartDate" ReadOnly="true" onkeydown="return preventEnterSubmit(event)" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4">
                                            <div id="individual11" runat="server">
                                                <label for="Name">
                                                    Tentative Work Completition Date
                                                </label>
                                                <asp:TextBox class="form-control" ID="txtCompletitionDate" ReadOnly="true" onkeydown="return preventEnterSubmit(event)" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div cass="row" style="margin-top: 5%;">
                                        <div class="col-12" id="individual10" style="padding-left: 0px;">
                                            <label for="Name">
                                                Address of Site
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtAddress" ReadOnly="true" onkeydown="return preventEnterSubmit(event)" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="card" id="inspection-card" style="margin-top: 5%;">
                                    <h6 class="card-title fw-semibold mb-4" style="font-weight: 700; margin-bottom: 0px !important;"><u>Test Report Details</u></h6>
                                    <div class="card" id="inspection-card-child1">
                                        <div class="row">
                                            <div class="col-4" id="Div121" runat="server">
                                                <label>
                                                    Serial number of transformer
                                                </label>
                                                <asp:TextBox class="form-control" AutoPostBack="true" ReadOnly="true" ID="txtTransformerSerialNumber" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                            </div>
                                            <div class="col-4">
                                                <label>
                                                    Unit of transformer
                                                </label>
                                                <asp:TextBox class="form-control" AutoPostBack="true" ReadOnly="true" ID="txtTransformerCapacityType" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                            </div>
                                            <div class="col-4">
                                                <label>
                                                    Capacity of transformer 
                                                </label>
                                                <asp:TextBox class="form-control" AutoPostBack="true" ReadOnly="true" ID="txtTransformerCapacity" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                            </div>
                                            <div class="col-4">
                                                <label>
                                                    Type of transformer
                                                </label>
                                                <asp:TextBox class="form-control" AutoPostBack="true" ID="txtTransformerType" ReadOnly="true" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div id="InCaseOfOil" runat="server" visible="false">
                                            <div class="row">
                                                <div class="col-4">
                                                    <label>
                                                        Primary voltage (IN VOLTS)  
                                                    </label>
                                                    <asp:TextBox class="form-control" AutoPostBack="true" ID="txtPrimaryVoltage" ReadOnly="true" MaxLength="10" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                </div>
                                                <div class="col-4">
                                                    <label>
                                                        Secondary Voltage (IN VOLTS)  
                                                    </label>
                                                    <asp:TextBox class="form-control" AutoPostBack="true" ID="txtSecondryVoltage" ReadOnly="true" onKeyPress="return isNumberKey(event);" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                </div>
                                                <div id="Capacity" class="col-4" runat="server" visible="false">
                                                    <label>
                                                        Capacity of oil (in liters)
                                                    </label>
                                                    <asp:TextBox class="form-control" AutoPostBack="true" ID="txtOilCapacity" ReadOnly="true" MaxLength="10" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                </div>
                                                <div id="BDV" class="col-4" runat="server" visible="false">
                                                    <label>
                                                        BDV level of oil (in kv) Break down voltage 
                                                    </label>
                                                    <asp:TextBox class="form-control" AutoPostBack="true" ID="txtOilBDV" ReadOnly="true" MaxLength="10" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                </div>
                                            </div>
                                            <%--  <label style="margin-top: 10px; margin-bottom: 0px; font-size: 1rem !important; font-weight: 600;">HT side Insulation Resistance</label>--%>
                                            <div class="HTInsulationResistance">
                                                <div class="row" style="margin-top: -15px;">
                                                    <div class="col-4" id="Div124" runat="server">
                                                        <label for="Voltage" style="margin-top: 30px;">
                                                            HT side Insulation Resistance— HV/Earth (in Mohms)
                                                        </label>
                                                        <asp:TextBox class="form-control" AutoPostBack="true" ReadOnly="true" onKeyPress="return isNumberKey(event);" ID="txtHTsideInsulation" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                    </div>
                                                    <div class="col-4" style="margin-top: auto;">
                                                        <label for="Voltage">
                                                            LT side Insulation Resistance—LV/Earth (in Mohms)
                                                        </label>
                                                        <asp:TextBox class="form-control" AutoPostBack="true" onKeyPress="return isNumberKey(event);" ID="txtLTSideInsulation" ReadOnly="true" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                    </div>
                                                    <div class="col-4" style="margin-top: auto;">
                                                        <label for="Voltage">
                                                            Insulation Resistance between HT/LT Side (in Mohms)
                                                        </label>
                                                        <asp:TextBox class="form-control" AutoPostBack="true" onKeyPress="return isNumberKey(event);" ID="txtLowestValue" ReadOnly="true" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-4">
                                                        <label for="Voltage">
                                                            Lightning Arrestor (LA) Location  
                                                        </label>
                                                        <asp:TextBox class="form-control" AutoPostBack="true" ID="txtLightningArrestor" ReadOnly="true" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                    </div>
                                                    <div class="col-4">
                                                        <label>
                                                            Type of HT (Primary Switch)
                                                        </label>
                                                        <asp:TextBox class="form-control" AutoPostBack="true" ID="txtHTType" ReadOnly="true" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                        <asp:DropDownList class="form-control  select-form select2" TabIndex="6" runat="server" AutoPostBack="true" ID="ddlBreaker" selectionmode="Multiple" Visible="false" Style="width: 100% !important">
                                                            <asp:ListItem Value="1" Text="Breaker" Selected="True"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="TypeOfHTBreaker" runat="server" visible="false">
                                                <div class="row">
                                                    <div class="col-4">
                                                        <label for="Voltage">
                                                            Load breaking capacity of breaker 
                                                        </label>
                                                        <asp:TextBox class="form-control" AutoPostBack="true" ID="txtBreakerCapacity" ReadOnly="true" onKeyPress="return isNumberKey(event);" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                    </div>
                                                    <div class="col-4">
                                                        <label>
                                                            Type of LT protection
                                                        </label>
                                                        <asp:TextBox class="form-control" AutoPostBack="true" ID="txtLTProtection" ReadOnly="true" onKeyPress="return isNumberKey(event);" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                    </div>
                                                    <div class="col-4" id="FuseUnit" runat="server" visible="false">
                                                        <label for="Voltage">
                                                            Capacity of individual fuse(IN AMPS)  
                                                        </label>
                                                        <asp:TextBox class="form-control" AutoPostBack="true" ID="txtIndividualCapacity" ReadOnly="true" onKeyPress="return isNumberKey(event);" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="Breaker" runat="server" visible="false">
                                                <div class="row">
                                                    <div class="col-4" id="Div167" runat="server">
                                                        <label for="Voltage">
                                                            Capacity of LT Breaker(IN AMPS)  
                                                        </label>
                                                        <asp:TextBox class="form-control" AutoPostBack="true" ID="txtLTBreakerCapacity" ReadOnly="true" onKeyPress="return isNumberKey(event);" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                    </div>
                                                    <div class="col-4" id="Div168" runat="server">
                                                        <label for="Voltage">
                                                            Load Breaking Capacity of Breaker (IN AMPS)  
                                                        </label>
                                                        <asp:TextBox class="form-control" AutoPostBack="true" ID="txtLoadBreakingCapacity" ReadOnly="true" onKeyPress="return isNumberKey(event);" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                    </div>
                                                    <div class="col-4" id="Div169" runat="server">
                                                        <label for="Voltage">
                                                            Mean Sea Level of transformer plinth (IN METRES)  
                                                        </label>
                                                        <asp:TextBox class="form-control" AutoPostBack="true" ID="txtSealLevelPlinth" ReadOnly="true" onKeyPress="return isNumberKey(event);" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="page2">
                                <div class="card" id="earthing-card" style="margin-top: 1%;">
                                    <h6 class="card-title fw-semibold mb-4" style="font-weight: 700; margin-bottom: 0px !important;"><u>Earthing Details</u></h6>
                                    <div id="Earthing" runat="server" visible="true">
                                        <div class="card">
                                            <div class="col-4">
                                                <label>
                                                    Number of Earthing:
                                                </label>
                                                <asp:TextBox class="form-control" AutoPostBack="true" ID="txtEarthing" ReadOnly="true" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                            </div>
                                            <div class="table-responsive pt-3" id="SubstationEarthingDiv" runat="server" visible="false" style="margin-left: 0px;">
                                                <table id="earthingcard" class="table table-bordered table-striped" style="box-shadow: rgba(0, 0, 0, 0.16) 0px 10px 36px 0px, rgba(0, 0, 0, 0.06) 0px 0px 0px 1px;">
                                                    <thead class="table" style="background-color: #9292cc;">
                                                        <tr>
                                                            <th>S.No.
                                                            </th>
                                                            <th>Earthing Type
                                                            </th>
                                                            <th>Value in(ohms)
                                                            </th>
                                                            <th>Used For
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <div id="EarthingSubstation4" runat="server" visible="false">
                                                            <tr>
                                                                <td>1
                                                                </td>
                                                                <td>
                                                                    <div class="col-12">
                                                                        <asp:TextBox class="form-control" AutoPostBack="true" ID="txtEarthingType1" ReadOnly="true" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="col-12">
                                                                        <asp:TextBox class="form-control" ID="txtSubstationEarthing1" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="col-12">
                                                                        <asp:TextBox class="form-control" AutoPostBack="true" ID="txtUsedFor1" ReadOnly="true" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                    </div>
                                                                    <div class="col-12">
                                                                        <asp:TextBox class="form-control" ID="txtOtherUsage1" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Visible="false" Style="margin-left: 18px"></asp:TextBox>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>2
                                                                </td>
                                                                <td>
                                                                    <div class="col-12">
                                                                        <asp:TextBox class="form-control" AutoPostBack="true" ID="txtEarthingType2" ReadOnly="true" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="col-12">
                                                                        <asp:TextBox class="form-control" ID="txtSubstationEarthing2" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="col-12">
                                                                        <asp:TextBox class="form-control" AutoPostBack="true" ID="txtUsedFor2" ReadOnly="true" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                    </div>
                                                                    <div class="col-12">
                                                                        <asp:TextBox class="form-control" ID="txtOtherUsage2" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Visible="false" Style="margin-left: 18px"></asp:TextBox>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>3
                                                                </td>
                                                                <td>
                                                                    <div class="col-12">
                                                                        <asp:TextBox class="form-control" AutoPostBack="true" ID="txtEarthingType3" ReadOnly="true" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="col-12">
                                                                        <asp:TextBox class="form-control" ID="txtSubstationEarthing3" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="col-12">
                                                                        <asp:TextBox class="form-control" AutoPostBack="true" ID="txtUsedFor3" ReadOnly="true" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                    </div>
                                                                    <div class="col-12">
                                                                        <asp:TextBox class="form-control" ID="txtOtherUsage3" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Visible="false" Style="margin-left: 18px"></asp:TextBox>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>4
                                                                </td>
                                                                <td>
                                                                    <div class="col-12" id="Div52" runat="server">
                                                                        <asp:TextBox class="form-control" AutoPostBack="true" ID="txtEarthingType4" ReadOnly="true" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="col-12" id="Div53" runat="server">
                                                                        <asp:TextBox class="form-control" ID="txtSubstationEarthing4" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="col-12">
                                                                        <asp:TextBox class="form-control" AutoPostBack="true" ID="txtUsedFor4" ReadOnly="true" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                    </div>
                                                                    <div class="col-12">
                                                                        <asp:TextBox class="form-control" ID="txtOtherUsage4" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Visible="false" Style="margin-left: 18px"></asp:TextBox>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </div>


                                                        <tr id="EathingSubstation5" runat="server" visible="false">
                                                            <td>5
                                                            </td>
                                                            <td>
                                                                <div class="col-12" id="Div54" runat="server">
                                                                    <asp:TextBox class="form-control" AutoPostBack="true" ID="txtEarthingType5" ReadOnly="true" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtSubstationEarthing5" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" AutoPostBack="true" ID="txtUsedFor5" ReadOnly="true" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                </div>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtOtherUsage5" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Visible="false" Style="margin-left: 18px"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr id="EathingSubstation6" runat="server" visible="false">
                                                            <td>6
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" AutoPostBack="true" ID="txtEarthingType6" ReadOnly="true" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtSubstationEarthing6" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" AutoPostBack="true" ID="txtUsedFor6" ReadOnly="true" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                </div>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtOtherUsage6" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Visible="false" Style="margin-left: 18px"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr id="EathingSubstation7" runat="server" visible="false">
                                                            <td>7
                                                            </td>
                                                            <td>
                                                                <div class="col-12" id="Div68" runat="server">
                                                                    <asp:TextBox class="form-control" AutoPostBack="true" ID="txtEarthingType7" ReadOnly="true" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtSubstationEarthing7" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" AutoPostBack="true" ID="txtUsedFor7" ReadOnly="true" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                </div>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtOtherUsage7" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Visible="false" Style="margin-left: 18px"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr id="EathingSubstation8" runat="server" visible="false">
                                                            <td>8
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" AutoPostBack="true" ID="txtEarthingType8" ReadOnly="true" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtSubstationEarthing8" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" AutoPostBack="true" ID="txtUsedFor8" ReadOnly="true" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                </div>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtOtherUsage8" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Visible="false" Style="margin-left: 18px"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr id="EathingSubstation9" runat="server" visible="false">
                                                            <td>9
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtEarthingType9" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtSubstationEarthing9" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" AutoPostBack="true" ID="txtUsedFor9" ReadOnly="true" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                </div>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtOtherUsage9" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Visible="false" Style="margin-left: 18px"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr id="EathingSubstation10" runat="server" visible="false">
                                                            <td>10
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtEarthingType10" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtSubstationEarthing10" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" AutoPostBack="true" ID="txtUsedFor10" ReadOnly="true" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                </div>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtOtherUsage10" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Visible="false" Style="margin-left: 18px"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr id="EathingSubstation11" runat="server" visible="false">
                                                            <td>11
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtEarthingType11" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtSubstationEarthing11" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtUsedFor11" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" ReadOnly="true" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                </div>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtOtherUsage11" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Visible="false" Style="margin-left: 18px"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr id="EathingSubstation12" runat="server" visible="false">
                                                            <td>12
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtEarthingType12" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtSubstationEarthing12" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtUsedFor12" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                </div>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtOtherUsage12" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Visible="false" Style="margin-left: 18px"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr id="EathingSubstation13" runat="server" visible="false">
                                                            <td>13
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtEarthingType13" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtSubstationEarthing13" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtUsedFor13" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                </div>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtOtherUsage13" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Visible="false" Style="margin-left: 18px"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr id="EathingSubstation14" runat="server" visible="false">
                                                            <td>14
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtEarthingType14" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtSubstationEarthing14" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtUsedFor14" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                </div>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtOtherUsage14" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Visible="false" Style="margin-left: 18px"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr id="EathingSubstation15" runat="server" visible="false">
                                                            <td>15
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtEarthingType15" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtSubstationEarthing15" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtUsedFor15" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                                                </div>
                                                                <div class="col-12">
                                                                    <asp:TextBox class="form-control" ID="txtOtherUsage15" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Visible="false" Style="margin-left: 18px"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                               <%-- <div class="card" id="TestReportDocument" runat="server" visible="false" style="background: #fcfcfc; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; margin-left: -25px; margin-right: -25px; margin-top: 20px; padding: 15px; padding-bottom: 45px;">
                                    <div class="card-title">
                                        View Documents
                                    </div>
                                    <div class="row">
                                        <div id="Div_NamePlateDocument" runat="server" visible="false" class="col-md-4">
                                            <label>
                                                NamePlate Document
                                            </label>
                                            <br />
                                            <asp:HyperLink ID="HyperLink_NamePlate" runat="server" CssClass="myLink" Text="View Uploaded Report" Target="_blank" />
                                        </div>
                                        <div id="Div_SitePhotograph" runat="server" visible="false" class="col-md-4">
                                            <label>
                                                SitePhotograph Document
                                            </label>
                                            <br />
                                            <asp:HyperLink ID="HyperLink_SitePhotograph" runat="server" CssClass="myLink" Text="View Uploaded Report" Target="_blank" />
                                        </div>
                                    </div>
                                </div>--%>

                                <div class="card">
                                    <div class="row">
                                        <%--  <div class="col-6" id="CreatedDate" visible="false" runat="server">
                                            <label>
                                                Test Report Created Date
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtCreatedDate" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        </div>--%>
                                        <div class="col-6" id="Div1" visible="true" runat="server">
                                            <label>
                                                Installation Type
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtinstalltype" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        </div>
                                        <%-- <div class="col-6" id="SubmitDate" visible="true" runat="server">
                                            <label>
                                                Work Intimation Submitted Date
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtSubmitteddate" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        </div>--%>
                                        <%--  <div class="col-6" id="SubmitBy" visible="false" runat="server">
                                            <label>
                                                Work Intimation Submitted By
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtSubmittedBy" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        </div>--%>
                                    </div>
                                </div>

                                <div class="card-title fw-semibold mb-4" style="font-weight: 700; margin-bottom: 0px !important; margin-top: 3%;">
                                    Work Intimation Details (<asp:Label ID="lblIntimationId" runat="server" />)
                                </div>
                                <div class="row">
                                    <div class="col-4" id="SubmitDate">
                                        <label>
                                            Work Intimation Submitted Date
                                        </label>
                                        <asp:TextBox class="form-control" ID="txtSubmitteddate" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    </div>
                                    <div class="col-4" id="SubmitBy">
                                        <label>
                                            Work Intimation Submitted By
                                        </label>
                                        <asp:TextBox class="form-control" ID="txtSubmittedBy" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="card-title fw-semibold mb-4" style="font-weight: 700; margin-bottom: 0px !important; margin-top: 3%;">
                                    Test Report Details (<asp:Label ID="lblReportNo" runat="server" />)
                                </div>
                                <div id="Div9" runat="server">
                                    <div class="row" style="padding-bottom: 20px;">
                                        <div class="col-4" style="margin-top: 1px;">
                                            <label>
                                                Test Report Created Date
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtCreatedDate" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        </div>
                                        <div class="col-4" id="Div10" runat="server">
                                            <label for="Name">
                                                Prepared By
                                            </label>
                                            <asp:TextBox class="form-control" ReadOnly="true" ID="txtPreparedby" onkeydown="return preventEnterSubmit(event)" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-title fw-semibold mb-4" id="ApprovalTitle" visible="false" runat="server" style="font-weight: 700; margin-bottom: 0px !important; margin-top: 2%;">
                                    Test Report Final Submission Details
                                </div>
                                <div class="row" style="padding-bottom: 20px;" id="DivApproval" visible="false" runat="server">
                                    <div class="col-4" id="Div12" runat="server">
                                        <label>
                                            Test Report Submission Date
                                        </label>
                                        <asp:TextBox class="form-control" ID="txtApprovalDate" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    </div>
                                    <div class="col-4" id="Div13" runat="server">
                                        <label for="Name">
                                            Test Report Submitted By
                                        </label>
                                        <asp:TextBox class="form-control" ID="txtApprovedBy" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4"></div>
                            <div class="col-4">
                                <asp:HiddenField ID="hdnId" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- partial:../../partials/_footer.html -->
            <footer class="footer">
            </footer>
        </div>
    </form>
</body>
</html>
