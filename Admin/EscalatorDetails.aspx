<%@ Page Title="" Language="C#" MasterPageFile="~/SiteOwnerPages/SiteOwner.Master" AutoEventWireup="true" CodeBehind="EscalatorDetails.aspx.cs" Inherits="CEIHaryana.SiteOwnerPages.EscalatorDetails1" %>

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
    <script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc" crossorigin="anonymous"></script>
    <script type="text/javascript">
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }

        function preventZero(event) {
            var key = event.keyCode || event.charCode;
            var textboxValue = event.target.value;
            if (key === 48 && textboxValue.length === 0) { // Check if the pressed key is '0'
                event.preventDefault();
                return false;
            }
            return true;
        }

        function preventZeroo(textBox) {
            if (textBox.value === "0") {
                textBox.value = ""; // Clear the textbox if '0' is entered
            }
        }

        //function isNumberdecimalKey(evt, element) {
        //    var charCode = (evt.which) ? evt.which : evt.keyCode;

        //    // Allow only digits and one decimal point
        //    if (charCode != 46 && (charCode < 48 || charCode > 57))
        //        return false;

        //    // Get the current value of the textbox
        //    var value = element.value;

        //    // Allow only one decimal point
        //    if (charCode == 46 && value.indexOf('.') != -1)
        //        return false;

        //    // Ensure only two digits after the decimal point
        //    if (value.indexOf('.') != -1) {
        //        var decimalPart = value.split('.')[1];
        //        if (decimalPart && decimalPart.length >= 2) {
        //            return false;
        //        }
        //    }
        //    return true;
        //}

        function isNumberdecimalKey(evt, element) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;

            // Allow only digits and one decimal point
            if (charCode != 46 && (charCode < 48 || charCode > 57))
                return false;

            // Get the current value of the textbox
            var value = element.value;

            // Allow only one decimal point
            if (charCode == 46 && value.indexOf('.') != -1)
                return false;

            // Ensure only 5 digits before the decimal point
            var integerPart = value.split('.')[0];
            if (value.indexOf('.') === -1 && integerPart.length >= 5 && charCode != 46)
                return false;

            // Ensure only 2 digits after the decimal point
            if (value.indexOf('.') != -1) {
                var decimalPart = value.split('.')[1];
                if (decimalPart && decimalPart.length >= 2) {
                    return false;
                }
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
            if (confirm('Escalator Details added Successfully')) {
                window.location.href = "/SiteOwnerPages/LiftSiteDetails.aspx";
            } else {
            }
        }
    </script>
    <script type="text/javascript">
        function alertWithReturnRedirectdata() {
            if (confirm('Escalator Details added Successfully')) {
                window.location.href = "/SiteOwnerPages/ReturnLiftInspections.aspx";
            } else {
            }
        }
    </script>
    <style>
        th {
            width: 1%;
        }

        table#ContentPlaceHolder1_RadioButtonAction {
            margin-top: -13px;
        }

        input#ContentPlaceHolder1_RadioButtonAction_0 {
            margin-right: 5px;
        }

        input#ContentPlaceHolder1_RadioButtonAction_1 {
            margin-right: 5px;
        }

        th {
            width: 1%;
        }

        table#ContentPlaceHolder1_RadioButtonAction {
            margin-top: -13px;
        }

        input#ContentPlaceHolder1_RadioButtonAction_0 {
            margin-right: 5px;
        }

        input#ContentPlaceHolder1_RadioButtonAction_1 {
            margin-right: 5px;
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
            margin-bottom: 0px;
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
            font-size: 14px;
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
            font-size: 23px !important;
            color: #010101;
            text-transform: capitalize;
            font-weight: 700;
        }

        div#row2 {
            margin-top: -20px;
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

        td {
            padding-top: 12px !important;
            padding-bottom: 0px !important;
        }

        svg#search1:hover {
            height: 22px;
            width: 22px;
            fill: #4b49ac;
            transition: ease-out;
            margin-left: -2px;
            cursor: pointer;
        }

        input#ContentPlaceHolder1_RadioButtonList2_1 {
            margin-left: 15px;
            margin-right: 5px;
        }

        input#ContentPlaceHolder1_RadioButtonList2_0 {
            margin-left: 15px;
            margin-right: 5px;
        }

        table#ContentPlaceHolder1_RadioButtonList2 {
            margin-top: -10px;
        }

        input[type=checkbox], input[type=radio] {
            box-sizing: border-box;
            padding: 0;
            margin-right: 7px;
        }

        table#ContentPlaceHolder1_RadioButtonAction {
            margin-top: -9px;
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
                        <h7 class="card-title fw-semibold mb-4" id="maincard">ESCALATOR TEST REPORT</h7>
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
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="row" style="margin-top: 10px;">
                            <div class="col-md-12" style="text-align: left;">
                                <h7 class="card-title fw-semibold mb-4" style="font-size: 20px !important;">Intimation/Installation Details</h7>
                            </div>
                        </div>
                        <div class="card-body" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px; background: #d4d7ec; margin-bottom: 25px; border-radius: 10px; margin-top: 10px; padding-top: 10px; padding-bottom: 0px;">
                            <div class="row">
                                <div class="col-md-3" id="Div8" runat="server">
                                    <label for="Name">
                                        Applicant<samp style="color: red">* </samp>
                                    </label>
                                    <asp:TextBox class="form-control" ID="txtapplication" Enabled="false" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px; width: 100%;"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ControlToValidate="txtapplication" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </div>
                                <%--<div class="col-md-3" id="Div9" runat="server">
                                    <label for="Name">
                                        WorkIntimation ID
                                        <samp style="color: red">* </samp>
                                    </label>
                                    <asp:TextBox class="form-control" ID="txtid" Enabled="false" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator75" runat="server" ControlToValidate="txtid" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </div>--%>
                                <div class="col-md-3" id="Div10" runat="server">
                                    <label for="Name">
                                        Type of Installation<samp style="color: red">* </samp>
                                    </label>
                                    <asp:TextBox class="form-control" ID="txtInstallation" Enabled="false" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator76" runat="server" ControlToValidate="txtInstallation" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-3" id="Div12" runat="server">
                                    <label for="Name">
                                        No of Installations<samp style="color: red">* </samp>
                                    </label>
                                    <asp:TextBox class="form-control" ID="txtNOOfInstallation" Enabled="false" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator77" runat="server" ControlToValidate="txtNOOfInstallation" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 10px;">
                            <div class="col-md-12" style="text-align: left;">
                                <h7 class="card-title fw-semibold mb-4" style="font-size: 20px !important;">Installation Details</h7>
                            </div>
                        </div>
                        <div class="card-body" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px; padding: 25px; margin-bottom: 25px; border-radius: 10px; margin-top: 10px;">
                            <div>
                                <h8 class="card-title fw-semibold mb-4" style="font-size: 18px !important;">Local Agent Details</h8>
                                <div class="row" style="margin-top: 10px;">
                                    <div class="col-md-3">
                                        <label>
                                            Name and Address of Local Agent
        <samp style="color: red">* </samp>
                                        </label>
                                        <asp:RadioButtonList ID="RadioButtonList2" AutoPostBack="true" runat="server" RepeatDirection="Horizontal" TabIndex="1" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged">
                                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="0" style="margin-top: auto; margin-bottom: auto;"></asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="RadioButtonList2" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Select any Sanction Load</asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-3" id="Name" runat="server" visible="True" style="top: 0px !important;">
                                        <label for="Voltage">
                                            Name of Local Agent
                                            <samp style="color: red">* </samp>
                                        </label>
                                        <asp:TextBox class="form-control" onpaste="preventPaste(event)" AutoPostBack="true" ID="TxtAgentName" MaxLength="50" onKeyPress="return alphabetKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtAgentName" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Local Agent Name</asp:RequiredFieldValidator>
                                        <%--<asp:RangeValidator ID="rangevalidator" runat="server" ControlToValidate="TxtOthervoltage" MinimumValue="200" MaximumValue="400000" Type="Integer" ForeColor="Red" ErrorMessage="Voltage between 200 to 400000" ></asp:RangeValidator>--%>
                                    </div>
                                    <div class="col-md-3" id="Address" runat="server">
                                        <label for="Name">
                                            Address of Local Agent<samp style="color: red">* </samp>
                                        </label>
                                        <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                        <asp:TextBox class="form-control" onpaste="preventPaste(event)" ID="txtAgentAddress" onkeydown="return preventEnterSubmit(event)" MaxLength="250" placeholder="" autocomplete="off" TabIndex="3" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAgentAddress" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Local Agent Address</asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-3" runat="server" id="Contact">
                                        <label for="Name">
                                            Contact No. of Local Agent<samp style="color: red">* </samp>
                                        </label>
                                        <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                        <asp:TextBox class="form-control" onpaste="preventPaste(event)" ID="txtAgentPhone" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="10" placeholder="" autocomplete="off" TabIndex="4" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                                            runat="server" ErrorMessage="Enter valid Phone number" ControlToValidate="txtAgentPhone" ForeColor="Red" SetFocusOnError="true" ValidationGroup="Submit"
                                            ValidationExpression="^\d{10}$"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAgentPhone" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Local Agent Contact</asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <h8 class="card-title fw-semibold mb-4" style="font-size: 18px !important;">Escalator Details</h8>
                                <div class="row" style="margin-top: 10px;">
                                    <div class="col-md-4" runat="server" visible="True" style="top: 0px !important;">
                                        <label for="Voltage">
                                            Make
 <samp style="color: red">* </samp>
                                        </label>
                                        <asp:TextBox class="form-control" AutoPostBack="true" onpaste="preventPaste(event)" ID="txtMake" MaxLength="50" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="5" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtMake" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Make</asp:RequiredFieldValidator>
                                        <%--<asp:RangeValidator ID="rangevalidator" runat="server" ControlToValidate="TxtOthervoltage" MinimumValue="200" MaximumValue="400000" Type="Integer" ForeColor="Red" ErrorMessage="Voltage between 200 to 400000" ></asp:RangeValidator>--%>
                                    </div>
                                    <div class="col-md-4" runat="server" visible="True" style="top: 0px !important;">
                                        <label for="Voltage">
                                            Serial No.
                                            <samp style="color: red">* </samp>
                                        </label>
                                        <asp:TextBox class="form-control" AutoPostBack="true" onpaste="preventPaste(event)" ID="txtSerialNo" MaxLength="20" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="5" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator79" runat="server" ControlToValidate="txtSerialNo" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Date of Erection</asp:RequiredFieldValidator>
                                        <%--<asp:RangeValidator ID="rangevalidator" runat="server" ControlToValidate="TxtOthervoltage" MinimumValue="200" MaximumValue="400000" Type="Integer" ForeColor="Red" ErrorMessage="Voltage between 200 to 400000" ></asp:RangeValidator>--%>
                                    </div>
                                    <div class="col-md-4" runat="server" visible="True" style="top: 0px !important;">
                                        <label for="Voltage">
                                            Date of Erection
                                    <samp style="color: red">* </samp>
                                        </label>
                                        <asp:TextBox class="form-control" Type="Date" AutoPostBack="true" ID="txtErectionDate" MaxLength="10" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="5" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtErectionDate" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Date of Erection</asp:RequiredFieldValidator>
                                        <%--<asp:RangeValidator ID="rangevalidator" runat="server" ControlToValidate="TxtOthervoltage" MinimumValue="200" MaximumValue="400000" Type="Integer" ForeColor="Red" ErrorMessage="Voltage between 200 to 400000" ></asp:RangeValidator>--%>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="Voltage">
                                            Type of Escalator 
                                            <samp style="color: red">* </samp>
                                        </label>
                                        <asp:DropDownList class="form-control  select-form select2" AutoPostBack="true" Style="width: 100% !important;" ID="ddlEscalatorType" TabIndex="24" runat="server" OnSelectedIndexChanged="ddlPoleMainBreaker_SelectedIndexChanged">
                                            <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Travelator" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Escalator" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Text="Please Select Escalator Type" ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlEscalatorType" runat="server" InitialValue="0" Display="Dynamic" ValidationGroup="Submit" ForeColor="Red" />
                                    </div>
                                    <%--  <div class="col-md-4">
                                        <label for="Voltage">
                                            Type of Escalator Erected
        <samp style="color: red">* </samp>
                                        </label>
                                        <asp:RadioButtonList ID="RadioButtonAction" AutoPostBack="true" runat="server" RepeatDirection="Horizontal" TabIndex="25">
                                            <asp:ListItem Text="Passenger Escalator" Value="0" style="margin-top: auto; margin-bottom: auto; padding-left: 10px;"></asp:ListItem>
                                            <asp:ListItem Text="Goods Escalator" Value="1" style="margin-top: auto; margin-bottom: auto; padding-left: 10px;"></asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:RequiredFieldValidator ID="rvfRadioButtonList" ErrorMessage="Choose one" ControlToValidate="RadioButtonAction" runat="server" ValidationGroup="Submit" SetFocusOnError="true" ForeColor="Red" />
                                    </div>--%>
                                    <div class="col-md-4" runat="server">
                                        <label for="Name">
                                            Contract Speed of Escalator (Mtr./sec)<samp style="color: red">* </samp>
                                        </label>
                                        <asp:TextBox class="form-control" onpaste="preventPaste(event)" ID="txtEscalatorSpeedContract"
                                            onKeyPress="return isNumberdecimalKey(event, this);"
                                            onkeydown="return preventEnterSubmit(event)"
                                            MaxLength="6" placeholder="" autocomplete="off"
                                            TabIndex="7" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                            ControlToValidate="txtEscalatorSpeedContract"
                                            ErrorMessage="RequiredFieldValidator"
                                            ValidationGroup="Submit" ForeColor="Red">
        Please Enter Speed of Escalator
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-4" runat="server">
                                        <label for="Name">
                                            Contract Load of Escalator (in Kg)
                                        </label>
                                        <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                        <asp:TextBox class="form-control" ID="txtEscalatorLoad" onpaste="preventPaste(event)" onKeyPress="return isNumberdecimalKey(event, this);" onkeydown="return preventEnterSubmit(event)" MaxLength="5" placeholder="" autocomplete="off" TabIndex="8" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4" runat="server">
                                        <label for="Name">
                                            Max Person Capacity (with Escalator Operator)<samp style="color: red">* </samp>
                                        </label>
                                        <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                        <asp:TextBox class="form-control" ID="txtMaxPersonCapacity" onpaste="preventPaste(event)" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="2" placeholder="" autocomplete="off" TabIndex="9" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtMaxPersonCapacity" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Max Person Capacity</asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-4" runat="server">
                                        <label for="Name">
                                            Weight of Escalator Car with Contact Load (in kg)<samp style="color: red">* </samp>
                                        </label>
                                        <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                        <asp:TextBox class="form-control" ID="txtWeight" onpaste="preventPaste(event)" onKeyPress="return isNumberdecimalKey(event, this);" onkeydown="return preventEnterSubmit(event)" MaxLength="6" placeholder="" autocomplete="off" TabIndex="10" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtWeight" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Weight of Escalator</asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-4" runat="server">
                                        <label for="Name">
                                            Weight of Counter Weight (in kg)
                                        </label>
                                        <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                        <asp:TextBox class="form-control" ID="txtCounterWeight" onpaste="preventPaste(event)" onKeyPress="return isNumberdecimalKey(event, this);" onkeydown="return preventEnterSubmit(event)" MaxLength="6" placeholder="" autocomplete="off" TabIndex="11" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4" runat="server">
                                        <label for="Name">
                                            Depth of Pit (in mm)<samp style="color: red">* </samp>
                                        </label>
                                        <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                        <asp:TextBox class="form-control" ID="txtPitDepth" onpaste="preventPaste(event)" onKeyPress="return isNumberdecimalKey(event, this);" onkeydown="return preventEnterSubmit(event)" MaxLength="6" placeholder="" autocomplete="off" TabIndex="12" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtPitDepth" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Depth of Pit</asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-4" runat="server">
                                        <label for="Name">
                                            Travel Distance of Escalator (in mtr)
                                        </label>
                                        <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                        <asp:TextBox class="form-control" ID="txtTravelDistance" onpaste="preventPaste(event)" onKeyPress="return isNumberdecimalKey(event, this);" onkeydown="return preventEnterSubmit(event)" MaxLength="7" placeholder="" autocomplete="off" TabIndex="13" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4" runat="server">
                                        <label for="Name">
                                            No. of Floors Served (in mtr)
                                        </label>
                                        <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                        <asp:TextBox class="form-control" ID="txtFloorsServed" onpaste="preventPaste(event)" onKeyPress="return isNumberdecimalKey(event, this);" onkeydown="return preventEnterSubmit(event)" MaxLength="5" placeholder="" autocomplete="off" TabIndex="14" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4" runat="server">
                                        <label for="Name">
                                            Total Head Room (in mm)
                                        </label>
                                        <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                        <asp:TextBox class="form-control" ID="txtTotalHeadRoom" onpaste="preventPaste(event)" onKeyPress="return isNumberdecimalKey(event, this);" onkeydown="return preventEnterSubmit(event)" MaxLength="6" placeholder="" autocomplete="off" TabIndex="15" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4" runat="server">
                                        <label for="Name">
                                            Type of Control<samp style="color: red">* </samp>
                                        </label>
                                        <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                        <asp:TextBox class="form-control" ID="txtTypeofControll" onpaste="preventPaste(event)" onkeydown="return preventEnterSubmit(event)" MaxLength="30" placeholder="" autocomplete="off" TabIndex="16" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator62" runat="server" ControlToValidate="txtTypeofControll" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Total Head Room</asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="row" style="margin-top: 10px;">
                                </div>

                            </div>
                        </div>
                        <div class="row" style="margin-top: 10px;">
                            <div class="col-md-12" style="text-align: left;">
                                <h7 class="card-title fw-semibold mb-4" style="font-size: 20px !important;">Machine Main Breaker Details</h7>
                            </div>
                        </div>
                        <div class="card-body" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px; padding: 25px; margin-bottom: 25px; border-radius: 10px; margin-top: 10px;">
                            <h8 class="card-title fw-semibold mb-4" style="font-size: 18px !important;">Main Breaker</h8>
                            <div class="row" style="margin-top: 10px;">
                                <div class="col-md-4" runat="server">
                                    <label for="Name">
                                        Make<samp style="color: red">* </samp>
                                    </label>
                                    <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                    <asp:TextBox class="form-control" ID="txtMakeMainBreaker" onpaste="preventPaste(event)" onkeydown="return preventEnterSubmit(event)" MaxLength="50" placeholder="" autocomplete="off" TabIndex="22" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="txtMakeMainBreaker" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Make</asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-4" runat="server">
                                    <label for="Name">
                                        Type<samp style="color: red">* </samp>
                                    </label>
                                    <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                    <asp:TextBox class="form-control" ID="txtTypeMainBreaker" onpaste="preventPaste(event)" onkeydown="return preventEnterSubmit(event)" MaxLength="150" placeholder="" autocomplete="off" TabIndex="23" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="txtTypeMainBreaker" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Type</asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-4">
                                    <label>
                                        Poles
                        <samp style="color: red">* </samp>
                                    </label>
                                    <asp:DropDownList class="form-control  select-form select2" AutoPostBack="true" Style="width: 100% !important;" ID="ddlPoleMainBreaker" TabIndex="24" runat="server" OnSelectedIndexChanged="ddlPoleMainBreaker_SelectedIndexChanged">
                                        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="DP" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="TPN" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" Text="Please Select Poles" ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlPoleMainBreaker" runat="server" InitialValue="0" Display="Dynamic" ValidationGroup="Submit" ForeColor="Red" />

                                </div>
                                <div class="col-md-4" runat="server">
                                    <label for="Name">
                                        Current Rating (in Amps)<samp style="color: red">* </samp>
                                    </label>
                                    <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                    <asp:TextBox class="form-control" ID="txtratingMainBreaker" onpaste="preventPaste(event)" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="7" placeholder="" autocomplete="off" TabIndex="25" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="txtratingMainBreaker" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Rating</asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-4" runat="server">
                                    <label for="Name">
                                        Breaking Capacity (in KA)<samp style="color: red">* </samp>
                                    </label>
                                    <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                    <asp:TextBox class="form-control" ID="txtCapacityMainBreaker" onpaste="preventPaste(event)" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="7" placeholder="" autocomplete="off" TabIndex="26" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="txtCapacityMainBreaker" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Capacity</asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <h8 class="card-title fw-semibold mb-4" style="font-size: 18px !important;">RCCB</h8>
                            <div class="row" style="margin-top: 10px;">
                                <div class="col-md-4" runat="server">
                                    <label for="Name">
                                        Make<samp style="color: red">* </samp>
                                    </label>
                                    <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                    <asp:TextBox class="form-control" ID="txtMakeRCCBMainBreaker" onpaste="preventPaste(event)" onkeydown="return preventEnterSubmit(event)" MaxLength="50" placeholder="" autocomplete="off" TabIndex="27" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="txtMakeRCCBMainBreaker" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Make</asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-4">
                                    <label>
                                        Poles   
                        <samp style="color: red">* </samp>
                                    </label>
                                    <asp:DropDownList class="form-control  select-form select2" AutoPostBack="true" Style="width: 100% !important;" ID="ddlPolesRCCBMainBreaker" TabIndex="28" runat="server">
                                        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="DP" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="TPN" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator55" Text="Please Select Poles" ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlPolesRCCBMainBreaker" runat="server" InitialValue="0" Display="Dynamic" ValidationGroup="Submit" ForeColor="Red" />

                                </div>
                                <div class="col-md-4" runat="server">
                                    <label for="Name">
                                        Current Rating (in Amps)<samp style="color: red">* </samp>
                                    </label>
                                    <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                    <asp:TextBox class="form-control" ID="txtRatingRCCBMainBreaker" onpaste="preventPaste(event)" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="7" placeholder="" autocomplete="off" TabIndex="29" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ControlToValidate="txtRatingRCCBMainBreaker" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Rating</asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-4" runat="server">
                                    <label for="Name">
                                        Fault Current Rating (in MA)<samp style="color: red">* </samp>
                                    </label>
                                    <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                    <asp:TextBox class="form-control" ID="txtfaultratingRCCBMainBreaker" onpaste="preventPaste(event)" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="7" placeholder="" autocomplete="off" TabIndex="30" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ControlToValidate="txtfaultratingRCCBMainBreaker" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Rating</asp:RequiredFieldValidator>
                                </div>
                            </div>

                        </div>
                        <div class="row" style="margin-top: 10px;">
                            <div class="col-md-12" style="text-align: left;">
                                <h7 class="card-title fw-semibold mb-4" style="font-size: 20px !important;">Lighting Load Breaker Details</h7>
                            </div>
                        </div>
                        <div class="card-body" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px; padding: 25px; margin-bottom: 25px; border-radius: 10px; margin-top: 10px;">
                            <h8 class="card-title fw-semibold mb-4" style="font-size: 18px !important;">Main Breaker</h8>
                            <div class="row" style="margin-top: 10px;">
                                <div class="col-md-4" runat="server">
                                    <label for="Name">
                                        Make<samp style="color: red">* </samp>
                                    </label>
                                    <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                    <asp:TextBox class="form-control" ID="txtMakeLoadBreaker" onpaste="preventPaste(event)" onkeydown="return preventEnterSubmit(event)" MaxLength="50" placeholder="" autocomplete="off" TabIndex="31" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="txtMakeLoadBreaker" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Make</asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-4" runat="server">
                                    <label for="Name">
                                        Type<samp style="color: red">* </samp>
                                    </label>
                                    <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                    <asp:TextBox class="form-control" ID="txtTypeLoadBreaker" onpaste="preventPaste(event)" onkeydown="return preventEnterSubmit(event)" MaxLength="150" placeholder="" autocomplete="off" TabIndex="32" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ControlToValidate="txtTypeLoadBreaker" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Type</asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-4">
                                    <label>
                                        Poles
                        <samp style="color: red">* </samp>
                                    </label>
                                    <asp:DropDownList class="form-control  select-form select2" AutoPostBack="true" Style="width: 100% !important;" ID="ddlPolesLoadBreaker" TabIndex="33" runat="server">
                                        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="DP" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="TPN" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator56" Text="Please Select Poles" ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlPolesLoadBreaker" runat="server" InitialValue="0" Display="Dynamic" ValidationGroup="Submit" ForeColor="Red" />

                                </div>
                                <div class="col-md-4" runat="server">
                                    <label for="Name">
                                        Current Rating (in Amps)<samp style="color: red">* </samp>
                                    </label>
                                    <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                    <asp:TextBox class="form-control" ID="txtRatingLoadBreaker" onpaste="preventPaste(event)" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="7" placeholder="" autocomplete="off" TabIndex="34" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ControlToValidate="txtRatingLoadBreaker" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Rating</asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-4" runat="server">
                                    <label for="Name">
                                        Breaking Capacity (in KA)<samp style="color: red">* </samp>
                                    </label>
                                    <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                    <asp:TextBox class="form-control" ID="txtCapacityLoadBreaker" onpaste="preventPaste(event)" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="7" placeholder="" autocomplete="off" TabIndex="35" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ControlToValidate="txtCapacityLoadBreaker" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Capacity</asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <h8 class="card-title fw-semibold mb-4" style="font-size: 18px !important;">RCCB</h8>
                            <div class="row" style="margin-top: 10px;">
                                <div class="col-md-4" runat="server">
                                    <label for="Name">
                                        Make<samp style="color: red">* </samp>
                                    </label>
                                    <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                    <asp:TextBox class="form-control" ID="txtMakeRCCBLoadBreaker" onpaste="preventPaste(event)" onkeydown="return preventEnterSubmit(event)" MaxLength="50" placeholder="" autocomplete="off" TabIndex="36" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ControlToValidate="txtMakeRCCBLoadBreaker" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Make</asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-4">
                                    <label>
                                        Poles
                        <samp style="color: red">* </samp>
                                    </label>
                                    <asp:DropDownList class="form-control  select-form select2" AutoPostBack="true" Style="width: 100% !important;" ID="ddlpolesRCCBLoadBreaker" TabIndex="37" runat="server">
                                        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="DP" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="TPN" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator57" Text="Please Select Poles" ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlpolesRCCBLoadBreaker" runat="server" InitialValue="0" Display="Dynamic" ValidationGroup="Submit" ForeColor="Red" />

                                </div>
                                <div class="col-md-4" runat="server">
                                    <label for="Name">
                                        Current Rating (in Amps)<samp style="color: red">* </samp>
                                    </label>
                                    <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                    <asp:TextBox class="form-control" ID="txtRatingRCCBLoadBreaker" onpaste="preventPaste(event)" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="7" placeholder="" autocomplete="off" TabIndex="38" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" ControlToValidate="txtRatingRCCBLoadBreaker" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Rating</asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-4" runat="server">
                                    <label for="Name">
                                        Fault Current Rating<samp style="color: red">* </samp>
                                    </label>
                                    <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                    <asp:TextBox class="form-control" ID="txtFaultCurrentRCCBLoadBreaker" onpaste="preventPaste(event)" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="7" placeholder="" autocomplete="off" TabIndex="39" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" ControlToValidate="txtFaultCurrentRCCBLoadBreaker" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Rating</asp:RequiredFieldValidator>
                                </div>
                            </div>

                        </div>
                        <div class="row" style="margin-top: 10px;">
                            <div class="col-md-12" style="text-align: left;">
                                <h7 class="card-title fw-semibold mb-4" style="font-size: 20px !important;">Insulation Resistance</h7>
                            </div>
                        </div>
                        <div class="card-body" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px; padding: 25px; margin-bottom: 25px; border-radius: 10px; margin-top: 10px;">
                            <div class="row" style="margin-top: 10px;">
                                <div class="col-md-4" runat="server">
                                    <label for="Name">
                                        For Whole Installation<samp style="color: red">* </samp>
                                    </label>
                                    <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                    <asp:TextBox class="form-control" ID="txtwholeInstallation" onpaste="preventPaste(event)" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="7" placeholder="" autocomplete="off" TabIndex="40" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtwholeInstallation" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Installation</asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-4" id="TPN1" runat="server" visible="false">
                                    <label for="Name">
                                        Neutral and Phase (ohms)<samp style="color: red">* </samp>
                                    </label>
                                    <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                    <asp:TextBox class="form-control" ID="txtNeutralPhase" onpaste="preventPaste(event)" onKeyPress="return isNumberdecimalKey(event, this);" onkeydown="return preventEnterSubmit(event)" MaxLength="7" placeholder="" autocomplete="off" TabIndex="41" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator63" runat="server" ControlToValidate="txtNeutralPhase" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Installation</asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-4" id="TPN2" runat="server" visible="false">
                                    <label for="Name">
                                        Earth and Phase (mohms)<samp style="color: red">* </samp>
                                    </label>
                                    <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                    <asp:TextBox class="form-control" ID="txtEarthPhase" onpaste="preventPaste(event)" onKeyPress="return isNumberdecimalKey(event, this);" onkeydown="return preventEnterSubmit(event)" MaxLength="7" placeholder="" autocomplete="off" TabIndex="42" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator78" runat="server" ControlToValidate="txtEarthPhase" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Installation</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div id="InDPO" runat="server">
                                <h8 class="card-title fw-semibold mb-4" style="font-size: 18px !important;">Between Phases</h8>
                                <div class="row" style="margin-top: 10px;">
                                    <div class="col-md-4" runat="server">
                                        <label for="Name">
                                            Red Phase – Yellow Phase(in Mohms)<samp style="color: red">* </samp>
                                        </label>
                                        <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                        <asp:TextBox class="form-control" ID="txtRedYellow" onpaste="preventPaste(event)" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="7" placeholder="" autocomplete="off" TabIndex="43" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" ControlToValidate="txtRedYellow" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Phase</asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-4" runat="server">
                                        <label for="Name">
                                            Red Phase – Blue Phase(in Mohms)<samp style="color: red">* </samp>
                                        </label>
                                        <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                        <asp:TextBox class="form-control" ID="txtRedBlue" onpaste="preventPaste(event)" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="7" placeholder="" autocomplete="off" TabIndex="44" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ControlToValidate="txtRedBlue" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Phase</asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-4" runat="server">
                                        <label for="Name">
                                            Yellow Phase – Blue Phase(in Mohms)<samp style="color: red">* </samp>
                                        </label>
                                        <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                        <asp:TextBox class="form-control" ID="txtYellowBlue" onpaste="preventPaste(event)" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="7" placeholder="" autocomplete="off" TabIndex="45" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ControlToValidate="txtYellowBlue" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Phase</asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <h8 id="Heading" runat="Server" class="card-title fw-semibold mb-4" style="font-size: 18px !important;">Between Each Phase and Earth</h8>
                                <div class="row" style="margin-top: 10px;">
                                    <div class="col-md-4" runat="server">
                                        <label for="Name">
                                            Red Phase – Earth Wire(in Mohms)<samp style="color: red">* </samp>
                                        </label>
                                        <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                        <asp:TextBox class="form-control" ID="txtRedEarth" onpaste="preventPaste(event)" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="7" placeholder="" autocomplete="off" TabIndex="46" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" ControlToValidate="txtRedEarth" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Phase</asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-4" runat="server">
                                        <label for="Name">
                                            Yellow Phase – Earth Wire(in Mohms)<samp style="color: red">* </samp>
                                        </label>
                                        <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                        <asp:TextBox class="form-control" ID="txtYellowEarth" onpaste="preventPaste(event)" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="7" placeholder="" autocomplete="off" TabIndex="47" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" ControlToValidate="txtYellowEarth" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Phase</asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-4" runat="server">
                                        <label for="Name">
                                            Blue Phase – Earth Wire(in Mohms)<samp style="color: red">* </samp>
                                        </label>
                                        <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                        <asp:TextBox class="form-control" onpaste="preventPaste(event)" ID="txtBlueEarth" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="7" placeholder="" autocomplete="off" TabIndex="48" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" ControlToValidate="txtBlueEarth" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Phase</asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="Earthing" runat="server" visible="true" class="card-body" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px; padding: 25px; margin-bottom: 25px; border-radius: 10px; margin-top: 10px;">
                            <div class="row" style="margin-top: 10px;">
                                <div class="col-md-12" style="text-align: left;">
                                    <h7 class="card-title fw-semibold mb-4" style="font-size: 20px !important;">Earthing Details</h7>
                                </div>
                            </div>
                            <div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <label>
                                            Number of Earthing<samp style="color: red">* </samp>
                                        </label>
                                        <asp:DropDownList class="form-control  select-form select2" TabIndex="49" runat="server" AutoPostBack="true" ID="ddlNoOfEarthing" selectionmode="Multiple" Style="width: 100% !important" OnSelectedIndexChanged="ddlNoOfEarthing_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator44" ControlToValidate="ddlNoOfEarthing" runat="server" ForeColor="Red" InitialValue="0" ValidationGroup="Submit" ErrorMessage="Please Enter No of Earthing"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="table-responsive pt-3" id="LineEarthingdiv" runat="server" visible="false">
                                        <table id="tbl" runat="server" class="table table-bordered table-striped">
                                            <thead class="table-dark">
                                                <tr>
                                                    <th>S.No.
                                                    </th>
                                                    <th style="width: 60% !important;">Earthing Type
                                                    </th>
                                                    <th>Value in(ohms)
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr id="Earthingtype1" visible="true" runat="server" style="display: table-row;">
                                                    <td>1</td>
                                                    <td>
                                                        <div class="col-md-12">
                                                            <asp:DropDownList class="form-control  select-form select2" TabIndex="50" runat="server" AutoPostBack="true" ID="ddlEarthingtype1" selectionmode="Multiple" Style="width: 100% !important">
                                                                <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                                                <asp:ListItem Value="1" Text="Rod"></asp:ListItem>
                                                                <asp:ListItem Value="2" Text="Pipe"></asp:ListItem>
                                                                <asp:ListItem Value="3" Text="Plate"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator45" ControlToValidate="ddlEarthingtype1" runat="server" ForeColor="Red" InitialValue="0" ValidationGroup="Submit" ErrorMessage="Please Select Earth Type"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="col-md-12">
                                                            <asp:TextBox class="form-control" onpaste="preventPaste(event)" ID="txtearthingValue1" MaxLength="7" onKeyPress="return isNumberdecimalKey(event, this);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="51" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator73" ControlToValidate="txtearthingValue1" runat="server" ForeColor="Red" ValidationGroup="Submit" ErrorMessage="Please Enter Value"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="Earthingtype2" visible="true" runat="server">
                                                    <td>2</td>
                                                    <td>
                                                        <div class="col-md-12">
                                                            <asp:DropDownList class="form-control  select-form select2" TabIndex="52" runat="server" AutoPostBack="true" ID="ddlEarthingtype2" selectionmode="Multiple" Style="width: 100% !important">
                                                                <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                                                <asp:ListItem Value="1" Text="Rod"></asp:ListItem>
                                                                <asp:ListItem Value="2" Text="Pipe"></asp:ListItem>
                                                                <asp:ListItem Value="3" Text="Plate"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator46" ControlToValidate="ddlEarthingtype2" runat="server" ForeColor="Red" InitialValue="0" ValidationGroup="Submit" ErrorMessage="Please Select Earth Type"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="col-md-12">
                                                            <asp:TextBox class="form-control" ID="txtEarthingValue2" onpaste="preventPaste(event)" MaxLength="7" onKeyPress="return isNumberdecimalKey(event, this);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="53" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator72" ControlToValidate="txtEarthingValue2" runat="server" ForeColor="Red" ValidationGroup="Submit" ErrorMessage="Please Enter Value"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="Earthingtype3" runat="server" visible="true">
                                                    <td>3</td>
                                                    <td>
                                                        <div class="col-md-12">
                                                            <asp:DropDownList class="form-control  select-form select2" TabIndex="54" runat="server" AutoPostBack="true" ID="ddlEarthingtype3" selectionmode="Multiple" Style="width: 100% !important">
                                                                <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                                                <asp:ListItem Value="1" Text="Rod"></asp:ListItem>
                                                                <asp:ListItem Value="2" Text="Pipe"></asp:ListItem>
                                                                <asp:ListItem Value="3" Text="Plate"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator47" ControlToValidate="ddlEarthingtype3" runat="server" ForeColor="Red" InitialValue="0" ValidationGroup="Submit" ErrorMessage="Please Select Earth Type"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="col-md-12">
                                                            <asp:TextBox class="form-control" ID="txtEarthingValue3" onpaste="preventPaste(event)" MaxLength="7" onKeyPress="return isNumberdecimalKey(event, this);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="55" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator71" ControlToValidate="txtEarthingValue3" runat="server" ForeColor="Red" ValidationGroup="Submit" ErrorMessage="Please Enter Value"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="Earthingtype4" runat="server" visible="true">
                                                    <td>4</td>
                                                    <td>
                                                        <div class="col-md-12">
                                                            <asp:DropDownList class="form-control  select-form select2" TabIndex="56" runat="server" AutoPostBack="true" ID="ddlEarthingtype4" selectionmode="Multiple" Style="width: 100% !important">
                                                                <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                                                <asp:ListItem Value="1" Text="Rod"></asp:ListItem>
                                                                <asp:ListItem Value="2" Text="Pipe"></asp:ListItem>
                                                                <asp:ListItem Value="3" Text="Plate"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator48" ControlToValidate="ddlEarthingtype4" runat="server" ForeColor="Red" InitialValue="0" ValidationGroup="Submit" ErrorMessage="Please Select Earth Type"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="col-md-12" id="Div15" runat="server">
                                                            <asp:TextBox class="form-control" ID="txtEarthingValue4" onpaste="preventPaste(event)" MaxLength="7" onKeyPress="return isNumberdecimalKey(event, this);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="57" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator70" ControlToValidate="txtEarthingValue4" runat="server" ForeColor="Red" ValidationGroup="Submit" ErrorMessage="Please Enter Value"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="Earthingtype5" runat="server" visible="true">
                                                    <td>5</td>
                                                    <td>
                                                        <div class="col-md-12">
                                                            <asp:DropDownList class="form-control  select-form select2" TabIndex="58" runat="server" AutoPostBack="true" ID="ddlEarthingtype5" selectionmode="Multiple" Style="width: 100% !important">
                                                                <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                                                <asp:ListItem Value="1" Text="Rod"></asp:ListItem>
                                                                <asp:ListItem Value="2" Text="Pipe"></asp:ListItem>
                                                                <asp:ListItem Value="3" Text="Plate"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator49" ControlToValidate="ddlEarthingtype5" runat="server" ForeColor="Red" InitialValue="0" ValidationGroup="Submit" ErrorMessage="Please Select Earth Type"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="col-md-12">
                                                            <asp:TextBox class="form-control" ID="txtEarthingValue5" onpaste="preventPaste(event)" MaxLength="7" onKeyPress="return isNumberdecimalKey(event, this);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="59" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator69" ControlToValidate="txtEarthingValue5" runat="server" ForeColor="Red" ValidationGroup="Submit" ErrorMessage="Please Enter Value"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="Earthingtype6" runat="server" visible="true">
                                                    <td>6</td>
                                                    <td>
                                                        <div class="col-md-12">
                                                            <asp:DropDownList class="form-control  select-form select2" onKeyPress="return isNumberKey(event);" TabIndex="60" runat="server" AutoPostBack="true" ID="ddlEarthingtype6" selectionmode="Multiple" Style="width: 100% !important">
                                                                <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                                                <asp:ListItem Value="1" Text="Rod"></asp:ListItem>
                                                                <asp:ListItem Value="2" Text="Pipe"></asp:ListItem>
                                                                <asp:ListItem Value="3" Text="Plate"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator50" ControlToValidate="ddlEarthingtype6" runat="server" ForeColor="Red" InitialValue="0" ValidationGroup="Submit" ErrorMessage="Please Select Earth Type"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="col-md-12">
                                                            <asp:TextBox class="form-control" ID="txtEarthingValue6" onpaste="preventPaste(event)" MaxLength="7" onKeyPress="return isNumberdecimalKey(event, this);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="61" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator68" ControlToValidate="txtEarthingValue6" runat="server" ForeColor="Red" ValidationGroup="Submit" ErrorMessage="Please Enter Value"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="Earthingtype7" runat="server" visible="true">
                                                    <td>7</td>
                                                    <td>
                                                        <div class="col-md-12">
                                                            <asp:DropDownList class="form-control  select-form select2" TabIndex="62" runat="server" AutoPostBack="true" ID="ddlEarthingtype7" selectionmode="Multiple" Style="width: 100% !important">
                                                                <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                                                <asp:ListItem Value="1" Text="Rod"></asp:ListItem>
                                                                <asp:ListItem Value="2" Text="Pipe"></asp:ListItem>
                                                                <asp:ListItem Value="3" Text="Plate"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator51" ControlToValidate="ddlEarthingtype7" runat="server" ForeColor="Red" InitialValue="0" ValidationGroup="Submit" ErrorMessage="Please Select Earth Type"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="col-md-12">
                                                            <asp:TextBox class="form-control" ID="txtEarthingValue7" onpaste="preventPaste(event)" MaxLength="7" onKeyPress="return isNumberdecimalKey(event, this);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="63" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator67" ControlToValidate="txtEarthingValue7" runat="server" ForeColor="Red" ValidationGroup="Submit" ErrorMessage="Please Enter Value"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="Earthingtype8" runat="server" visible="true">
                                                    <td>8</td>
                                                    <td>
                                                        <div class="col-md-12">
                                                            <asp:DropDownList class="form-control  select-form select2" TabIndex="64" runat="server" AutoPostBack="true" ID="ddlEarthingtype8" selectionmode="Multiple" Style="width: 100% !important">
                                                                <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                                                <asp:ListItem Value="1" Text="Rod"></asp:ListItem>
                                                                <asp:ListItem Value="2" Text="Pipe"></asp:ListItem>
                                                                <asp:ListItem Value="3" Text="Plate"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator52" ControlToValidate="ddlEarthingtype8" runat="server" ForeColor="Red" InitialValue="0" ValidationGroup="Submit" ErrorMessage="Please Select Earth Type"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="col-md-12">
                                                            <asp:TextBox class="form-control" ID="txtEarthingValue8" onpaste="preventPaste(event)" MaxLength="7" onKeyPress="return isNumberdecimalKey(event, this);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="65" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator66" ControlToValidate="txtEarthingValue8" runat="server" ForeColor="Red" ValidationGroup="Submit" ErrorMessage="Please Enter Value"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="Earthingtype9" runat="server" visible="true">
                                                    <td>9</td>
                                                    <td>
                                                        <div class="col-md-12">
                                                            <asp:DropDownList class="form-control  select-form select2" TabIndex="66" runat="server" AutoPostBack="true" ID="ddlEarthingtype9" selectionmode="Multiple" Style="width: 100% !important">
                                                                <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                                                <asp:ListItem Value="1" Text="Rod"></asp:ListItem>
                                                                <asp:ListItem Value="2" Text="Pipe"></asp:ListItem>
                                                                <asp:ListItem Value="3" Text="Plate"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator53" ControlToValidate="ddlEarthingtype9" runat="server" ForeColor="Red" InitialValue="0" ValidationGroup="Submit" ErrorMessage="Please Select Earth Type"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="col-md-12">
                                                            <asp:TextBox class="form-control" ID="txtEarthingValue9" onpaste="preventPaste(event)" MaxLength="7" onKeyPress="return isNumberdecimalKey(event, this);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="67" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator65" ControlToValidate="txtEarthingValue9" runat="server" ForeColor="Red" ValidationGroup="Submit" ErrorMessage="Please Enter Value"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="Earthingtype10" runat="server" visible="true">
                                                    <td>10</td>
                                                    <td>
                                                        <div class="col-md-12">
                                                            <asp:DropDownList class="form-control  select-form select2" TabIndex="68" runat="server" AutoPostBack="true" ID="ddlEarthingtype10" selectionmode="Multiple" Style="width: 100% !important">
                                                                <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                                                <asp:ListItem Value="1" Text="Rod"></asp:ListItem>
                                                                <asp:ListItem Value="2" Text="Pipe"></asp:ListItem>
                                                                <asp:ListItem Value="3" Text="Plate"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator54" ControlToValidate="ddlEarthingtype10" runat="server" ForeColor="Red" InitialValue="0" ValidationGroup="Submit" ErrorMessage="Please Select Earth Type"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="col-md-12">
                                                            <asp:TextBox class="form-control" ID="txtEarthingValue10" onpaste="preventPaste(event)" MaxLength="7" onKeyPress="return isNumberdecimalKey(event, this);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="69" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator64" ControlToValidate="txtEarthingValue10" runat="server" ForeColor="Red" ValidationGroup="Submit" ErrorMessage="Please Enter Value"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="Div1" runat="server" visible="true" class="card-body" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px; padding: 25px; margin-bottom: 25px; border-radius: 10px; margin-top: 10px;">
                            <div class="row" style="margin-top: 10px;">
                                <div class="col-md-12" style="text-align: left;">
                                    <h7 class="card-title fw-semibold mb-4" style="font-size: 20px !important;">Supervisor/Contractor Details</h7>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4" runat="server">
                                    <label for="Name">
                                        Contractor Name<samp style="color: red">* </samp>
                                    </label>
                                    <asp:DropDownList class="form-control  select-form select2" TabIndex="70" runat="server" AutoPostBack="true" ID="ddlContName" selectionmode="Multiple" Style="width: 100% !important" OnSelectedIndexChanged="ddlContName_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator59" ControlToValidate="ddlContName" runat="server" ForeColor="Red" InitialValue="0" ValidationGroup="Submit" ErrorMessage="Please Select Contractor Name"></asp:RequiredFieldValidator>

                                    <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                </div>
                                <div class="col-md-4" runat="server">
                                    <label for="Name">
                                        Contractor License No.<samp style="color: red">* </samp>
                                    </label>
                                    <asp:TextBox class="form-control" ID="txtContName" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="7" placeholder="" autocomplete="off" TabIndex="71" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator58" runat="server" ControlToValidate="txtContName" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Phase</asp:RequiredFieldValidator>

                                    <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                </div>
                                <div class="col-md-4" runat="server">
                                    <label for="Name">
                                        License Expiry Date<samp style="color: red">* </samp>
                                    </label>
                                    <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                    <asp:TextBox class="form-control" ID="txtContExp" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="7" placeholder="" autocomplete="off" TabIndex="72" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator60" runat="server" ControlToValidate="txtContExp" ErrorMessage="RequiredFieldValidator" ValidationGroup="Submit" ForeColor="Red">Please Enter Phase</asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-4" runat="server">
                                    <label for="Name">
                                        Supervisor Name<samp style="color: red">* </samp>
                                    </label>
                                    <asp:DropDownList class="form-control  select-form select2" TabIndex="73" runat="server" AutoPostBack="true" ID="ddlLicenseNo" selectionmode="Multiple" Style="width: 100% !important" OnSelectedIndexChanged="ddlLicenseNo_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator61" ControlToValidate="ddlLicenseNo" runat="server" ForeColor="Red" InitialValue="0" ValidationGroup="Submit" ErrorMessage="Please Select Supervisor Name"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-4" runat="server">
                                    <label for="Name">
                                        Supervisor License No.<samp style="color: red">* </samp>
                                    </label>
                                    <asp:TextBox class="form-control" ID="txtSupLicenseNo" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="7" placeholder="" autocomplete="off" TabIndex="74" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                    <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                </div>
                                <div class="col-md-4" runat="server">
                                    <label for="Name">
                                        License Expiry Date<samp style="color: red">* </samp>
                                    </label>
                                    <%--<asp:TextBox class="form-control" ID="txtLineLength" onKeyPress="return isNumberKey(event) && preventZero(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="3" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>--%>
                                    <asp:TextBox class="form-control" ID="txtSupExpiryDate" ReadOnly="true" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" MaxLength="7" placeholder="" autocomplete="off" TabIndex="75" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                    </ContentTemplate>

                </asp:UpdatePanel>
                <div class="card-body" id="Attachments" runat="server" visible="false" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px; padding: 25px; margin-bottom: 25px; border-radius: 10px; margin-top: 10px;">
                     <h7 class="card-title fw-semibold mb-4" style="font-size: 20px !important;">Upload Documents</h7>
                    <h7 class="card-title" style="color: #a52a2a; margin-bottom: 5px;">Note: Size of all the Attachments should not be more than 10mb.</h7>
                    <div class="row">
                        <div class="col-12">
                            <asp:GridView class="table-responsive table table-hover table-striped" ID="Grd_Document" OnRowCommand="Grd_Document_RowCommand" runat="server" AutoGenerateColumns="false">
                                <%-- <asp:GridView class="table-responsive table table-hover table-striped" ID="Grd_Document"  OnRowCommand="Grd_Document_RowCommand"  runat="server" AutoGenerateColumns="false">--%>
                                <PagerStyle CssClass="pagination-ys" />
                                <Columns>

                                    <asp:TemplateField HeaderText="" Visible="False">
                                        <HeaderStyle HorizontalAlign="Left" CssClass="headercolor leftalign" />
                                        <ItemTemplate>
                                            <asp:Label ID="LblDocumentID" runat="server" Text='<%#Eval("DocumentID") %>'></asp:Label>
                                            <asp:Label ID="LblDocumentName" runat="server" Text='<%#Eval("DocumentName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="SNo">
                                        <HeaderStyle Width="5%" CssClass="headercolor" />
                                        <ItemStyle Width="5%" />
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%-- <asp:BoundField DataField="SNo" HeaderText="SNo" />--%>
                                    <%--  <asp:BoundField DataField="DocumentID" HeaderText="DocumentID" />--%>
                                    <asp:BoundField DataField="DocumentName" HeaderText="DocumentName">
                                        <HeaderStyle HorizontalAlign="Left" Width="70%" CssClass="headercolor leftalign" />
                                        <ItemStyle HorizontalAlign="Left" Width="70%" />
                                    </asp:BoundField>

                                    <asp:TemplateField HeaderText="File Upload (1MB PDF Only)">
                                        <HeaderStyle HorizontalAlign="Left" CssClass="headercolor leftalign" />
                                        <ItemTemplate>
                                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="file-upload" onchange="validateFileType(this)" />
                                            <span class="error-message" style="color: red; display: none;">Only PDF files are allowed.</span>
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
                    </div>
                </div>
                <div class="row" style="margin-top: 50px;" id="Declaration" Visible="false" runat="server">
                    <%--  <div class="col-2"></div>--%>
                    <div class="col-md-12">
                        <asp:CheckBox ID="CheckBox1" runat="server"  AutoPostBack="true" Text="&nbsp;This is to certify that the electrical installation is complete in all respects and the work has been carried out
conforming to the CEA (Measures relating to Safety & Electric Supply) Regulation, 2023 and relevant standards. The
Site tests done are found to be in order and it is electrically safe to operate the apparatus free from any danger.
" Font-Size="Medium" Font-Bold="True" />
                        <br />
                        <label id="labelVerification" runat="server" visible="false" style="color: red; font-size: 1.125rem">
                            Please Verify this.
                        </label>
                    </div>
                </div>
                <div class="row" id="OTP" runat="server" visible="false">

                    <div class="col-md-4">
                        <label>
                            Enter the OTP you received to Your Contractor's Email
                                    <samp style="color: red">* </samp>
                        </label>
                        <asp:TextBox class="form-control" ID="txtOTP" MaxLength="6" onKeyPress="return isNumberKey(event);" onkeydown="return preventEnterSubmit(event)" placeholder="" autocomplete="off" TabIndex="2" runat="server" Style="margin-left: 18px"></asp:TextBox>
                       <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator74" ControlToValidate="txtOTP" runat="server" ForeColor="Red" ValidationGroup="Submit" ErrorMessage="Please Enter OTP"></asp:RequiredFieldValidator>--%>
                    </div>
                </div>

                <%--<div class="row" style="margin-left: 1%; margin-bottom: 20px;" id="CheckDeclaration" runat="server" visible="true">
                    <asp:CheckBox ID="Check" runat="server" TabIndex="24" />&nbsp;
                        
                            <text>
                              This is to certify that the electrical installation is complete in all respects and the work has been carried out
conforming to the CEA (Measures relating to Safety & Electric Supply) Regulation, 2023 and relevant standards. The
Site tests done are found to be in order and it is electrically safe to operate the apparatus free from any danger. 
                            </text>
                </div>--%>
                                <%--<div class="row" id="CheckDeclaration" runat="server" visible="false" style="margin-left: 1%; margin-bottom: 20px;">
    <label style="display: flex; align-items: center;">
        <asp:CheckBox ID="Check" runat="server" TabIndex="24" style=" margin-top: -5px;"/>
        <span style="margin-left: 8px;font-size:13px; line-height: 20px; margin-top: 9px;padding-right: 1%;">
                               This is to certify that the electrical installation is complete in all respects and the work has been carried out
conforming to the CEA (Measures relating to Safety & Electric Supply) Regulation, 2023 and relevant standards. The
Site tests done are found to be in order and it is electrically safe to operate the apparatus free from any danger.        </span>
    </label>
</div>--%>

                                                                        <div class="row" id="CheckDeclaration" runat="server" Visible="false" style="margin-left: 1%; margin-bottom: 20px;">
    <label style="display: flex; align-items: center;">
        <asp:CheckBox ID="Check" runat="server" TabIndex="24" style=" margin-top: -5px;"/>
        <span style="margin-left: 8px;font-size:13px; line-height: 20px; margin-top: 9px;padding-right: 1%;">
                               This is to certify that the electrical installation is complete in all respects and the work has been carried out
conforming to the CEA (Measures relating to Safety & Electric Supply) Regulation, 2023 and relevant standards. The
Site tests done are found to be in order and it is electrically safe to operate the apparatus free from any danger.        </span>
    </label>
</div>

                <div class="row">
                    <div class="col-md-4">
                    </div>
                    <div class="col-md-4" style="text-align: center;">
                        <%--<asp:Button ID="BtnBack" runat="server" Text="Back" Visible="true" class="btn btn-primary mr-2" OnClick="BtnBack_Click" />--%>
                        <asp:Button ID="BtnBack" runat="server" Text="Back" Visible="false" class="btn btn-primary mr-2" OnClick="BtnBack_Click" />
                        <asp:Button ID="btnVerify" Text="Generate OTP For Contractor"  runat="server" class="btn btn-primary mr-2" ValidationGroup="Submit" OnClick="btnVerify_Click" />
                      <asp:Button ID="btnResend" Text="Resend OTP" Visible="false" runat="server" class="btn btn-primary mr-2" ValidationGroup="Submit" OnClick="btnResend_Click"  />

                        <asp:Button ID="btnSubmit" Text="Submit" Visible="false" runat="server" OnClientClick="focusInvalidField();" class="btn btn-primary mr-2" ValidationGroup="Submit" OnClick="btnSubmit_Click" />

                    </div>
                    <div class="col-md-4">
                        <asp:HiddenField ID="hdn" Value="0" runat="server" />
                    </div>
                </div>

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
    <script src="/Assets/js/Chart.roundedBarCharts.js">

    </script>
     <script type="text/javascript">
         // Function to show the OTP section and focus on the OTP TextBox
         function showAndFocusOTP() {
             // Show the OTP row
             document.getElementById('<%= OTP.ClientID %>').style.display = "flex";

         // Focus on the OTP TextBox
         document.getElementById('<%= txtOTP.ClientID %>').focus();
  }

  // Function to focus on the GridView
  function focusOnGridView() {
      // Focus on the GridView container
      const gridContainer = document.getElementById('<%= Grd_Document.ClientID %>');

             if (gridContainer) {
                 // Scroll to the GridView if it's not in the viewport
                 gridContainer.scrollIntoView({ behavior: 'smooth', block: 'center' });

                 // Focus on the GridView container
                 gridContainer.focus();
             }
         }
     </script>
     <script>
         document.addEventListener("DOMContentLoaded", function () {
             // Get the current date
             const today = new Date();

             // Calculate the minimum date (20 years before today)
             const minDate = new Date();
             minDate.setFullYear(today.getFullYear() - 20);

             // Format the dates to YYYY-MM-DD
             const formattedToday = today.toISOString().split('T')[0];
             const formattedMinDate = minDate.toISOString().split('T')[0];

             // Helper function to set or reset min and max attributes
             function setDateRange(inputId) {
                 const dateInput = document.getElementById(inputId);
                 if (dateInput) {
                     // Function to apply min and max
                     function applyDateRange() {
                         dateInput.setAttribute("min", formattedMinDate);
                         dateInput.setAttribute("max", formattedToday);
                     }

                     // Apply min and max initially
                     applyDateRange();

                     // Reapply min and max on focus (for subsequent interactions)
                     dateInput.addEventListener("focus", applyDateRange);

                     // Validate the date on input
                     dateInput.addEventListener("input", function () {
                         const selectedDate = new Date(dateInput.value);
                         if (selectedDate > today || selectedDate < minDate) {
                             alert("Please select a date within the last 20 years.");
                             dateInput.value = ""; // Clear invalid input
                         }
                     });
                 }
             }

             // Call the function with the correct input ID
             setDateRange('<%= txtErectionDate.ClientID %>');
     });
     </script>
<%--    <script type="text/javascript">
        function setMaxErectionDate() {
            var today = new Date().toISOString().split('T')[0];
            document.getElementById('<%= txtErectionDate.ClientID %>').setAttribute('max', today);
        }

        // Run on page load
        window.onload = function () {
            setMaxErectionDate();
        };

        // Attach to UpdatePanel partial postback events
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            setMaxErectionDate();
        });
    </script>--%>

    <script>
        function validateFileType(fileInput) {
            var allowedExtensions = /(\.pdf)$/i;
            var errorMessage = fileInput.parentElement.querySelector('.error-message');

            if (!allowedExtensions.exec(fileInput.value)) {
                errorMessage.style.display = "block";
                fileInput.value = ''; // Clear the input
            } else {
                errorMessage.style.display = "none";
            }
        }
    </script>

    <script type="text/javascript">
        function allowNumbersAndSlash(e) {
            var charCode = e.which ? e.which : e.keyCode;
            // Allow numbers (0-9) and the slash (/)
            if ((charCode >= 48 && charCode <= 57) || charCode === 47) {
                return true;
            }
            return false;
        }

        function preventEnterSubmit(e) {
            if (e.key === 'Enter') {
                e.preventDefault();
                return false;
            }
        }
    </script>
    <script type="text/javascript">
        function alertWithRedirect() {
            if (confirm('Test report has been submitted and is under review by the Contractor for final submission')) {
                window.location.href = "/SiteOwnerPages/IntimationData.aspx";
            } else {
            }
        }
    </script>
    <script type="text/javascript">
        function alertWithRedirectdata() {
            /*if (confirm('Test Report Submitted Successfully')) {*/
            alert('Test Report Submitted Successfully');
            window.location.href = "/SiteOwnerPages/LiftIntimations.aspx";
            //} else {
            //}
        }
    </script>
    <script type="text/javascript">
        function focusInvalidField() {
            var validators = document.getElementsByTagName("span");
            for (var i = 0; i < validators.length; i++) {
                if (validators[i].style.display !== "none" && validators[i].className.includes("validator")) {
                    var controlToFocus = document.getElementById(validators[i].controltovalidate);
                    if (controlToFocus) {
                        controlToFocus.focus();
                        break;
                    }
                }
            }
        }
    </script>
    <script type="text/javascript">
        function preventPaste(event) {
            event.preventDefault(); // Block the paste action
            alert("Pasting is not allowed in this field."); // Notify the user
        }
    </script>
    <script type="text/javascript">
        function isvalidphoneno() {
            var Phone1 = document.getElementById("<%=txtAgentPhone.ClientID %>");
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
</asp:Content>
