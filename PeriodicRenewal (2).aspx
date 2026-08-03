<%@ Page Title="" Language="C#" MasterPageFile="~/SiteOwnerPages/SiteOwner.Master" AutoEventWireup="true" CodeBehind="PeriodicRenewal.aspx.cs" EnableEventValidation="false" Inherits="CEIHaryana.SiteOwnerPages.PeriodicRenewal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="shortcut icon" type="image/png" href="/css2/style.min.css" />
    <link rel="stylesheet" href="/css2/style.css" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
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
        function alertWithRedirectdata() {

            alert('Data added to cart Successfully');
            window.location.href = "/SiteOwnerPages/InspectionRenewalCart.aspx";

        }
    </script>
    <style>
        .table td, .jsgrid .jsgrid-table td {
            font-size: 0.875rem;
            color: black;
        }

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

        .col-4 {
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

        .OrangeBackground {
            background-color: crimson !important;
            color: white !important;
            font-weight: bold !important;
        }

        .YellowBackground {
            background-color: yellow !important;
            color: black !important;
            font-weight: bold !important;
        }

        .GreenBackground {
            background-color: green !important;
            color: white !important;
            font-weight: bold !important;
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

        h7#maincard {
            font-size: 18px !important;
        }

        label {
            font-size: 0.875rem;
        }

        th.thwidth {
            width: 50% !important;
        }

        th.thwidth1 {
            width: 10% !important;
        }

        th {
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="card" style="box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px; border-radius: 5px !important">
            <div id="DetailsOfInstallations">
                <div class="card-body" style="padding-bottom: 0px !important;">
                    <div class="row">
                        <div class="col-md-12" style="text-align: center;">
                            <h6 class="card-title fw-semibold mb-4" id="maincard" style="font-size: 22px;">Periodic Renewal
                            </h6>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <label id="MainNote" runat="server" style="color: red; font-size: 1.125rem; margin-left: 20px;">
                                NOTE: Please first select the address for which installation is required
                            </label>
                        </div>
                    </div>

                    <div id="DivPeriodicRenewal" visible="true" runat="server">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12">
                                    <h7 class="card-title fw-semibold mb-4" id="maincard1" style="font-size: 18px !important;">Initiate Peiodic Renewal for Existing Installation</h7>
                                </div>
                            </div>
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
                            <%--  <asp:UpdatePanel ID="UpdatePanel1" runat="server">--%>
                            <%-- <contenttemplate>--%>
                            <div class="card-body" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px; padding: 25px; margin-bottom: 25px; border-radius: 10px; margin-top: 10px;">
                                <div class="row" style="margin-bottom: 20px;">
                                    <div class="col-md-12" style="display: none !important;">
                                        <label>
                                            Select Site Address of Different Installations<samp style="color: red">* </samp>
                                        </label>
                                        <asp:DropDownList class="form-control  select-form select2" AutoPostBack="true" Style="width: 100% !important;" ID="ddlAdress" OnSelectedIndexChanged="ddlAdress_SelectedIndexChanged" runat="server">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator" Text="Please Select any adress" ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlAdress" runat="server" InitialValue="0" Display="Dynamic" ValidationGroup="Submit" ForeColor="Red" />
                                    </div>
                                    <%-- <div class="col-md-3">
                        <label>
                            Intimation Wise
                        </label>
                        <asp:DropDownList class="form-control  select-form select2" AutoPostBack="true" Style="width: 100% !important;" ID="ddlIntimation" TabIndex="2" runat="server">
                        </asp:DropDownList>
                    </div>
                        <div class="col-md-4">
                        <label> 
                            Installation Wise
                        </label>
                        <asp:DropDownList class="form-control  select-form select2" AutoPostBack="true" Style="width: 100% !important;" ID="ddlInstallationType" TabIndex="2" runat="server">
                        </asp:DropDownList>
                    </div>
                        <div class="col-md-3">
                    <label>
                        Number Of Delay Days
                    </label>
                    <asp:DropDownList class="form-control  select-form select2" AutoPostBack="true" Style="width: 100% !important;" ID="ddlNoOfDays" OnSelectedIndexChanged="ddlNoOfDays_SelectedIndexChanged" TabIndex="2" runat="server">
                        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                        <asp:ListItem Text="less than 30 days" Value="1"></asp:ListItem>
                        <asp:ListItem Text="less than 30 days and greater than 15" Value="2"></asp:ListItem>
                        <asp:ListItem Text="less than 15 and Expiry" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <label>
                        Installation Type
                    </label>
                    <asp:DropDownList class="form-control  select-form select2" AutoPostBack="true" Style="width: 100% !important;" ID="ddlInstallationType" OnSelectedIndexChanged="ddlInstallationType_SelectedIndexChanged" TabIndex="2" runat="server">
                        <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                        <asp:ListItem Text="Line" Value="Line"></asp:ListItem>
                        <asp:ListItem Text="Substation Transformer" Value="Substation Transformer"></asp:ListItem>
                        <asp:ListItem Text="Generating Set" Value="Generating Set"></asp:ListItem>
                    </asp:DropDownList>
                </div> <div class="col-1" style="margin-top: auto; padding-left: 0px;">
                                        <asp:Button type="submit" ID="btnSearch" TabIndex="23" Text="Search" runat="server" ValidationGroup="Submit" OnClick="btnSearch_Click" class="btn btn-primary mr-2" Style="padding-left: 18px; padding-right: 18px; height: 34px; padding-top: 2px;" />
                                    </div>
                                        <div style="text-align: center;">
                    <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" runat="server">link to apply new intimation for existing Inspection</asp:LinkButton>
                </div>--%>
                                </div>


                                <div class="row">
                                    <div class="col-md-12">
                                        <%-- add grid view here --%>

                                        <asp:GridView ID="Gridview2" CssClass="table table-bordered table-responsive" runat="server" OnRowDataBound="Gridview2_RowDataBound" OnRowCommand="Gridview2_RowCommand"
                                            AutoGenerateColumns="false" AllowPaging="True" PageSize="50" OnPageIndexChanging="Gridview2_PageIndexChanging">

                                            <Columns>
                                                <asp:TemplateField HeaderText="S.No.">
                                                    <HeaderStyle />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <%#Container.DataItemIndex+1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Site Address of Different Installations">
                                                    <HeaderStyle CssClass="thwidth" />
                                                    <ItemTemplate>
                                                        <%# Eval("siteownerAdress") %>
                                                    </ItemTemplate>

                                                </asp:TemplateField>

                                                <asp:TemplateField>
                                                    <HeaderStyle CssClass="thwidth1" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <asp:LinkButton
                                                            ID="lnkSelect"
                                                            runat="server"
                                                            Text="Select"
                                                            CommandName="SelectAddress"
                                                            CommandArgument='<%# Eval("siteownerAdress") %>' Style="font-weight: bold;" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>

                                        </asp:GridView>

                                    </div>
                                </div>
                                <div>
                                    <div class="card" id="grid" runat="server" visible="false" style="padding: 15px; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; padding-bottom: 30px;">
                                        <asp:GridView class="table-responsive table table-striped" ID="GridView1" OnDataBound="GridView1_DataBound" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" runat="server" DataKeyNames="Id" Width="100%"
                                            AutoGenerateColumns="false" BorderWidth="1px" BorderColor="#dbddff">
                                            <PagerStyle CssClass="pagination-ys" />
                                            <Columns>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle">
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="chkSelectAll" runat="server" Style="text-align: left !important;" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="CheckBox1" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" runat="server" HorizontalAlign="center" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="SNo">
                                                    <HeaderStyle Width="5%" CssClass="headercolor" />
                                                    <ItemStyle Width="5%" />
                                                    <ItemTemplate>
                                                        <%#Container.DataItemIndex+1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%-- <asp:BoundField DataField="IntimationId" HeaderText="Intimation Id" Visible="false">
                                                    <HeaderStyle HorizontalAlign="Left" Width="15%" CssClass="headercolor" />
                                                    <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                </asp:BoundField>--%>
                                                <asp:BoundField DataField="Id" HeaderText="Inspection Id" Visible="false">
                                                    <HeaderStyle HorizontalAlign="Left" Width="15%" CssClass="headercolor" />
                                                    <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="TypeOf" HeaderText="Installation Type">
                                                    <HeaderStyle HorizontalAlign="Left" Width="15%" CssClass="headercolor" />
                                                    <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="IntimationId" HeaderText="Intimation Id" Visible="true">
                                                    <HeaderStyle HorizontalAlign="Left" Width="15%" CssClass="headercolor" />
                                                    <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Capacity" HeaderText="Capacity">
                                                    <HeaderStyle HorizontalAlign="center" Width="12%" CssClass="headercolor" />
                                                    <ItemStyle HorizontalAlign="center" Width="12%" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Voltage" HeaderText="Voltage">
                                                    <HeaderStyle HorizontalAlign="center" Width="12%" CssClass="headercolor" />
                                                    <ItemStyle HorizontalAlign="center" Width="12%" />
                                                </asp:BoundField>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        Test<br />
                                                        Report Id
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkTestReportId" runat="server" Text='<%# Eval("TestRportId") %>' CommandName="ViewTestReport" CommandArgument='<%# Eval("TestRportId") %>'></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="center" Width="12%" CssClass="headercolor" />
                                                    <ItemStyle HorizontalAlign="center" Width="12%" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="TestRportId" HeaderText="TestReportId" Visible="false">
                                                    <HeaderStyle HorizontalAlign="Left" Width="15%" CssClass="headercolor" />
                                                    <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="InspectionDate" HeaderText="Inspection<br/>Date" HtmlEncode="false">
                                                    <HeaderStyle HorizontalAlign="center" Width="10%" CssClass="headercolor" />
                                                    <ItemStyle HorizontalAlign="center" Width="10%" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="InspectionDueDate" HeaderText="Due Date">
                                                    <HeaderStyle HorizontalAlign="center" Width="12%" CssClass="headercolor" />
                                                    <ItemStyle HorizontalAlign="center" Width="12%" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Numberofdays" HeaderText="DueDate<br/>Passed" HtmlEncode="false">
                                                    <HeaderStyle HorizontalAlign="center" Width="12%" CssClass="headercolor" />
                                                    <ItemStyle HorizontalAlign="center" Width="12%" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="RecordType" HeaderText="Record<br/>Type" HtmlEncode="false">
                                                    <HeaderStyle HorizontalAlign="center" Width="12%" CssClass="headercolor" />
                                                    <ItemStyle HorizontalAlign="center" Width="12%" />
                                                </asp:BoundField>

                                                <asp:TemplateField HeaderText="Id" Visible="False">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LblInstallationType" runat="server" Text='<%#Eval("TypeOf") %>'></asp:Label>
                                                        <asp:Label ID="LblTestReportId" runat="server" Text='<%#Eval("TestRportId") %>'></asp:Label>
                                                        <asp:Label ID="LblInspectionDate" runat="server" Text='<%#Eval("InspectionDate") %>'></asp:Label>
                                                        <asp:Label ID="LblInspectionDueDate" runat="server" Text='<%#Eval("InspectionDueDate") %>'></asp:Label>
                                                        <asp:Label ID="LblNumberofdays" runat="server" Text='<%#Eval("Numberofdays") %>'></asp:Label>
                                                        <asp:Label ID="LblVoltage" runat="server" Text='<%#Eval("Voltage") %>'></asp:Label>
                                                        <asp:Label ID="LblCapacity" runat="server" Text='<%#Eval("Capacity") %>'></asp:Label>
                                                        <asp:Label ID="LblAddress" runat="server" Text='<%#Eval("Address") %>'></asp:Label>
                                                        <asp:Label ID="LblInstallationName" runat="server" Text='<%#Eval("InstallationType") %>'></asp:Label>
                                                        <asp:Label ID="LblDivision" runat="server" Text='<%#Eval("Division") %>'></asp:Label>
                                                        <asp:Label ID="LblDistrict" runat="server" Text='<%#Eval("District") %>'></asp:Label>
                                                        <asp:Label ID="LblCount" runat="server" Text='<%#Eval("number") %>'></asp:Label>
                                                        <asp:Label ID="LblIntimationId" runat="server" Text='<%#Eval("IntimationId") %>'></asp:Label>
                                                        <asp:Label ID="LblCompleteAdress" runat="server" Text='<%#Eval("CompleteAdress") %>'></asp:Label>
                                                        <asp:Label ID="LblOwnerName" runat="server" Text='<%#Eval("SiteOwnerName") %>'></asp:Label>
                                                        <asp:Label ID="LblADRESSDistrict" runat="server" Text='<%#Eval("AdressWithoutDistrict") %>'></asp:Label>
                                                        <asp:Label ID="lblInspectionId" runat="server" Text='<%#Eval("Id") %>'></asp:Label>
                                                        <asp:Label ID="LblRecordType" runat="server" Text='<%# Eval("RecordType") %>'></asp:Label>
                                                        <%--<asp:Label ID="lblID" runat="server" Text='<%#Eval("Id") %>'></asp:Label>--%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
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
                                    <div class="row" style="margin-top: 25px; margin-bottom: -15px;">
                                        <div class="col-4" style="margin-top: auto;">
                                            <%--<asp:Button type="submit" ID="btnSubmit" ValidationGroup="Submit" Text="Submit" OnClientClick="return validateCheckBoxes();" runat="server" class="btn btn-primary mr-2" OnClick="Submit_Click" />--%>
                                            <%--<asp:Button type="submit" ID="BtnProcess" TabIndex="23" Text="Process" runat="server" OnClick="BtnProcess_Click"  class="btn btn-primary mr-2" Style="padding-left: 18px; padding-right: 18px;" />--%>
                                            <asp:Button type="submit" ID="BtnCart" Visible="false" Text="Add To Cart" runat="server" OnClick="BtnCart_Click" class="btn btn-primary mr-2" Style="padding-left: 18px; padding-right: 18px;" />
                                        </div>
                                        <div class="col-8" style="margin-top: auto; text-align: end;">
                                            <asp:Button ID="btnResetAddresGrid" Visible="false" runat="server" Text="Reset" CssClass="btn btn-primary" OnClick="btnResetAddresGrid_Click" class="btn btn-primary" Style="padding-left: 18px; padding-right: 18px; margin-bottom: 15px;" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <asp:HiddenField ID="hdnId" runat="server" />
                            <asp:HiddenField ID="hdnId2" runat="server" />
                            <div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--       <div id="DivExistingInspectionRequest" visible="true" runat="server" style="padding-left: 20px; padding-right: 20px;">
                <div class="card-body" style="padding-top: 0px !important;">
                    <div class="row">
                        <div class="col-md-12">
                            <h7 class="card-title fw-semibold mb-4" id="maincard">
                                List of Existing Installations(Recently Tested By Authorised Contractor)
                            </h7>
                        </div>
                    </div>

                    <div class="card-body" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px; padding: 25px; margin-bottom: 25px; border-radius: 10px; margin-top: 10px;">
                        <div class="row">
                            <div class="col-md-12">
                                <span style="font-size: 14px; font-weight: 500; color: red;">(Please Click on Application to Proceed)</span>
                            </div>
                        </div>
                        <asp:GridView class="table-responsive table table-striped table-hover" ID="GridView2" AutoPostBack="true" runat="server" Width="100%" AutoGenerateColumns="false" OnRowCommand="GridView2_RowCommand"
                            AllowPaging="true" PageSize="20" OnPageIndexChanging="GridView2_PageIndexChanging" BorderWidth="1px" BorderColor="#dbddff">
                            <PagerStyle CssClass="pagination-ys" />
                            <Columns>
                                <asp:TemplateField HeaderText="SNo">
                                    <HeaderStyle Width="5%" CssClass="headercolor" />
                                    <ItemStyle Width="5%" />
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Id" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblID" runat="server" Text='<%#Eval("Id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Application">
                                    <HeaderStyle Width="25%" CssClass="headercolor" />
                                    <ItemStyle Width="25%" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton4" runat="server" AutoPostBack="true" CommandArgument=' <%#Eval("Name") %> ' CommandName="Select"><%#Eval("Name") %></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="VoltageLevel" HeaderText="Voltage Level">
                                    <HeaderStyle HorizontalAlign="center" CssClass="GridViewRowHeader headercolor" />
                                    <ItemStyle HorizontalAlign="center" CssClass="GridViewRowItems" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CreatedDate1" HeaderText="Request Date">
                                    <HeaderStyle HorizontalAlign="center" CssClass="GridViewRowHeader headercolor" />
                                    <ItemStyle HorizontalAlign="center" CssClass="GridViewRowItems" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CompletionDate1" HeaderText="Completion Date">
                                    <HeaderStyle HorizontalAlign="center" CssClass="GridViewRowHeader headercolor" />
                                    <ItemStyle HorizontalAlign="center" CssClass="GridViewRowItems" />
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
            </div>--%>
            <div id="DivCreateIntimation" visible="true" runat="server" style="padding-left: 40px; padding-right: 40px;">
                <div class="row">
                    <div class="col-md-12">
                        <h7 class="card-title fw-semibold mb-4" id="maincard">
                            Provide Existing Installation Detail generated Offline
                        </h7>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4" style="text-align: center;">
                        <label id="Label1" runat="server" visible="false" style="color: red; font-size: 1.125rem">
                            Data Updated Successfully !!!.
                        </label>
                        <label id="Label2" runat="server" visible="false" style="color: red; font-size: 1.125rem">
                            Data Saved Successfully !!!.
                        </label>
                    </div>
                </div>
                <div class="card-body" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px; padding: 10px 0px 10px 25px; margin-bottom: 25px; border-radius: 10px; margin-top: 10px;">
                    <div class="row">
                        <div class="col-md-4">
                            <label>
                                Do You Have Latest CEI Existing installation Report?<samp style="color: red">* </samp>
                            </label>
                            <asp:RadioButtonList ID="RadioButtonList1" AutoPostBack="true" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                <asp:ListItem Text="No" Value="0" style="margin-top: auto; margin-bottom: auto;"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="RadioButtonList2" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Required</asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md-8" id="divToShowLabel" visible="false" runat="server" style="margin-top: auto; margin-bottom: auto; text-align: center; font-weight: 700; font-size: 17px; color: red;">
                            <span>Note:- Please test your existing installation from any authorized 'A' class electrical Contractor of Haryana.</span>
                        </div>
                    </div>
                </div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="card-body" id="DivDetails" runat="server" visible="false" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px; padding: 25px; margin-bottom: 25px; border-radius: 10px; margin-top: 10px;">
                            <div>
                                <div class="row" style="margin-bottom: 8px;">
                                    <div class="col-md-12">
                                        <h7 class="card-title fw-semibold mb-4" style="font-size: 18px !important;">Site Owner Information</h7>
                                    </div>
                                </div>
                                <div class="card" style="padding: 15px; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label>
                                                Applicant Type
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtApplicantType" AutoPostBack="true" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        </div>
                                        <div class="col-md-4" runat="server" id="DivPancard_TanNo" visible="false">
                                            <label for="PanNumber">
                                                PAN/TAN Number
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtPAN" ReadOnly="true" AutoPostBack="true" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        </div>
                                        <div class="col-md-4" runat="server" id="DivOtherDepartment" visible="false">
                                            <label for="TanNumber">
                                                PAN/TAN Number
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtTanNumber" ReadOnly="true" TabIndex="1" MaxLength="10" onkeyup="convertToUpperCase(event)" AutoPostBack="true" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                            <%--<asp:RegularExpressionValidator ID="revTANNumber" runat="server" ControlToValidate="txtTanNumber" ValidationExpression="[A-Za-z]{4}[0-9]{5}[A-Za-z]" ValidationGroup="Submit"
                                                ErrorMessage="Enter a valid TAN number" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtTanNumber" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Required</asp:RequiredFieldValidator>--%>
                                        </div>
                                        <div class="col-md-4">
                                            <label>
                                                Electrical Installation For
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtElecticalInstallation" AutoPostBack="true" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        </div>
                                        <div class="col-md-4" id="NameUtility" runat="server" visible="false">
                                            <label>
                                                Name Of Power Utility
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtUtilityName" AutoPostBack="true" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        </div>
                                        <div class="col-md-4" id="Wing" runat="server" visible="false" style="margin-top:15px;">
                                            <label>
                                                Wing
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtWing" AutoPostBack="true" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        </div>
                                        <div class="col-md-4" id="lzone" style="margin-top:15px;">
                                            <label>
                                                Zone
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtZone" AutoPostBack="true" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        </div>
                                        <div class="col-md-4" id="lcircle" style="margin-top:15px;">
                                            <label>
                                                Circle<samp style="color: red">* </samp>
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtCircle" AutoPostBack="true" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        </div>
                                        <div class="col-md-4" id="ldivision" style="margin-top:15px;">
                                            <label>
                                                Division
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtDivision" AutoPostBack="true" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        </div>
                                        <div class="col-md-4" id="lsubdivision" style="margin-top:15px;">
                                            <label>
                                                Sub-Division
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtSubDivision" AutoPostBack="true" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        </div>
                                        <div class="col-md-4" runat="server" id="UserId" visible="false" style="margin-top:15px;">
                                            <label for="UserId">
                                                UserId
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtUserId" AutoPostBack="true" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        </div>
                                    </div>
                                    <%-- <div class="row" runat="server" id="PowerUtility" visible="false">--%>

                                    <%--</div>--%>
                                    <div class="row">
                                    </div>
                                    <div class="row" id="row2">
                                        <div class="col-md-4" id="individual" visible="false" runat="server">
                                            <label for="Name">
                                                Name of Owner/ Consumer 
                                            </label>
                                            <div class="input-box">
                                                <asp:TextBox class="form-control" ID="txtName" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px; box-shadow: none !important;"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4" id="agency" visible="false" runat="server" style="margin-top:15px;">
                                            <label for="agency">
                                                Name of Firm/ Org./ Company/ Department<samp style="color: red">* </samp>
                                            </label>
                                            <div class="input-box">
                                                <span class="prefix">M/s.</span>
                                                <asp:TextBox class="form-control" ID="txtagency" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px;"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-8" style="margin-top:15px;">
                                            <label for="Address">
                                                Address of Site(Preferred As Per Demand Notice of Utility or Electricity Bill)<samp style="color: red">* </samp>
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtAddress" onkeydown="return preventEnterSubmit(event)" autocomplete="off" TabIndex="5" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtAddress" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Address</asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="row" id="row3">
                                        <div class="col-md-4" runat="server" style="margin-top:15px;">
                                            <label for="Pin">State</label>
                                            <asp:TextBox class="form-control" ID="txtState" MaxLength="6" Text="Haryana" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        </div>
                                        <div class="col-md-4" style="margin-top:15px;">
                                            <label>
                                                District<samp style="color: red">* </samp>
                                            </label>
                                            <asp:DropDownList class="form-control  select-form select2" runat="server" AutoPostBack="true" ID="ddlDistrict" TabIndex="6" selectionmode="Multiple" Style="width: 100% !important">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator25" Text="Please Select District" ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlDistrict" runat="server" InitialValue="0" Display="Dynamic" ValidationGroup="Submit" ForeColor="Red" />
                                        </div>
                                        <div class="col-md-4" runat="server" style="margin-top:15px;">
                                            <label for="Pin">
                                                PinCode<samp style="color: red">* </samp>
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtPin" TabIndex="7" MaxLength="6" onkeydown="return preventEnterSubmit(event)" onkeyup="ValidatePincode();" onKeyPress="return isNumberKey(event);" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPin" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Pincode</asp:RequiredFieldValidator>
                                            <span id="lblPinError" style="color: red"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label for="Phone">
                                                Contact Number (Site Owner)<samp style="color: red">* </samp>
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtPhone" onkeydown="return preventEnterSubmit(event)" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeyup="return isvalidphoneno();" MaxLength="10" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtPhone" ValidationGroup="Submit" ForeColor="Red">Please Enter Contact No.</asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-md-4" runat="server">
                                            <label for="Email">
                                                Email<samp style="color: red">* </samp>
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtEmail" onkeydown="return preventEnterSubmit(event)" ReadOnly="true" onkeyup="return ValidateEmail();" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="txtEmail" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Email Id</asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="margin-top: 15px;">
                                <div class="row" style="margin-top: 25px; margin-bottom: 8px;">
                                    <div class="col-md-12">
                                        <h7 class="card-title fw-semibold mb-4" style="margin-top: 5%; font-size: 18px !important;">Application Details</h7>
                                    </div>
                                </div>
                                <div class="card" style="padding: 15px; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label>
                                                Highest Voltage Level of Installation
                                                <samp style="color: red">* </samp>
                                            </label>
                                            <asp:DropDownList class="form-control  select-form select2" Style="width: 100% !important;" AutoPostBack="true" ID="ddlVoltageLevel" OnSelectedIndexChanged="ddlVoltageLevel_SelectedIndexChanged" runat="server">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" Text="Please Select Voltage Level" ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlVoltageLevel" runat="server" InitialValue="0" Display="Dynamic" ValidationGroup="Submit" ForeColor="Red" />
                                        </div>
                                        <div class="col-md-4">
                                            <label>
                                                Type of Premises<samp style="color: red">* </samp>
                                            </label>
                                            <asp:DropDownList class="form-control  select-form select2" runat="server" AutoPostBack="true" ID="ddlPremises" OnSelectedIndexChanged="ddlPremises_SelectedIndexChanged" selectionmode="Multiple" Style="width: 100% !important">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" Text="Please Select Premises Type" ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlPremises" runat="server" InitialValue="0" Display="Dynamic" ValidationGroup="Submit" ForeColor="Red" />
                                        </div>
                                        <div class="col-md-4" id="OtherPremises" runat="server" visible="false">
                                            <label for="OtherPremises">
                                                Other Premises<samp style="color: red"> * </samp>
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtOtherPremises" TabIndex="11" MaxLength="40" onkeydown="return preventEnterSubmit(event)" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtOtherPremises" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Other Premises</asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4" runat="server">
                                            <label for="Email">
                                                Total Capacity installed in KVA<samp style="color: red">* </samp>
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtCapacity" onkeydown="return preventEnterSubmit(event)" maxlenght="10" onKeyPress="return isNumberKey(event);" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                            <span id="lblCap" style="color: red"></span>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="txtCapacity" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Total Capacity</asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-md-4">
                                            <label>
                                                Is there any Sanction Load Issued
                                            </label>
                                            <asp:RadioButtonList ID="RadioButtonList2" AutoPostBack="true" runat="server" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged" RepeatDirection="Horizontal">
                                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="No" Value="0" Selected="True" style="margin-top: auto; margin-bottom: auto;"></asp:ListItem>
                                            </asp:RadioButtonList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RadioButtonList2" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Select any Sanction Load</asp:RequiredFieldValidator>
                                        </div>

                                        <div class="col-md-4" id="divSanctionLoad" visible="false" runat="server">
                                            <label for="Email">
                                                Input Your Sanction Load
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtSanctionLoad" onkeydown="return preventEnterSubmit(event)" maxlenght="10" onKeyPress="return isNumberKey(event);" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCapacity" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Total Capacity</asp:RequiredFieldValidator>--%>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="table-responsive pt-3" id="Installation" visible="true" runat="server">
                                                <table class="table table-bordered table-striped">
                                                    <thead class="table-dark">
                                                        <tr>
                                                            <th style="width: 70%;">Installation Type
                                                            </th>
                                                            <th style="width: 20%;">No of Installations
                                                            </th>
                                                            <th style="width: 10%;"></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <div id="installationType2" runat="server">
                                                            <tr>
                                                                <td>
                                                                    <div class="col-md-12">
                                                                        <asp:TextBox class="form-control" ID="txtinstallationType2" Text="Substation Transformer" ReadOnly="true" onkeydown="return preventEnterSubmit(event)" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="col-md-12">
                                                                        <asp:TextBox class="form-control" ID="txtinstallationNo2" TabIndex="14" onkeydown="return preventEnterSubmit(event)" onKeyPress="return restrictInput(event)" placeholder="Max no. of Installations is 150." MaxLength="3" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtinstallationNo2" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Number Of Installation</asp:RequiredFieldValidator>
                                                                    </div>
                                                                </td>
                                                                <td style="text-align: center !important;">
                                                                    <asp:ImageButton ID="imgDelete2" ImageUrl="/Image/Image/ImageToDelete-removebg-preview.png" OnClick="imgDelete2_Click" Height="30" Width="30" runat="server" />
                                                                </td>
                                                            </tr>
                                                        </div>
                                                        <div id="installationType3" runat="server">
                                                            <tr>
                                                                <td>
                                                                    <div class="col-md-12">
                                                                        <asp:TextBox class="form-control" ID="txtinstallationType3" Text="Generating Set" ReadOnly="true" onkeydown="return preventEnterSubmit(event)" autocomplete="off" runat="server" Style="margin-left: 18px;"></asp:TextBox>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div style="margin-left: 15px !important; margin-right: 15px !important;">
                                                                        <asp:TextBox class="form-control" ID="txtinstallationNo3" onkeydown="return preventEnterSubmit(event)" onKeyPress="return restrictInput(event)" placeholder="Max no. of Installations is 150." MaxLength="3" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtinstallationNo3" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Number Of Installation</asp:RequiredFieldValidator>
                                                                    </div>
                                                                </td>
                                                                <td style="text-align: center !important;">
                                                                    <asp:ImageButton ID="imgDelete3" ImageUrl="/Image/Image/ImageToDelete-removebg-preview.png" OnClick="imgDelete3_Click" Height="30" Width="30" runat="server" /></td>
                                                            </tr>
                                                        </div>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin-top: -10px;">
                                <div class="col-md-4" id="InstallationType" runat="server" visible="false">
                                    <label>
                                        Select Installation Type<samp style="color: red">* </samp>
                                    </label>
                                    <asp:DropDownList class="form-control  select-form select2" AutoPostBack="true" Style="width: 100% !important;" ID="ddlWorkDetail" runat="server">
                                    </asp:DropDownList>
                                    <asp:TextBox class="form-control" ID="WorkDetail" autocomplete="off" onkeydown="return preventEnterSubmit(event)" Visible="false" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator16" Text="Please Select Voltage Level" ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlVoltageLevel" runat="server" InitialValue="0" Display="Dynamic" ValidationGroup="Submit" ForeColor="Red" />--%>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="row" style="margin-bottom: 30px;">
                    <div class="col-md-4"></div>
                    <div class="col-md-4" style="text-align: center;">
                        <asp:Button type="submit" ID="btnBack" Visible="false" OnClick="btnBack_Click" Text="Back" runat="server" class="btn btn-primary mr-2" />
                        <asp:Button type="submit" ID="btnReset" Visible="false" OnClick="btnReset_Click" Text="Reset" runat="server" class="btn btn-primary mr-2" />
                        <asp:Button type="submit" ID="btnSubmitInstallation" Visible="false" ValidationGroup="Submit" OnClick="btnSubmitInstallation_Click" Text="Submit" runat="server" UseSubmitBehavior="false" class="btn btn-primary mr-2" />
                    </div>
                    <div class="col-md-4"></div>
                </div>
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <asp:HiddenField ID="HiddenField2" runat="server" />
                <asp:HiddenField ID="hfOwner" runat="server" />
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
    <script type="text/javascript">
        function alertWithRedirect() {
            if (confirm('User Created Successfully User Id And password will be sent Via Text Mesaage.')) {
                window.location.href = "/Contractor/Work_Intimation.aspx";
            } else {
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

            if (isNaN(numValue) || numValue < 1 || numValue > 150) {
                event.preventDefault();
                return false;
            }

            return true;
        }
    </script>
    <script type="text/javascript">
        function ValidateEmail() {

            var email1 = document.getElementById("<%=txtEmail.ClientID %>");
            email = email1.value;
            var lblError = document.getElementById("lblError");
            lblError.innerHTML = "";
            var expr = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
            if (email == "") {
                // lblError.innerHTML = "Please Enter Email" + "\n";
                return false;
            }
            else if (expr.test(email)) {
                lblError.innerHTML = "";
                return true;
            }
            else {
                lblError.innerHTML = "Invalid email address.ex:abc@xyz.com" + "\n";
                return false;
            }
        }
    </script>
    <script type="text/javascript">
        function isvalidphoneno() {

            var Phone1 = document.getElementById("<%=txtPhone.ClientID %>");
            phoneNo = Phone1.value;
            var lblErrorContect = document.getElementById("lblErrorContect");
            lblErrorContect.innerHTML = "";
            var expr = /^[6-9]\d{9}$/;
            if (phoneNo == "") {
                lblErrorContect.innerHTML = "Please Enter Contact Number" + "\n";
                return false;
            }
            else if (expr.test(phoneNo)) {
                lblErrorContect.innerHTML = "";
                return true;
            }
            else {
                lblErrorContect.innerHTML = "Invalid Contact Number" + "\n";
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

</asp:Content>

