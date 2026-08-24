<%@ Page Title="" Language="C#" MasterPageFile="~/SiteOwnerPages/SiteOwner.Master" AutoEventWireup="true" CodeBehind="ReapplyReturnINspection.aspx.cs" Inherits="CEIHaryana.SiteOwnerPages.ReapplyReturnINspection" %>

<%@ Register Src="~/UserCPages/InspectionReturnDetails.ascx" TagPrefix="uc1" TagName="InspectionReturnDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="shortcut icon" type="image/png" href="/css2/style.min.css" />
    <link rel="stylesheet" href="/css2/style.css" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.13.5/css/dataTables.bootstrap4.min.css" rel="stylesheet" />

    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.5/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://kit.fontawesome.com/57676f1d80.js" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
        function disableFutureDates() {
            // Get today's date in yyyy-mm-dd format
            var today = new Date().toISOString().split('T')[0];
            // Set the max attribute of the txtDateofIntialissue TextBox to today's date
            document.getElementById('<%=txttransactionDate.ClientID %>').setAttribute('max', today);
        }
    </script>
    <style>
        div#ContentPlaceHolder1_Declaration {
            margin-top: 30px;
            margin-bottom: 30px;
        }

        /* table#ContentPlaceHolder1_RadioButtonList2 {
            margin-top: -28px;
            margin-left: 35%;
        }*/

        input#ContentPlaceHolder1_FileUpload14 {
            padding: 1px;
            height: 32px;
        }

        input#ContentPlaceHolder1_RadioButtonList2_0 {
            margin-right: 5px;
        }

        input#ContentPlaceHolder1_RadioButtonList2_1 {
            margin-right: 5px;
            margin-left: 15px;
        }

        th.headercolor {
            background: #9292cc;
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

        /* .col-4 {
            margin-bottom: 15px;
        }*/

        .form-control {
            box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
            margin-left: 0px !important;
            height: 30px;
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
            font-size: 18px !important;
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

        th.headercolor {
            background: #9292cc;
            color: white;
        }



        td {
            padding: 5px;
            padding-left: 10px;
        }



        th.leftalign {
            text-align: justify;
        }



        th {
            text-align: justify !important;
            padding: 10px;
        }

        .asterisk-1 {
            color: red;
            display: inline;
        }

        .asterisk-0 {
            display: none;
        }

        .ReturnedRowColor {
            background-color: #f9c7c7 !important;
        }

        input#ContentPlaceHolder1_customFile {
            padding: 0px !important;
        }

        .red-text {
            color: red;
        }

        .col-4 {
            margin-bottom: 15px;
        }

        .form-control:disabled, .form-control[readonly] {
            background-color: #e9ecef;
            opacity: 1;
            font-size: 1rem !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="card" style="box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px; border-radius: 5px !important">
            <div class="card-body">
                <div class="card-title" style="text-align: center; font-size: 24px !important;">Resubmit Inspection Request</div>
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-sm-4" style="text-align: center;">
                        <label id="DataUpdated" runat="server" visible="false" style="color: red; font-size: 1.125rem">
                            Data Updated Successfully !!!.
                        </label>
                        <label id="DataSaved" runat="server" visible="false" style="color: red; font-size: 1.125rem">
                            Data Saved Successfully !!!.
                        </label>
                    </div>
                </div>
                <div class="card-body" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px; padding: 25px; margin-bottom: 25px; border-radius: 10px; margin-top: 10px;">
                    <div class="row" id="Test" runat="server" visible="true">
                        <div class="col-4">
                            <label>Inspection Id </label>
                            <asp:TextBox class="form-control" ID="txtInspectionId" ReadOnly="true" MaxLength="6" onkeyup="ValidatePincode();" onKeyPress="return isNumberKey(event);" autocomplete="off" TabIndex="7" runat="server" Style="margin-left: 18px"></asp:TextBox>
                        </div>
                        <div class="col-4">
                            <label>Type of Applicant </label>
                            <asp:TextBox class="form-control" ID="txtApplicantType" ReadOnly="true" MaxLength="6" onkeyup="ValidatePincode();" onKeyPress="return isNumberKey(event);" autocomplete="off" TabIndex="7" runat="server" Style="margin-left: 18px"></asp:TextBox>
                        </div>
                        <div class="col-4">
                            <label>Type of Installation </label>
                            <asp:TextBox class="form-control" ID="txtWorkType" ReadOnly="true" MaxLength="6" onkeyup="ValidatePincode();" onKeyPress="return isNumberKey(event);" autocomplete="off" TabIndex="7" runat="server" Style="margin-left: 18px"></asp:TextBox>
                        </div>
                        <div class="col-4" runat="server">
                            <label>Voltage Level</label>
                            <asp:TextBox class="form-control" ID="txtVoltage" ReadOnly="true" MaxLength="6" onkeyup="ValidatePincode();" onKeyPress="return isNumberKey(event);" autocomplete="off" TabIndex="7" runat="server" Style="margin-left: 18px"></asp:TextBox>
                        </div>
                        <%--<div class="col-4" runat="server">
                            <label>Date</label>
                            <asp:TextBox class="form-control" ID="txtDate" ReadOnly="true" runat="server" autocomplete="off" Style="margin-left: 18px"></asp:TextBox>
                        </div>
                        <div class="col-4" runat="server">
                            <label>Contact Number</label>
                            <asp:TextBox class="form-control" ID="txtContact" ReadOnly="true" runat="server" autocomplete="off" Style="margin-left: 18px"></asp:TextBox>
                        </div>--%>
                        <div class="col-4" runat="server" visible="true">
                            <label>Max Voltage</label>
                            <asp:TextBox class="form-control" ID="txtMaxVoltage" ReadOnly="true" runat="server" autocomplete="off" Style="margin-left: 18px"></asp:TextBox>
                        </div>
                        <div class="col-4" runat="server" visible="true">
                            <label for="Pin">Total Capacity</label>
                            <asp:TextBox class="form-control" ID="txtCapacity" ReadOnly="true" runat="server" autocomplete="off" Style="margin-left: 18px"></asp:TextBox>
                        </div>
                        <div class="col-4" runat="server" visible="true">
                            <label for="Pin">Total Amount</label>
                            <asp:TextBox class="form-control" ID="txtAmount" ReadOnly="true" runat="server" autocomplete="off" Style="margin-left: 18px"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div id="PaymentDetails" runat="server" visible="true">
                    <h7 class="card-title fw-semibold mb-4">Payment Details</h7>
                    <div id="ChallanDetail" runat="server" visible="true" class="card-body" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px; padding: 25px; margin-bottom: 25px; border-radius: 10px; margin-top: 15px;">
                        <div class="row" style="margin-top: 15px; margin-bottom: 15PX !important;">
                        </div>
                        <div class="row" style="margin-top: -40px !important;">
                            <div class="col-4">
                                <label>
                                    Transaction ID(GRN Number)
                                </label>
                                <asp:TextBox ID="txttransactionId" runat="server" ReadOnly="true" class="form-control" Font-Size="12px" Style="height: 30px;"></asp:TextBox><br />
                            </div>
                            <div class="col-4">
                                <label>
                                    Transaction Date
                                </label>
                                <asp:TextBox ID="txttransactionDate" ReadOnly="true" runat="server" class="form-control" Font-Size="12px" Style="height: 30px;"></asp:TextBox><br />
                            </div>
                            <div class="col-4 d-flex flex-column align-items-center justify-content-center" style="height: 100%;">
                                <label style="margin-bottom: 10px; margin-left: -50PX;">
                                    Payment Mode
                               
                                </label>
                                <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal" readonly="true" TabIndex="25">
                                    <asp:ListItem Text="Online" Value="0" Enabled="false"></asp:ListItem>
                                    <asp:ListItem Text="Offline" Value="1" Selected="True"></asp:ListItem>
                                </asp:RadioButtonList>

                            </div>

                            <div class="col-4" style="text-align: center;">
                                <asp:HiddenField ID="hnOwnerId" runat="server" />
                                <asp:HiddenField ID="hnReturnStatus" runat="server" />
                            </div>

                        </div>
                    </div>
                </div>
                <h7 class="card-title fw-semibold mb-4">Inspection Details</h7>
                <div class="card-body" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px; padding: 25px; margin-bottom: 25px; border-radius: 10px; margin-top: 10px;">
                    <div class="row">
                        <div class="col-12">
                            <asp:GridView ID="GridView2" CssClass="table table-bordered table-striped table-responsive" runat="server" AutoGenerateColumns="false">
                                <HeaderStyle BackColor="#B7E2F0" />
                                <Columns>
                                    <asp:TemplateField HeaderText="SNo">
                                        <HeaderStyle Width="5%" CssClass="headercolor" />
                                        <ItemStyle Width="5%" />
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--   <asp:BoundField DataField="Id" HeaderText="Inspection Id">
                                        <HeaderStyle HorizontalAlign="Left" Width="22%" CssClass="headercolor" />
                                        <ItemStyle HorizontalAlign="Left" Width="22%" />
                                    </asp:BoundField>--%>
                                    <asp:BoundField DataField="InstallationType" HeaderText="Installation Type">
                                        <HeaderStyle HorizontalAlign="Left" Width="15%" CssClass="headercolor" />
                                        <ItemStyle HorizontalAlign="Left" Width="15%" />
                                    </asp:BoundField>
                                    <%--                                    <asp:BoundField DataField="ActionTaken" HeaderText="ActionTaken">
                                        <HeaderStyle HorizontalAlign="Left" Width="15%" CssClass="headercolor" />
                                        <ItemStyle HorizontalAlign="Left" Width="15%" />
                                    </asp:BoundField>--%>

                                    <asp:TemplateField HeaderText="ActionTaken">
                                        <HeaderStyle HorizontalAlign="Left" CssClass="headercolor" />
                                        <ItemStyle HorizontalAlign="Left" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblActionTaken" runat="server" Text='<%# Eval("ActionTaken") %>' Visible="false" />
                                            <asp:Label ID="lblInspectionId" runat="server" Text='<%# Eval("Id") %>' Visible="false" />

                                            <!-- If ActionTaken is RETURN, show LinkButton -->
                                            <asp:LinkButton
                                                ID="lnkReturn"
                                                runat="server"
                                                Text="Return"
                                                CommandName="ShowReturnPopup"
                                                CommandArgument='<%# Eval("Id") + "," + Eval("InspectionCount") %>'
                                                OnCommand="lnkReturn_Command"
                                                CssClass="text-danger"
                                                Visible='<%# Eval("ActionTaken").ToString() == "Return" %>' />

                                            <!-- Otherwise, show normal text -->
                                            <asp:Label
                                                ID="lblNormalStatus"
                                                runat="server"
                                                Text='<%# Eval("ActionTaken") %>'
                                                Visible='<%# Eval("ActionTaken").ToString() != "Return" %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ActionDate" HeaderText="ActionDate">
                                        <HeaderStyle HorizontalAlign="Left" Width="15%" CssClass="headercolor" />
                                        <ItemStyle HorizontalAlign="Left" Width="15%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="AssignTo" HeaderText="AssignTo">
                                        <HeaderStyle HorizontalAlign="center" Width="15%" CssClass="headercolor" />
                                        <ItemStyle HorizontalAlign="center" Width="15%" CssClass="red-text" />
                                    </asp:BoundField>
                                    <%--  <asp:BoundField DataField="ReturnDate" HeaderText="ReturnDate">
                                        <HeaderStyle HorizontalAlign="center" Width="15%" CssClass="headercolor" />
                                        <ItemStyle HorizontalAlign="center" Width="15%" />
                                    </asp:BoundField>--%>
                                    <asp:BoundField DataField="Remarks" HeaderText="Remarks">
                                        <HeaderStyle HorizontalAlign="center" Width="15%" CssClass="headercolor" />
                                        <ItemStyle HorizontalAlign="center" Width="15%" />
                                    </asp:BoundField>
                                </Columns>
                                <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <div id="UploadDocuments" runat="server" visible="true">
                    <h7 class="card-title fw-semibold mb-4">Checklist Document</h7>
                    <div class="card-body" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px; padding: 25px; margin-bottom: 25px; border-radius: 10px; margin-top: 10px;">
                        <h7 class="card-title" style="color: #a52a2a; margin-bottom: 5px;">Note: Size of all the Attachments should not be more than 10mb.</h7>
                        <div class="row">
                            <div class="col-12">
                                <asp:GridView ID="grd_Documemnts" CssClass="table table-bordered table-striped table-responsive" runat="server" OnRowDataBound="grd_Documemnts_RowDataBound" OnRowCommand="grd_Documemnts_RowCommand" AutoGenerateColumns="false">
                                    <HeaderStyle BackColor="#B7E2F0" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="SNo">
                                            <HeaderStyle Width="5%" CssClass="headercolor" />
                                            <ItemStyle Width="5%" />
                                            <ItemTemplate>
                                                <%#Container.DataItemIndex+1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="InstallationType" HeaderText="Installation Type" Visible="false">
                                            <HeaderStyle HorizontalAlign="Left" Width="15%" CssClass="headercolor" />
                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DocumentName" HeaderText="Documents Name">
                                            <HeaderStyle HorizontalAlign="Left" Width="15%" CssClass="headercolor" />
                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="File Upload (1MB PDF Only)">
                                            <HeaderStyle HorizontalAlign="Left" CssClass="headercolor leftalign" />
                                            <ItemTemplate>
                                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ReturnedReason" HeaderText="Returned Reason">
                                            <HeaderStyle HorizontalAlign="Left" Width="15%" CssClass="headercolor" />
                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Id" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="LabelRowId" runat="server" Text='<%#Eval("Id") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Id" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="LblInspectionId" runat="server" Text='<%#Eval("InspectionId") %>'></asp:Label>
                                                <asp:Label ID="LblInstallationType" runat="server" Text='<%#Eval("InstallationType") %>'></asp:Label>
                                                <asp:Label ID="LblDocumentID" runat="server" Text='<%#Eval("DocumentID") %>'></asp:Label>
                                                <asp:Label ID="LblDocumentName" runat="server" Text='<%#Eval("DocumentName") %>'></asp:Label>
                                                <asp:Label ID="LblFileName" runat="server" Text='<%#Eval("FileName") %>'></asp:Label>
                                                <asp:Label ID="LblReturnedReason" runat="server" Text='<%#Eval("ReturnedReason") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Old Uploaded Documents" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="4%">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LnkDocumemtPath" runat="server" CommandArgument='<%# Bind("DocumentPath") %>' CommandName="Select">View Document </asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="2%" CssClass="headercolor"></ItemStyle>
                                            <HeaderStyle HorizontalAlign="Left" CssClass="headercolor" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="Div1" runat="server" visible="true">
                    <h7 class="card-title fw-semibold mb-4">Test Reports & Documents Attached in Test Reports</h7>
                    <div class="card-body" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px; padding: 25px; margin-bottom: 25px; border-radius: 10px; margin-top: 10px;">
                        <div class="row">
                            <div class="col-12">
                                <asp:GridView ID="Grid_MultipleInspectionTR" CssClass="table table-bordered table-striped table-responsive"
                                    OnRowDataBound="Grid_MultipleInspectionTR_RowDataBound" OnRowCommand="Grid_MultipleInspectionTR_RowCommand" runat="server" AutoGenerateColumns="false">
                                    <HeaderStyle BackColor="#B7E2F0" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="SNo">
                                            <HeaderStyle Width="5%" CssClass="headercolor" />
                                            <ItemStyle Width="5%" />
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="InstallationType" HeaderText="InstallationType">
                                            <HeaderStyle HorizontalAlign="Left" Width="15%" CssClass="headercolor" />
                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="TestReportId" HeaderText="TestReportId" Visible="false">
                                            <HeaderStyle HorizontalAlign="Left" Width="15%" CssClass="headercolor" />
                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Id" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="LblRowid" runat="server" Text='<%#Eval("id") %>'></asp:Label>
                                                <asp:Label ID="LblInstallationName" runat="server" Text='<%#Eval("Typeofinstallation") %>'></asp:Label>
                                                <asp:Label ID="LblTestReportCount" runat="server" Text='<%#Eval("Count") %>'></asp:Label>
                                                <asp:Label ID="LblInspectionId" runat="server" Text='<%#Eval("InspectionId") %>'></asp:Label>
                                                <asp:Label ID="LblTestReportId" runat="server" Text='<%#Eval("TestReportId") %>'></asp:Label>
                                                <asp:Label ID="LblIntimationId" runat="server" Text='<%#Eval("IntimationId") %>'></asp:Label>
                                                <asp:Label ID="LblinstallaionInvoicePath" runat="server" Text='<%#Eval("installaionInvoice") %>'></asp:Label>
                                                <asp:Label ID="LblManufacturingReportPath" runat="server" Text='<%#Eval("ManufacturingReport ") %>'></asp:Label>
                                                <asp:Label ID="LblReturnedReason" runat="server" Text='<%#Eval("ReturnedReason ") %>'></asp:Label>

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="View Test Report" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="4%">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkRedirectTR" runat="server" Text="View Test Report" CommandName="Select" CommandArgument='<%# Eval("TestReportId") %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="2%" CssClass="headercolor"></ItemStyle>
                                            <HeaderStyle HorizontalAlign="Left" CssClass="headercolor" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Installaion Invoice">
                                            <HeaderStyle HorizontalAlign="Left" CssClass="headercolor leftalign" />
                                            <ItemTemplate>
                                                <asp:FileUpload ID="FileUploadInstallaionInvoice" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Manufacturing Report">
                                            <HeaderStyle HorizontalAlign="Left" CssClass="headercolor leftalign" />
                                            <ItemTemplate>
                                                <asp:FileUpload ID="FileUploadManufacturingReport" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ReturnedReason" HeaderText="Returned Reason">
                                            <HeaderStyle HorizontalAlign="Left" Width="15%" CssClass="headercolor" />
                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Old Installaion Invoice" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="4%">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkInstallaionInvoice" runat="server" Text="View Document" CommandName="ViewInvoice" CommandArgument='<%# Eval("installaionInvoice") %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="2%" CssClass="headercolor"></ItemStyle>
                                            <HeaderStyle HorizontalAlign="Left" CssClass="headercolor" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Old Manufacturing Report" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="4%">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkManufacturingReport" runat="server" Text="View Document" CommandName="View" CommandArgument='<%# Eval("ManufacturingReport") %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="2%" CssClass="headercolor"></ItemStyle>
                                            <HeaderStyle HorizontalAlign="Left" CssClass="headercolor" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div> 
                <uc1:InspectionReturnDetails runat="server" id="InspectionReturnDetails" /> 
                <div>
                    <div class="row">
                        <div class="col-12" style="text-align: center;">
                            <asp:Button ID="btnSubmit" Text="Submit" runat="server" ValidationGroup="Submit" class="btn btn-primary mr-2" OnClick="btnSubmit_Click" />
                            <asp:Button type="Back" ID="btnBack" Text="Back" runat="server" Visible="true" class="btn btn-primary mr-2" OnClick="btnBack_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="footer">
    </footer>
    <script type="text/javascript">
        function alertWithRedirectdata() {
            alert('Inspection Request Submitted Successfully, forwarding to concerned officer.');
            window.location.href = "/SiteOwnerPages/InspectionRequestPrint.aspx";
        }
    </script>
    <script type="text/javascript">
        function alertWithRedirect() {
            if (confirm('Select all PDF files only')) {
            } else {
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
    <script src="/Assets/js/js/vendor.bundle.base.js"></script>
</asp:Content>
