<%@ Page Title="" Language="C#" MasterPageFile="~/SiteOwnerPages/SiteOwner.Master" AutoEventWireup="true" CodeBehind="LiftPeriodicRenewal.aspx.cs" Inherits="CEIHaryana.SiteOwnerPages.LiftPeriodicRenewal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="shortcut icon" type="image/png" href="/css2/style.min.css" />
    <link rel="stylesheet" href="/css2/style.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-rc.0/css/select2.min.css" rel="stylesheet" />
   <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-rc.0/js/select2.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
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
        .modal-dialog {
            max-width: 80%;
            width: 100%;
            margin: 30px auto;
        }

        .modal-content {
            height: auto;
            overflow: visible;
        }

        .modal-body {
            max-height: 70vh;
            overflow-y: auto;
        }

        .fa-magnifying-glass:before, .fa-search:before {
            content: "\f002";
            COLOR: WHITE;
        }

        .modal .modal-dialog {
            margin-top: 100px;
            margin-left: 23%;
        }

        .modal {
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

        .modal-dialog {
            background: #fff;
            border-radius: 5px;
            padding: 20px;
            max-width: 70%;
            width: 100%;
        }

        input#ContentPlaceHolder1_customFile {
            padding: 0px;
        }

        th.headercolor {
            background: #9292cc;
            color: white;
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

        .card {
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
        }

        input[type="radio"], input[type="checkbox"] {
            margin-right: 5px;
            box-sizing: border-box;
            padding: 0;
        }
        /* Style for the modal */
        #searchModal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }

        /* Style for the GridView inside the modal */
        .modal-grid-container {
            width: 80%;
            max-height: 70%;
            overflow-y: auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
        }

        /* Optional: Style for the grid itself */
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

        i.fa.fa-search {
            padding: 0px 10px 0px 10px !important;
        }

        a#ContentPlaceHolder1_lnkbtnSearch {
            border-radius: 5px !important;
        }

        .input-group {
            width: 95% !important;
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
            <div class="card-title" style="margin-bottom: 5px; font-size: 17px; font-weight: 600; margin-left: -10px; margin-bottom: 15px;">
                Installation Details
            </div>
            <div class="card" style="margin: -11px; padding: 11px; margin-bottom: 20px;">
                <div class="row">
                    <div class="col-md-4" runat="server">
                        <label>
                            Installation Type<samp style="color: red"> * </samp>
                        </label>
                        <asp:DropDownList Style="width: 100% !important;" class="form-control select-form select2" ID="ddlInstallationType" OnSelectedIndexChanged="ddlInstallationType_SelectedIndexChanged" AutoPostBack="true" runat="server">
                            <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Lift"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Escalator"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="ddlInstallationType" InitialValue="0" runat="server" ForeColor="Red" ValidationGroup="Submit" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-4" runat="server" style="margin-top: auto; margin-bottom: auto;">
                        <span style="color: red; font-weight: 700;">Note: <span style="color: green; font-weight: 700;"> Please select Installation Type First.
                        </span></span>
                    </div>
                </div>
            </div>
            <div class="card-title" id="divInspectiondetailsLabel" runat="server" visible="true" style="margin-bottom: 5px; font-size: 17px; font-weight: 600; margin-left: -10px; margin-bottom: 15px;">
                Inspection Detail
            </div>
            <div class="card" id="divInspectiondetails" runat="server" visible="true" style="margin: -11px; padding: 11px; margin-bottom: 20px;">
                <div class="row">
                    <div class="col-md-4">
                        <label>
                            Registration No.<samp style="color: red"> * </samp>
                        </label>
                        <div class="input-group">
                            <asp:TextBox class="form-control" ID="txtRegistrationNo" MaxLength="20" autocomplete="off" runat="server"
                                Style="margin-right: 5px;" AutoPostBack="true" OnTextChanged="txtRegistrationNo_TextChanged"></asp:TextBox>
                            <div class="input-group-append">
                                <asp:LinkButton ID="lnkbtnSearch" CssClass="btn btn-primary" runat="server" Style="height: 100%; padding: 2px 0px 0px 8px !important;">
                                <i class="fa fa-search"></i>
                                </asp:LinkButton>
                            </div>
                        </div>
                        <asp:RequiredFieldValidator ID="RfvtxtRegistrationNo" ControlToValidate="txtRegistrationNo" runat="server"
                            ForeColor="Red" ValidationGroup="Submit" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-4" runat="server">
                        <label>
                            Last Expiry Date<samp style="color: red"> * </samp>
                        </label>
                        <asp:TextBox type="date" class="form-control" ID="txtExpiryDate" autocomplete="off" runat="server" Style="margin-left: 18px; width: 100% !important;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="txtExpiryDate" runat="server" ForeColor="Red" ValidationGroup="Submit" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-4" runat="server">
                        <label>
                            Last date of payment<samp style="color: red"> * </samp>
                        </label>
                        <asp:TextBox type="date" class="form-control" ID="txtLastdateOfPayment" autocomplete="off" runat="server" Style="margin-left: 18px; width: 100% !important;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtLastdateOfPayment" runat="server" ForeColor="Red" ValidationGroup="Submit" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </div>
                    <%--<div class="col-md-3">
                        <label class="form-label" for="customFile">
                            Upload Previous Challan<samp style="color: red"> * </samp>
                        </label>
                        <asp:FileUpload ID="customFile" runat="server" CssClass="form-control" Style="margin-left: 18px; padding: 0px; font-size: 15px;" accept=".pdf" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="customFile" ValidationGroup="Submit" ForeColor="Red" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </div>--%>
                </div>
            </div>
            <div class="card-title" id="divLiftDetails" runat="server" visible="false" style="margin-bottom: 5px; font-size: 17px; font-weight: 600; margin-left: -10px; margin-bottom: 15px;">
                Lift Details
            </div>
            <div class="card-title" id="divEscalatorDetails" runat="server" visible="false" style="margin-bottom: 5px; font-size: 17px; font-weight: 600; margin-left: -10px; margin-bottom: 15px;">
                Escalator Details
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="card" id="divdetails" runat="server" visible="false" style="margin: -11px; padding: 11px; margin-bottom: 20px;">
                        <div class="row">
                            <div class="col-md-4" runat="server">
                                <label id="lblMake" runat="server">
                                    Make
                                </label>
                                <samp style="color: red">* </samp>
                                <asp:TextBox class="form-control" ID="txtMake" MaxLength="150" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RfvtxtMake" ControlToValidate="txtMake" runat="server" ForeColor="Red" ValidationGroup="Submit" ErrorMessage="Required"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-4" runat="server">
                                <label>
                                    Serial No.<samp style="color: red"> * </samp>
                                </label>
                                <asp:TextBox class="form-control" ID="txtSerialNo" MaxLength="20" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RfvtxtSerialNo" ControlToValidate="txtSerialNo" runat="server" ForeColor="Red" ValidationGroup="Submit" ErrorMessage="Required"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-4" runat="server">
                                <label>
                                    Date of Erection<samp style="color: red"> * </samp>
                                </label>
                                <asp:TextBox type="date" class="form-control" ID="txtDateofErection" autocomplete="off" runat="server" Style="margin-left: 18px" onblur="validateErectionDateLimit()"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtDateofErection" runat="server" ForeColor="Red" ValidationGroup="Submit" ErrorMessage="Required"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-4">
                                <label id="lblTypeOfLift" runat="server">
                                    Type of Lift
                                </label>
                                <samp style="color: red">* </samp>
                                <asp:RadioButtonList ID="RadioBtnType" AutoPostBack="true" runat="server" RepeatDirection="Horizontal" Visible="false">
                                    <asp:ListItem Text="Passenger lift" Value="0" style="margin-top: auto; margin-bottom: auto; padding-left: 10px;"></asp:ListItem>
                                    <asp:ListItem Text="Goods Lift" Value="1" style="margin-top: auto; margin-bottom: auto; padding-left: 10px;"></asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="rvfRadioButtonList" ErrorMessage="Choose one" ControlToValidate="RadioBtnType" Visible="false" runat="server" ValidationGroup="Submit" SetFocusOnError="true" ForeColor="Red" />
                                <asp:RadioButtonList ID="RadioBtnEscType" AutoPostBack="true" runat="server" RepeatDirection="Horizontal" Visible="false">
                                    <asp:ListItem Text="Travelator" Value="0" style="margin-top: auto; margin-bottom: auto; padding-left: 10px;"></asp:ListItem>
                                    <asp:ListItem Text="Escalator" Value="1" style="margin-top: auto; margin-bottom: auto; padding-left: 10px;"></asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ErrorMessage="Choose one" ControlToValidate="RadioBtnEscType" Visible="false" runat="server" ValidationGroup="Submit" SetFocusOnError="true" ForeColor="Red" />
                            </div>
                            <div class="col-md-4" runat="server">
                                <label>
                                    Type of Control<samp style="color: red"> * </samp>
                                </label>
                                <asp:TextBox class="form-control" ID="txtControlType" MaxLength="150" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RfvtxtControlType" ControlToValidate="txtControlType" runat="server" ForeColor="Red" ValidationGroup="Submit" ErrorMessage="Required"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-4" runat="server">
                                <label>
                                    Capacity(Persons)<samp style="color: red"> * </samp>
                                </label>
                                <asp:TextBox class="form-control" ID="txtCapacity" autocomplete="off" runat="server" Style="margin-left: 18px" MaxLength="5" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtCapacity" runat="server" ForeColor="Red" ValidationGroup="Submit" ErrorMessage="Required"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-3" runat="server">
                                <label>
                                    Capacity(In Kg)<samp style="color: red"> * </samp>
                                </label>
                                <asp:TextBox class="form-control" ID="txtWeight" autocomplete="off" runat="server" Style="margin-left: 18px" MaxLength="5" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtWeight" runat="server" ForeColor="Red" ValidationGroup="Submit" ErrorMessage="Required"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-3" runat="server">
                                <label>
                                    District<samp style="color: red"> * </samp>
                                </label>
                                <asp:DropDownList class="form-control  select-form select2" runat="server" AutoPostBack="true" ID="ddlDistrict" Style="width: 100% !important">
                                </asp:DropDownList>
                                <asp:TextBox class="form-control" ID="txtDistrict" Visible="false" autocomplete="off" runat="server" Style="margin-left: 18px" MaxLength="5" ReadOnly="true"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator25" ErrorMessage="Required" ControlToValidate="ddlDistrict" runat="server" InitialValue="0" Display="Dynamic" ValidationGroup="Submit" ForeColor="Red" />
                            </div>
                            <div class="col-md-3" runat="server">
                                <label>
                                    Memo No.<samp style="color: red"> * </samp>
                                </label>
                                <asp:TextBox class="form-control" ID="txtMemoNo" autocomplete="off" runat="server" MaxLength="25" Style="margin-left: 18px; width: 100% !important;"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtMemoNo" runat="server" ForeColor="Red" ValidationGroup="Submit" ErrorMessage="Required"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-3" runat="server">
                                <label>
                                    Memo Date<samp style="color: red"> * </samp>
                                </label>
                                <asp:TextBox class="form-control" Type="date" ID="txtMemoDate" autocomplete="off" runat="server" MaxLength="25" Style="margin-left: 18px; width: 100% !important;"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="txtMemoDate" runat="server" ForeColor="Red" ValidationGroup="Submit" ErrorMessage="Required"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-12" runat="server">
                                <label>
                                    Site Address<samp style="color: red"> * </samp>
                                </label>
                                <asp:TextBox class="form-control" ID="txtSiteAddress" MaxLength="250" autocomplete="off" runat="server"
                                    TextMode="MultiLine" Rows="2" Columns="125" Style="margin-left: 18px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtSiteAddress" runat="server" ForeColor="Red" ValidationGroup="Submit" ErrorMessage="Required"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
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
                                <asp:FileUpload ID="FileUpload1" runat="server" OnClientClick="return validateFileUpload(this);" onchange="return validateFileUpload(this);" />
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
                    <asp:Button ID="btnSubmit" Text="Save" runat="server" OnClick="btnSubmit_Click" ValidationGroup="Submit" class="btn btn-primary mr-2" Style="padding-left: 30px; padding-right: 30px;" />
                </div>
                <div class="col-6" style="text-align: left; padding-left: 0px;">
                    <asp:Button ID="btnBack" Style="padding-left: 35px; padding-right: 35px;" OnClick="btnBack_Click" Text="Back" runat="server" class="btn btn-primary mr-2" CausesValidation="false" />
                </div>
            </div>
            <div id="searchModal" class="modal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Registration Details</h5>
                            <button type="button" class="close" onclick="closeModal()" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-4" runat="server">
                                    <asp:TextBox class="form-control" ID="txtSearch" autocomplete="off" placeholder="Search" runat="server" Style="margin-left: 18px" onkeyup="Search_Gridview(this)"
                                        onkeydown="SearchOnEnter(event)"></asp:TextBox>
                                </div>
                            </div>
                            <hr />
                            <div class="row">
                                <%--Grid to filter record according to Registration No--%>
                                <div class="col-md-12">
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
                                                    <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument=' <%#Eval("RegistrationNo") %> ' CommandName="Select"><%#Eval("RegistrationNo") %></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Make" HeaderText="Make">
                                                <HeaderStyle HorizontalAlign="Left" Width="20%" CssClass="headercolor leftalign" />
                                                <ItemStyle HorizontalAlign="Left" Width="30%" CssClass="wrap-text" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="TypeOfControl" HeaderText="Type Of Control">
                                                <HeaderStyle HorizontalAlign="Left" Width="10%" CssClass="headercolor leftalign" />
                                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Capacity" HeaderText="Capacity(Persons)">
                                                <HeaderStyle HorizontalAlign="Left" Width="10%" CssClass="headercolor leftalign" />
                                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="District" HeaderText="District">
                                                <HeaderStyle HorizontalAlign="Left" Width="20%" CssClass="headercolor leftalign" />
                                                <ItemStyle HorizontalAlign="Left" Width="30%" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="Id" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblRegistrationNo" runat="server" Text='<%#Eval("RegistrationNo") %>'></asp:Label>
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
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" onclick="closeModal()">Close</button>
                        </div>
                    </div>
                    <asp:HiddenField ID="HdnUserID" runat="server" />
                    <asp:HiddenField ID="HdnApplicantTypeID" runat="server" />
                    <asp:HiddenField ID="HdnInstallationType" runat="server" />
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        // Function to search through the GridView rows
        function Search_Gridview(strKey) {
            var strData = strKey.value.toLowerCase().split(" ");
            var tblData = document.getElementById("<%=GridView1.ClientID %>");
            var rowData;

            // Iterate through each row in the GridView
            for (var i = 1; i < tblData.rows.length; i++) {
                rowData = tblData.rows[i].innerHTML;
                var styleDisplay = 'none';

                // Check if all search keywords match a part of the row data
                for (var j = 0; j < strData.length; j++) {
                    if (rowData.toLowerCase().indexOf(strData[j]) >= 0)
                        styleDisplay = '';  // Display this row if a match is found
                    else {
                        styleDisplay = 'none';  // Hide the row if no match found
                        break;
                    }
                }
                tblData.rows[i].style.display = styleDisplay;  // Apply the visibility
            }
        }
        // Function to trigger search when pressing Enter
        function SearchOnEnter(event) {
            if (event.keyCode === 13) {  // Check if Enter (keyCode 13) was pressed
                event.preventDefault();  // Prevent default form submission
                Search_Gridview(document.getElementById('<%=txtSearch.ClientID %>'));
            }
        }
    </script>
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
        // Allow only alphabets, numbers, and delete/backspace
        function isAlphaNumeric(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode;

            // Allow numbers (48-57), uppercase alphabets (65-90), lowercase alphabets (97-122)
            if ((charCode >= 48 && charCode <= 57) || (charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122) || charCode == 8 || charCode == 32) {
                return true;
            }
            return false;
        }
    </script>
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
    <script type="text/javascript">
        // Function to open the modal
        function openModal() {
            const modal = document.getElementById("searchModal");
            modal.style.display = "flex";
        }

        // Function to close the modal
        function closeModal() {
            const modal = document.getElementById("searchModal");
            modal.style.display = "none";
        }

        // Attach the openModal function to the button
        document.getElementById('<%= lnkbtnSearch.ClientID %>').addEventListener("click", function (e) {
            e.preventDefault(); // Prevent postback

            // Get the selected value of the dropdown
            var ddlInstallationType = document.getElementById('<%= ddlInstallationType.ClientID %>');
            var selectedValue = ddlInstallationType.value;

            if (selectedValue === "0") {
                // Show a message if the value is "0"
                alert("Please select a valid Installation Type.");
            } else {
                // Open the modal if a valid value is selected
                openModal();
            }
        });
    </script>
    <script type="text/javascript">
        // Validate if the file is a PDF and the size is less than 1MB
        function validateFileUpload(sender) {
            var fileUpload = sender;
            var filePath = fileUpload.value;
            var fileExtension = filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase();
            var fileSize = fileUpload.files[0].size; // Size in bytes

            // Check file extension
            if (fileExtension !== "pdf") {
                alert("Only PDF files are allowed.");
                fileUpload.value = ""; // Clear the file input
                return false;
            }

            // Check file size (1MB = 1048576 bytes)
            if (fileSize > 1048576) {
                alert("File size should not exceed 1MB.");
                fileUpload.value = ""; // Clear the file input
                return false;
            }
            return true;
        }
    </script>
    <script type="text/javascript">
        function alertWithReturnRedirectdata() {
            if (confirm('Application Submitted successfully.')) {
                window.location.href = "/SiteOwnerPages/ReturnLiftInspections.aspx";
            } else {
            }
        }
    </script>
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            // Get the current date
            const today = new Date();

            // Calculate the minimum date (20 years before today)
            const minDate = new Date();
            minDate.setFullYear(today.getFullYear() - 20);
            const nextMonth = new Date(today);
            nextMonth.setMonth(today.getMonth() + 1);

            // Format to YYYY-MM-DD
            const formattedMaxMonthDate = nextMonth.toISOString().split('T')[0];
            // Format the dates to YYYY-MM-DD
            const formattedToday = today.toISOString().split('T')[0];
            const formattedMinDate = minDate.toISOString().split('T')[0];

            // Set the date range for txtExpiryDate
            const txtExpiryDate = document.getElementById('<%= txtExpiryDate.ClientID %>');
            if (txtExpiryDate) {
                txtExpiryDate.setAttribute("max", formattedMaxMonthDate); // Disable future dates
                txtExpiryDate.setAttribute("min", formattedMinDate); // Allow dates up to 20 years in the past
            }

            // Set the date range for txtLastexpirydate
            const txtLastexpirydate = document.getElementById('<%= txtLastdateOfPayment.ClientID %>');
            if (txtLastexpirydate) {
                txtLastexpirydate.setAttribute("max", formattedToday); // Disable future dates
                txtLastexpirydate.setAttribute("min", formattedMinDate); // Allow dates up to 20 years in the past
            }
        });
    </script>
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            // Get the current date
            const today = new Date();

            // Calculate the minimum date (20 years before today)
            const minDate = new Date();
            minDate.setFullYear(today.getFullYear() - 20);

            // Format the dates to YYYY-MM-DD
            const formattedToday = today.toISOString().split('T')[0];
            const formattedMinDate = minDate.toISOString().split('T')[0];

            // Helper function to set min and max attributes
            function setDateRange(inputId) {
                const dateInput = document.getElementById(inputId);
                if (dateInput) {
                    dateInput.setAttribute("max", formattedToday); // Disable future dates
                    dateInput.setAttribute("min", formattedMinDate); // Allow dates up to 20 years in the past
                }
            }

            // Set date range for all specified TextBoxes
            setDateRange('<%= txtLastdateOfPayment.ClientID %>');
            setDateRange('<%= txtDateofErection.ClientID %>');
            setDateRange('<%= txtMemoDate.ClientID %>');
        });
    </script>
    <script type="text/javascript">
        function alertWithRedirectdata() {
            if (confirm('Application Submitted successfully.')) {
                window.location.href = "/SiteOwnerPages/LiftPeriodic.aspx";
            } else {
            }
        }
    </script>
    <script type="text/javascript">
        function validateErectionDateLimit() {
            var input = document.getElementById('<%= txtDateofErection.ClientID %>');
            var dateValue = new Date(input.value);
            var today = new Date();
            var twentyYearsAgo = new Date();
            twentyYearsAgo.setFullYear(today.getFullYear() - 20);

            if (dateValue < twentyYearsAgo || dateValue > today) {
                alert("Please enter a Date of Erection within the last 20 years.");
                input.value = ""; // Clear invalid input
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
