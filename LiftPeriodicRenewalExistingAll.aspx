<%@ Page Title="" Language="C#" MasterPageFile="~/SiteOwnerPages/SiteOwner.Master" AutoEventWireup="true" CodeBehind="LiftPeriodicRenewalExistingAll.aspx.cs" Inherits="CEIHaryana.SiteOwnerPages.LiftPeriodicRenewalExistingAll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="shortcut icon" type="image/png" href="/css2/style.min.css" />
    <link rel="stylesheet" href="/css2/style.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-rc.0/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-rc.0/js/select2.min.js"></script>
    <link href="https://cdn.datatables.net/1.13.11/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.13.11/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.11/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://kit.fontawesome.com/57676f1d80.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/solid.min.css" integrity="sha512-P9pgMgcSNlLb4Z2WAB2sH5KBKGnBfyJnq+bhcfLCFusrRc4XdXrhfDluBl/usq75NF5gTDIMcwI1GaG5gju+Mw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc" crossorigin="anonymous"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        th.headercolor {
            background: #9292cc;
            color: white;
        }

        .table-dark {
            text-align: center !important;
            background-color: #9292cc !important;
        }

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

        .card .card-title {
            font-size: 1rem !important;
        }

        .card {
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
        }

        .btn-primary:hover {
            box-shadow: rgba(50, 50, 93, 0.25) 0px 30px 60px -12px inset, rgba(0, 0, 0, 0.3) 0px 18px 36px -18px inset;
        }

        button.btn.btn-primary.mr-2 {
            padding: 10px 25px 10px 25px;
            font-size: 18px;
        }

        input[type="radio"], input[type="checkbox"] {
            margin-right: 5px;
            box-sizing: border-box;
            padding: 0;
        }

        .table-responsive {
            width: 100%;
        }

        .wrap-text {
            white-space: normal;
            word-wrap: break-word;
            word-break: break-word;
            max-width: 200px;
            overflow: hidden;
            word-break: break-all;
        }

        .record-scroll {
            max-height: 350px;
            overflow-y: auto;
        }

        /* More Info popup */
        .info-modal-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
            z-index: 1050;
        }

        .info-modal-box {
            background: #fff;
            border-radius: 8px;
            width: 90%;
            max-width: 900px;
            max-height: 85vh;
            display: flex;
            flex-direction: column;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.3);
        }

        .info-modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 20px;
            border-bottom: 1px solid #dee2e6;
            background: #9292cc;
            color: white;
            border-radius: 8px 8px 0 0;
        }

        .info-modal-header h5 {
            margin: 0;
            font-size: 16px;
        }

        .info-modal-close {
            background: none;
            border: none;
            color: white;
            font-size: 26px;
            line-height: 1;
            cursor: pointer;
        }

        .info-modal-body {
            padding: 20px;
            overflow-y: auto;
        }

        .info-modal-body .info-item {
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .info-modal-footer {
            padding: 10px 20px;
            border-top: 1px solid #dee2e6;
            text-align: right;
        }

        .info-item {
            margin-bottom: 14px;
        }

        .info-item .info-label {
            display: block;
            font-size: 12px;
            color: #6c757d;
            margin-bottom: 2px;
        }

        .info-item .info-value {
            display: block;
            font-size: 14px;
            font-weight: 600;
            color: #000066;
            word-break: break-word;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="card-body" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px; background: white; padding: 25px; margin-bottom: 25px; border-radius: 10px; margin-top: 10px;">
            <div class="card-title" style="margin-bottom: 5px; font-size: 22px; font-weight: 600; margin-left: -10px; margin-bottom: 15px; text-align: center;">
                Lift/Escalator Renewal
            </div>

            <%-- 1) Records list (Lift + Escalator): row select karne par neeche details aayengi --%>
            <div id="divSelectRecord" runat="server">
                <div class="card-title" style="margin-bottom: 5px; font-size: 17px; font-weight: 600; margin-left: -10px; margin-bottom: 15px;">
                    Select Lift / Escalator
                </div>
               <div class="card" style="margin: -11px; padding: 11px; margin-bottom: 20px;">

<div class="row align-items-center">
    
    <div class="col-md-4">
        <asp:TextBox
            class="form-control"
            ID="txtSearch"
            autocomplete="off"
            placeholder="Search"
            runat="server"
            Style="margin-left: 18px"
            onkeyup="Search_Gridview(this)"
            onkeydown="SearchOnEnter(event)" Visible ="false" >
            
        </asp:TextBox>
    </div>

    <div class="col-md-8 text-end" style="text-align:right">
        <asp:Label
            ID="lblAddNew"
            runat="server"
            Text="Click To Add Existing Lift/Escalator which not added"
            Style="font-weight: 600; margin-right: 10px;">
        </asp:Label>

        <asp:Button
            ID="btnAddnew"
            runat="server"
             OnClick="btnAddnew_Click"
            CssClass="btn btn-primary"
            Text="Add Lift/Escalator" />
    </div>

</div>

                    <hr />
                    <div class="row">
                        <div class="col-md-12 record-scroll">
                            <asp:GridView class="table-responsive table table-hover table-striped" ID="GridView1" OnRowCommand="GridView1_RowCommand" runat="server" AutoGenerateColumns="false">
                                <PagerStyle CssClass="pagination-ys" />
                                <Columns>
                                    <asp:TemplateField>
                                        <HeaderStyle Width="10%" CssClass="headercolor" />
                                        <ItemStyle Width="10%" Font-Bold="true" />
                                        <HeaderTemplate>
                                            Registration No
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument='<%#Eval("RegistrationNo") %>' CommandName="Select" CausesValidation="false"><%#Eval("RegistrationNo") %></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="InstallationType" HeaderText="Type" >
                                        <HeaderStyle HorizontalAlign="Center" Width="10%" CssClass="headercolor" />
                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Make" HeaderText="Make">
                                        <HeaderStyle HorizontalAlign="Center" Width="25%" CssClass="headercolor" />
                                        <ItemStyle HorizontalAlign="Center" Width="25%" CssClass="wrap-text" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TypeOfControl" HeaderText="Type Of Control">
                                        <HeaderStyle HorizontalAlign="Center" Width="15%" CssClass="headercolor" />
                                        <ItemStyle HorizontalAlign="Center" Width="15%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Capacity" HeaderText="Capacity(Persons)">
                                        <HeaderStyle HorizontalAlign="Center" Width="10%" CssClass="headercolor" />
                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="District" HeaderText="District">
                                        <HeaderStyle HorizontalAlign="Center" Width="20%" CssClass="headercolor" />
                                        <ItemStyle HorizontalAlign="Center" Width="20%" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Action">
                                        <HeaderStyle HorizontalAlign="Center" Width="10%" CssClass="headercolor" />
                                        <ItemStyle HorizontalAlign="Center" Width="10%" Font-Bold="true" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkSelect" runat="server" CommandName="Select" CommandArgument='<%#Eval("RegistrationNo") %>' CausesValidation="false">Select</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Id" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="LblRegistrationNo" runat="server" Text='<%#Eval("RegistrationNo") %>'></asp:Label>
                                            <asp:Label ID="LblInstallationType" runat="server" Text='<%#Eval("InstallationType") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="White" ForeColor="#000066" />
                                <HeaderStyle BackColor="#9292cc" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Center" />
                                <RowStyle ForeColor="#000066" />
                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#00547E" />
                            </asp:GridView>
                            <label id="LblGridView1" runat="server"></label>
                        </div>
                    </div>
                </div>
            </div>

            <%-- 2) Sirf 3 details: row select hone ke baad dikhengi --%>
            <div class="card-title" id="divInspectiondetailsLabel" runat="server" visible="false" style="margin-bottom: 5px; font-size: 17px; font-weight: 600; margin-left: -10px; margin-bottom: 15px;">
                Lift/Escalator Detail
            </div>
            <div class="card" id="divInspectiondetails" runat="server" visible="false" style="margin: -11px; padding: 11px; margin-bottom: 20px;">
                <div class="row">
                    <div class="col-md-4">
                        <label>
                            Registration No.<samp style="color: red"> * </samp>
                        </label>
                        <asp:TextBox class="form-control" ID="txtRegistrationNo" ReadOnly="true" autocomplete="off" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RfvtxtRegistrationNo" ControlToValidate="txtRegistrationNo" runat="server"
                            ForeColor="Red" ValidationGroup="Submit" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-4">
                        <label>
                            Last Expiry Date<samp style="color: red"> * </samp>
                        </label>
                        <asp:TextBox type="date" class="form-control" ID="txtExpiryDate" ReadOnly="true" autocomplete="off" runat="server" Style="width: 100% !important;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="txtExpiryDate" runat="server" ForeColor="Red" ValidationGroup="Submit" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-4">
                        <label>
                            Last date of payment<samp style="color: red"> * </samp>
                        </label>
                        <asp:TextBox type="date" class="form-control" ID="txtLastdateOfPayment" autocomplete="off" runat="server" Style="width: 100% !important;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtLastdateOfPayment" runat="server" ForeColor="Red" ValidationGroup="Submit" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row" style="margin-top: 8px;">
                    <div class="col-md-12">
                        <a href="javascript:void(0);" onclick="openInfoModal(); return false;" style="font-size: 13px; font-weight: 600;">
                            <i class="fa fa-info-circle"></i>&nbsp;More Info
                        </a>
                    </div>
                </div>
            </div>

            <%-- 3) Attachments: row select hone ke baad dikhenge --%>
            <div id="divLabelLiftAttachments" runat="server" visible="false" class="card-title" style="margin-bottom: 5px; font-size: 17px; font-weight: 600; margin-left: -10px; margin-bottom: 15px;">
                Attachments
            </div>
            <div class="card" id="divLiftAttachments" runat="server" visible="false" style="margin: -11px; padding: 11px; margin-bottom: 20px;">
                <asp:GridView class="table-responsive table table-hover table-striped" ID="Grd_Document" runat="server" AutoGenerateColumns="false">
                    <PagerStyle CssClass="pagination-ys" />
                    <Columns>
                        <asp:BoundField DataField="SNo" HeaderText="SNo" />
                        <asp:TemplateField HeaderText="Document Name">
                            <HeaderStyle HorizontalAlign="center" Width="85%" CssClass="headercolor leftalign" />
                            <ItemStyle HorizontalAlign="center" Width="85%" />
                            <ItemTemplate>
                                <asp:Label ID="lblDocumentName" runat="server" Text='<%#Eval("DocumentName") %>'></asp:Label>
                                <asp:Label ID="lblMandatory1" runat="server" Text="*" ForeColor="Red" Visible='<%# Eval("DocumentName").ToString() != "Other Document" %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="File Upload (1MB PDF Only)">
                            <HeaderStyle HorizontalAlign="Left" CssClass="headercolor leftalign" />
                            <ItemTemplate>
                                <asp:FileUpload ID="FileUpload1" runat="server" onchange="return validateFileUpload(this);" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Id" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="LblDocumentID" runat="server" Text='<%#Eval("DocumentID") %>'></asp:Label>
                                <asp:Label ID="LblShortName" runat="server" Text='<%#Eval("DocumentShortName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#9292cc" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Center" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
            </div>

            <div class="row" style="margin-top: 25px;">
                <div class="col-6" style="text-align: end; padding-right: 0px;">
                    <asp:Button ID="btnSubmit" Text="Save" Visible="false" runat="server" OnClick="btnSubmit_Click" ValidationGroup="Submit" class="btn btn-primary mr-2" Style="padding-left: 30px; padding-right: 30px;" />
                    <asp:Button ID="btnReset" Text="Reset" Visible="false" runat="server" OnClick="btnReset_Click" CausesValidation="false" class="btn btn-primary mr-2" Style="padding-left: 30px; padding-right: 30px;" />
                </div>
                <div class="col-6" style="text-align: left; padding-left: 0px;">
                    <asp:Button ID="btnBack" Style="padding-left: 35px; padding-right: 35px;" OnClick="btnBack_Click" Text="Back" runat="server" class="btn btn-primary mr-2" CausesValidation="false" />
                </div>
            </div>
        </div>
    </div>

    <%-- More Info popup (sirf display; values backend se Labels me bharti hain) --%>
    <div id="moreInfoModal" class="info-modal-overlay" onclick="if (event.target === this) closeInfoModal();">
        <div class="info-modal-box">
            <div class="info-modal-header">
                <h5>Registration Details</h5>
                <button type="button" class="info-modal-close" onclick="closeInfoModal()" aria-label="Close">&times;</button>
            </div>
            <div class="info-modal-body">
                <div class="row">
                    <div class="col-md-4 info-item">
                        <span class="info-label">Installation Type</span>
                        <asp:Label ID="lblInfoInstallationType" runat="server" CssClass="info-value"></asp:Label>
                    </div>
                    <div class="col-md-4 info-item">
                        <span class="info-label">Make</span>
                        <asp:Label ID="lblInfoMake" runat="server" CssClass="info-value"></asp:Label>
                    </div>
                    <div class="col-md-4 info-item">
                        <span class="info-label">Serial No.</span>
                        <asp:Label ID="lblInfoSerialNo" runat="server" CssClass="info-value"></asp:Label>
                    </div>
                    <div class="col-md-4 info-item">
                        <span class="info-label">Type of Lift / Escalator</span>
                        <asp:Label ID="lblInfoType" runat="server" CssClass="info-value"></asp:Label>
                    </div>
                    <div class="col-md-4 info-item">
                        <span class="info-label">Type of Control</span>
                        <asp:Label ID="lblInfoControl" runat="server" CssClass="info-value"></asp:Label>
                    </div>
                    <div class="col-md-4 info-item">
                        <span class="info-label">Date of Erection</span>
                        <asp:Label ID="lblInfoErection" runat="server" CssClass="info-value"></asp:Label>
                    </div>
                    <div class="col-md-4 info-item">
                        <span class="info-label">Capacity (Persons)</span>
                        <asp:Label ID="lblInfoCapacity" runat="server" CssClass="info-value"></asp:Label>
                    </div>
                    <div class="col-md-4 info-item">
                        <span class="info-label">Capacity (In Kg)</span>
                        <asp:Label ID="lblInfoWeight" runat="server" CssClass="info-value"></asp:Label>
                    </div>
                    <div class="col-md-4 info-item">
                        <span class="info-label">District</span>
                        <asp:Label ID="lblInfoDistrict" runat="server" CssClass="info-value"></asp:Label>
                    </div>
                    <div class="col-md-4 info-item">
                        <span class="info-label">Memo No.</span>
                        <asp:Label ID="lblInfoMemoNo" runat="server" CssClass="info-value"></asp:Label>
                    </div>
                    <div class="col-md-4 info-item">
                        <span class="info-label">Memo Date</span>
                        <asp:Label ID="lblInfoMemoDate" runat="server" CssClass="info-value"></asp:Label>
                    </div>
                    <div class="col-md-12 info-item">
                        <span class="info-label">Site Address</span>
                        <asp:Label ID="lblInfoSiteAddress" runat="server" CssClass="info-value"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="info-modal-footer">
                <button type="button" class="btn btn-secondary" onclick="closeInfoModal()">Close</button>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function openInfoModal() {
            document.getElementById("moreInfoModal").style.display = "flex";
        }

        function closeInfoModal() {
            document.getElementById("moreInfoModal").style.display = "none";
        }

        // Esc dabane par popup band
        document.addEventListener("keydown", function (e) {
            if (e.key === "Escape") {
                closeInfoModal();
            }
        });
    </script>
    <script type="text/javascript">
        // Grid ke rows me search
        function Search_Gridview(strKey) {
            var strData = strKey.value.toLowerCase().split(" ");
            var tblData = document.getElementById("<%=GridView1.ClientID %>");
            if (!tblData) return;

            for (var i = 1; i < tblData.rows.length; i++) {
                var rowData = tblData.rows[i].textContent.toLowerCase();
                var styleDisplay = '';
                for (var j = 0; j < strData.length; j++) {
                    if (rowData.indexOf(strData[j]) < 0) {
                        styleDisplay = 'none';
                        break;
                    }
                }
                tblData.rows[i].style.display = styleDisplay;
            }
        }

        // Enter dabane par form submit na ho, sirf search chale
        function SearchOnEnter(event) {
            if (event.keyCode === 13) {
                event.preventDefault();
                Search_Gridview(document.getElementById('<%=txtSearch.ClientID %>'));
            }
        }
    </script>
    <script type="text/javascript">
        // PDF only, max 1MB
        function validateFileUpload(sender) {
            if (!sender.files || sender.files.length === 0) {
                return true;
            }
            var filePath = sender.value;
            var fileExtension = filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase();
            var fileSize = sender.files[0].size;

            if (fileExtension !== "pdf") {
                alert("Only PDF files are allowed.");
                sender.value = "";
                return false;
            }
            if (fileSize > 1048576) {
                alert("File size should not exceed 1MB.");
                sender.value = "";
                return false;
            }
            return true;
        }
    </script>
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            const today = new Date();
            const minDate = new Date();
            minDate.setFullYear(today.getFullYear() - 20);
            const nextMonth = new Date(today);
            nextMonth.setMonth(today.getMonth() + 1);

            const formattedToday = today.toISOString().split('T')[0];
            const formattedMinDate = minDate.toISOString().split('T')[0];
            const formattedMaxMonthDate = nextMonth.toISOString().split('T')[0];

            // Last Expiry Date: max = agle mahine tak, min = 20 saal pehle
            const txtExpiryDate = document.getElementById('<%= txtExpiryDate.ClientID %>');
            if (txtExpiryDate) {
                txtExpiryDate.setAttribute("max", formattedMaxMonthDate);
                txtExpiryDate.setAttribute("min", formattedMinDate);
            }

            // Last date of payment: future date nahi, min = 20 saal pehle
            const txtLastPayment = document.getElementById('<%= txtLastdateOfPayment.ClientID %>');
            if (txtLastPayment) {
                txtLastPayment.setAttribute("max", formattedToday);
                txtLastPayment.setAttribute("min", formattedMinDate);
            }
        });
    </script>
    <script type="text/javascript">
        function alertWithRedirectdata() {
            if (confirm('Application Submitted successfully.')) {
                window.location.href = "/SiteOwnerPages/LiftPeriodic.aspx";
            }
        }

        function alertWithReturnRedirectdata() {
            if (confirm('Application Submitted successfully.')) {
                window.location.href = "/SiteOwnerPages/ReturnLiftInspections.aspx";
            }
        }
    </script>
</asp:Content>
