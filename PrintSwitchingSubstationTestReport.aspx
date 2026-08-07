<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintSwitchingSubstationTestReport.aspx.cs" Inherits="CEIHaryana.UserPages.PrintSwitchingSubstationTestReport" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        div#SubmitBy{
            margin-top:1px;
        }
        div#SubmitDate{
            margin-top:1px;
        }
        div#Div10{
            margin-top:1px;
        }
        div#Div12{
            margin-top:1px;
        }
        div#Div13{
            margin-top:1px;
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
        th.headercolor.textalignCenter {
    width: 1%;
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
                            Style="margin-top: 5px; margin-bottom: -40px; font-size: 20px; padding-left: 25px; padding-right: 25px; position: fixed; margin-left: -100px; z-index: 50; background:blue !important;" OnClientClick="printDiv('printableDiv');" />
                    </div>
                    <div class="card-body">
                        <div id="printableDiv">
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
                                            <div class="col-4" id="Div" runat="server">
                                                <label for="Voltage">
                                                    Serial Number 
                                                </label>
                                                <asp:TextBox class="form-control" AutoPostBack="true" ReadOnly="true" ID="txtSerial" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                            </div>
                                            <div class="col-4" id="Div2" runat="server">
                                                <label>
                                                    Voltage of Switching Station
                                                </label>
                                                <asp:TextBox class="form-control" AutoPostBack="true" ReadOnly="true" ID="txtVoltage" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                            </div>
                                            <div class="col-4" id="Div3" runat="server">
                                                <label>
                                                    Name of Switching Station
                                                </label>
                                                <asp:TextBox class="form-control" AutoPostBack="true" ReadOnly="true" ID="txtSwitchingName" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                            </div>
                                            <div class="col-4" id="Div121" runat="server">
                                                <label>
                                                    Type of Breaker
                                                </label>
                                                <asp:TextBox class="form-control" AutoPostBack="true" ReadOnly="true" ID="txtBreakerType" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                            </div>
                                            <div class="col-4" id="Other" runat="server" visible="false">
                                                <label for="Voltage">
                                                    Other Breaker
                                                </label>
                                                <asp:TextBox class="form-control" AutoPostBack="true" ReadOnly="true" ID="txtOtherBreakerType" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                            </div>
                                            <div class="col-4">
                                                <label>
                                                    Total No. of Breakers
                                                </label>
                                                <asp:TextBox class="form-control" AutoPostBack="true" ReadOnly="true" ID="txtTotalBreaker" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                            </div>
                                            <div class="col-4">
                                                <label>
                                                    Capacity of Station Transformer(in Kva)
                                                </label>
                                                <asp:TextBox class="form-control" AutoPostBack="true" ReadOnly="true" ID="txtCapacity" MaxLength="10" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
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
                                            <div class="table-responsive pt-3" id="SubstationEarthingDiv" runat="server" style="margin-left: 0px;">
                                                <asp:GridView ID="GridView1" class="table-responsive table table-hover table-striped" runat="server" Width="100%" AutoGenerateColumns="false" BorderWidth="1px" BorderColor="#dbddff">
                                                    <Columns>

                                                        <asp:BoundField DataField="RowNumber" HeaderText="Sr No.">
                                                            <HeaderStyle HorizontalAlign="center" CssClass="headercolor textalignCenter" />
                                                            <ItemStyle HorizontalAlign="center" />
                                                        </asp:BoundField>

                                                        <asp:BoundField DataField="EarthingType" HeaderText="Earthing Type">
                                                            <HeaderStyle HorizontalAlign="Center" CssClass="headercolor textalignCenter" />
                                                            <ItemStyle HorizontalAlign="Center" CssClass="textalignCenter" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="ValueInOhm" HeaderText="Value in(ohms)">
                                                            <HeaderStyle HorizontalAlign="center" CssClass="headercolor textalignCenter" />
                                                            <ItemStyle HorizontalAlign="center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="UsedFor" HeaderText="Used For">
                                                            <HeaderStyle HorizontalAlign="center" CssClass="headercolor textalignCenter" />
                                                            <ItemStyle HorizontalAlign="center" />
                                                        </asp:BoundField>

                                                    </Columns>
                                                    <FooterStyle BackColor="White" ForeColor="#000066" />
                                                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Center" />
                                                    <RowStyle ForeColor="#000066" />
                                                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
                                <div class="card-title fw-semibold mb-4" style="font-weight: 700; margin-bottom: 0px !important;margin-top:3%;">
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
                                <div class="card-title fw-semibold mb-4" style="font-weight: 700; margin-bottom: 0px !important;margin-top:3%;">
                                    Test Report Details (<asp:Label ID="lblReportNo" runat="server" />)
                                </div>
                                <div id="Div9" runat="server">
                                    <div class="row" style="padding-bottom: 20px;">
                                        <div class="col-4" style="margin-top:1px;">
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
                                <div class="card-title fw-semibold mb-4" id="ApprovalTitle" visible="false" runat="server" style="font-weight: 700; margin-bottom: 0px !important;margin-top:2%;">
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
