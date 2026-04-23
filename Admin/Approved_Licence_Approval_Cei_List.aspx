<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin_Master.Master" AutoEventWireup="true" CodeBehind="Approved_Licence_Approval_Cei_List.aspx.cs" Inherits="CEIHaryana.Admin.Approved_Licence_Approval_Cei_List" %>
<%@ Register Src="~/UserCPages/LicenceTabsDashboard.ascx" TagPrefix="uc1" TagName="LicenceTabsDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="shortcut icon" type="image/png" href="/css2/style.min.css" />
    <link rel="stylesheet" href="/css2/style.css" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.13.5/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.5/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://kit.fontawesome.com/57676f1d80.js" crossorigin="anonymous"></script>

    <!-- Example for Font Awesome 4.x -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

    <!-- Or Font Awesome 5+ -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />


    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
        .headercolor {
            background-color: #9292cc;
        }

        .col-4 {
            margin-bottom: 8px;
        }

        .form-control {
            box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
            margin-left: 0px !important;
            height: 25px;
        }

        select.form-control {
            box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
            margin-left: 0px !important;
            height: 25px;
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
            font-size: 1.4rem !important;
        }

        .btn-primary:hover {
            box-shadow: rgba(50, 50, 93, 0.25) 0px 30px 60px -12px inset, rgba(0, 0, 0, 0.3) 0px 18px 36px -18px inset;
        }

        button.btn.btn-primary.mr-2 {
            padding: 10px 25px 10px 25px;
            font-size: 18px;
        }

        h6.card-title.fw-semibold.mb-4 {
            margin-bottom: 10px !important;
        }

        input.form-control.form-control-sm {
            margin-left: 7px !important;
        }

        td {
            text-align: center;
        }

        .sidebar .nav.sub-menu {
            padding: 0.25rem 0 0 2.07rem !important;
        }

        /* input#ContentPlaceHolder1_RadioButtonList2_1 {
            margin-left: 15px;
            margin-right: 5px !important;
        }

        input#ContentPlaceHolder1_RadioButtonList2_0 {
            margin-right: 5px !important;
        }*/
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">

                <uc1:LicenceTabsDashboard runat="server" ID="ucLicenceTabs"
            OnTabSelected="ucLicenceTabs_TabSelected" />
        <div class="card" style="box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px; border-radius: 5px !important">

            <div class="card-body">
                <div class="row ">
                    <div class="col-sm-4 col-md-4">
                        <h6 class="card-title fw-semibold mb-4">
                            <asp:Label ID="lblData" runat="server"></asp:Label>Approved Licence</h6>
                    </div>
                    <div class="col-sm-6 col-md-6"></div>
                </div>
                <div class="card-body" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px; padding: 25px; margin-bottom: 25px; border-radius: 10px; margin-top: 10px;">
                    <div class="row" style="margin-bottom: -25px !important;">
                        <div class="col-4">
                            <div class="form-group row">
                                <label for="search" class="col-sm-3 col-form-label" style="margin-top: -6px;">Search:</label>
                                <div class="col-sm-9" style="margin-left: -35px;">
                                    <asp:TextBox ID="txtSearch" runat="server" PlaceHolder="Auto Search" class="form-control" Font-Size="12px" onkeydown="return SearchOnEnter(event);" onkeyup="Search_Gridview(this)"></asp:TextBox><br />
                                </div>
                            </div>
                        </div>
                        <%--   <div class="col-md-8" style="display: flex; place-content: end; place-items: baseline;">
                            <asp:RadioButtonList ID="RadioButtonList1" AutoPostBack="true" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                <asp:ListItem Text="New Inspection" Value="0" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Periodic Inspection" Value="1"></asp:ListItem>
                            </asp:RadioButtonList>
                             </div>--%>
                    </div>
                    <asp:GridView class="table-responsive table table-striped table-hover" ID="GridView1" runat="server" Width="100%"
                        AutoGenerateColumns="false" OnRowCommand="GridView1_RowCommand" BorderWidth="1px" BorderColor="#dbddff">
                        <Columns>
                            <asp:TemplateField HeaderText="ApplicationId" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblApplicationId" runat="server" Text='<%#Eval("ApplicationId") %>'></asp:Label>
                                    <asp:Label ID="lblgetCategory" runat="server" Text='<%#Eval("Categary") %>'></asp:Label>
                                    <asp:Label ID="lblLicenceType" runat="server" Text='<%#Eval("LicenceType") %>'></asp:Label>

                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="SNo">
                                <HeaderStyle Width="5%" CssClass="headercolor" />
                                <ItemStyle Width="5%" />
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle Width="35%" CssClass="headercolor" />
                                <ItemStyle Width="35%" />
                                <HeaderTemplate>
                                    Application Id     
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument=' <%#Eval("ApplicationId") %> ' CommandName="Select"><%#Eval("ApplicationId") %></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="RegistrationId" HeaderText="Registration Id">
                                <HeaderStyle HorizontalAlign="center" Width="15%" CssClass="headercolor" />
                                <ItemStyle HorizontalAlign="center" Width="15%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Name" HeaderText="Name">
                                <HeaderStyle HorizontalAlign="center" Width="28%" CssClass="headercolor" />
                                <ItemStyle HorizontalAlign="center" Width="28%" CssClass="break-text"/>
                            </asp:BoundField>

                            <asp:BoundField DataField="PermanentDistrict" HeaderText="District">
                                <HeaderStyle HorizontalAlign="center" Width="32%" CssClass="headercolor" />
                                <ItemStyle HorizontalAlign="center" Width="32%" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Categary" HeaderText="Category">
                                <HeaderStyle HorizontalAlign="center" Width="15%" CssClass="headercolor" />
                                <ItemStyle HorizontalAlign="center" Width="15%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="LicenceType" HeaderText="LicenceType">
                                <HeaderStyle HorizontalAlign="center" Width="15%" CssClass="headercolor" />
                                <ItemStyle HorizontalAlign="center" Width="15%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="VoltageLevel" HeaderText="VoltageLevel">
                                <HeaderStyle HorizontalAlign="center" Width="15%" CssClass="headercolor" />
                                <ItemStyle HorizontalAlign="center" Width="15%" />
                            </asp:BoundField>

                            <asp:BoundField DataField="CreatedDate" HeaderText="Request Date">
                                <HeaderStyle HorizontalAlign="center" Width="15%" CssClass="headercolor" />
                                <ItemStyle HorizontalAlign="center" Width="15%" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="ApplicationStatus">
                                <HeaderStyle HorizontalAlign="center" Width="15%" CssClass="headercolor" />
                                <ItemTemplate>
                                    <asp:Label ID="lblApplicationStatus" runat="server" Text='<%#Eval("ApplicationStatus") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Licence Certificate">
                                <HeaderStyle Width="5%" CssClass="headercolor" />
                                <ItemStyle Width="5%" />
                                <ItemTemplate>
                                    <asp:LinkButton
                                        runat="server"
                                        ID="LinkButton1"
                                        Style="padding: 0px 5px 0px 5px; font-size: 18px; border-radius: 3px;"
                                        Text="<i class='fa fa-print' style='color:white !important;'></i>"
                                        CssClass='greenButton btn-primary'
                                        CommandName="Print"
                                        CommandArgument='<%# Container.DataItemIndex %>'
                                        Visible='<%# Eval("ApplicationStatus").ToString() == "Approved" %>' />
                                    <%--Changed by navneet on 26-June-2025 <asp:LinkButton runat="server" ID="lnkBtn" Style="padding: 0px 5px 0px 5px; font-size: 18px; border-radius: 3px;"
                                        Text="<i class='fa fa-print' style='color:white !important;'></i>" CssClass='greenButton btn-primary' CommandName="Print" CommandArgument="<%# Container.DataItemIndex %>" />--%>
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
            </div>
        </div>
    </div>
    <footer class="footer">
    </footer>
    <script>
        new DataTable('#example');
    </script>
    <script type="text/javascript">
        function Search_Gridview(strKey) {
            var strData = strKey.value.toLowerCase().split(" ");
            var tblData = document.getElementById("<%=GridView1.ClientID %>");
            var rowData;
            for (var i = 1; i < tblData.rows.length; i++) {
                rowData = tblData.rows[i].innerHTML;
                var styleDisplay = 'none';
                for (var j = 0; j < strData.length; j++) {
                    if (rowData.toLowerCase().indexOf(strData[j]) >= 0)
                        styleDisplay = '';
                    else {
                        styleDisplay = 'none';
                        break;
                    }
                }
                tblData.rows[i].style.display = styleDisplay;
            }
        }
        function SearchOnEnter(event) {
            if (event.keyCode === 13) {
                event.preventDefault(); // Prevent default form submission
                Search_Gridview(document.getElementById('txtSearch'));
            }
        }
    </script>
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            const elements = document.querySelectorAll('.break-text');

            elements.forEach(function (element) {
                let text = element.innerText;
                let formattedText = '';
                let currentIndex = 0;

                while (currentIndex < text.length) {
                    // Take a chunk of up to 20 characters
                    let chunk = text.slice(currentIndex, currentIndex + 25);

                    if (chunk.length < 25) {
                        // If the chunk is less than 20 characters, add it without breaking
                        formattedText += chunk;
                        break; // Exit the loop as we've processed the remaining text
                    }

                    // For chunks of 20 or more characters, try to break at the last whitespace
                    let breakIndex = chunk.lastIndexOf(" ");
                    if (breakIndex !== -1) {
                        // If there's a whitespace, break at that space
                        formattedText += chunk.slice(0, breakIndex) + '<br>';
                        currentIndex += breakIndex + 1; // Move past the space
                    } else {
                        // Otherwise, break at the 20-character limit
                        formattedText += chunk + '<br>';
                        currentIndex += 25;
                    }
                }

                element.innerHTML = formattedText.trim(); // Remove any trailing <br>
            });
        });
    </script>
</asp:Content>
