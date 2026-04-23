<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin_Master.Master" AutoEventWireup="true" CodeBehind="SLDHistory.aspx.cs" Inherits="CEIHaryana.Admin.SLDHistory" %>
<%@ Register Src="~/UserCPages/SldReturnDetails.ascx" TagPrefix="uc1" TagName="InspectionReturnDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="shortcut icon" type="image/png" href="/css2/style.min.css" />
    <link rel="stylesheet" href="/css2/style.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.13.5/css/dataTables.bootstrap4.min.css" rel="stylesheet" />


    <%--    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>--%>
    <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.5/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://kit.fontawesome.com/57676f1d80.js" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style type="text/css">
        th {
            background: #9292cc;
        }

        .pagination-ys {
            /*display: inline-block;*/
            padding-left: 0;
            margin: 20px 0;
            border-radius: 4px;
        }

            .pagination-ys table > tbody > tr > td {
                display: contents;
            }

                .pagination-ys table > tbody > tr > td > a,
                .pagination-ys table > tbody > tr > td > span {
                    position: relative;
                    float: left;
                    padding: 8px 12px;
                    line-height: 1.42857143;
                    text-decoration: none;
                    color: #dd4814;
                    background-color: #ffffff;
                    border: 1px solid #dddddd;
                    margin-left: -1px;
                }

                .pagination-ys table > tbody > tr > td > span {
                    position: relative;
                    float: left;
                    padding: 8px 12px;
                    line-height: 1.42857143;
                    text-decoration: none;
                    margin-left: -1px;
                    z-index: 2;
                    color: #aea79f;
                    background-color: #f5f5f5;
                    border-color: #dddddd;
                    cursor: default;
                }

                .pagination-ys table > tbody > tr > td:first-child > a,
                .pagination-ys table > tbody > tr > td:first-child > span {
                    margin-left: 0;
                    border-bottom-left-radius: 4px;
                    border-top-left-radius: 4px;
                }

                .pagination-ys table > tbody > tr > td:last-child > a,
                .pagination-ys table > tbody > tr > td:last-child > span {
                    border-bottom-right-radius: 4px;
                    border-top-right-radius: 4px;
                }

                .pagination-ys table > tbody > tr > td > a:hover,
                .pagination-ys table > tbody > tr > td > span:hover,
                .pagination-ys table > tbody > tr > td > a:focus,
                .pagination-ys table > tbody > tr > td > span:focus {
                    color: #97310e;
                    background-color: #eeeeee;
                    border-color: #dddddd;
                }

        .headercolor {
            background-color: #9292cc;
        }

        .ReturnedRowColor {
            background-color: #f9c7c7 !important;
        }


        .dashboard-card {
            border-radius: 10px;
            padding: 20px;
            height: 90px;
            color: #fff;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding-right: 31px;
        }

        .dashboard-icon {
            font-size: 28px;
        }

        .dashboard-text {
            text-align: right;
        }

            .dashboard-text h3 {
                margin: 0;
                font-size: 26px;
                font-weight: 700;
                font-size: 30px !important;
                font-weight: bold;
            }

            .dashboard-text p {
                margin: 0;
                font-weight: 600;
                margin-top: 12px;
                font-size: 13px !important;
                color: white !important;
            }

        .content-wrapper {
            padding: 42px 20px;
        }

        a:link, a:visited, a:active {
            color: inherit !important;
            text-decoration: none !important;
        }

        h3 {
            color: white !important;
        }

        svg {
            margin-right: 10px;
            color: white !important;
        }

        a#ContentPlaceHolder1_LinkButton5:hover {
            box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px !important;
            border-radius: 10px !important;
        }

        a#ContentPlaceHolder1_LinkButton2:hover {
            box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px !important;
            border-radius: 10px !important;
        }

        a#ContentPlaceHolder1_LinkButton3:hover {
            box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px !important;
            border-radius: 10px !important;
        }

        a#ContentPlaceHolder1_LinkButton4:hover {
            box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px !important;
            border-radius: 10px !important;
        }



        #ownerPopup {
            display: none;
            position: fixed;
            top: 30%;
            left: 60%;
            transform: translate(-50%, -30%);
            background-color: white;
            border: 1px solid #ccc;
            padding: 20px;
            z-index: 1001;
            box-shadow: 0 0 10px #999;
            width: 75%;
        }

        #popupOverlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.4);
            z-index: 1000;
        }

        .modal-content {
            width: 1000px !important;
            right: 110px !important;
        }

        span#ContentPlaceHolder1_lblOwnerName {
            font-size: 13px !important;
        }

        span#ContentPlaceHolder1_lblAgencyName {
            font-size: 13px !important;
        }

        .modal-backdrop {
            position: fixed !important;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            z-index: 1040;
        }

        .fade {
            width: 101% !important;
            height: 100% !important;
        }

        th.headercolor {
            text-align: justify;
        }

        td {
            text-align: justify;
        }

        a:link, a:visited, a:active {
            color: #007bff !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">

        <!-- Your provided card wrapper -->
        <!-- Your provided card wrapper -->
        <div class="card" style="background: #f9f9f9; margin-bottom: 10px; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; padding: 10px 24px 10px 25px; border-radius: 10px;">

            <div class="row g-3">

                <!-- Card 1 -->
                <div class="col-sm-6 col-lg-3">
                    <asp:LinkButton runat="server" ID="LinkButton5"
                        CommandName="All" CommandArgument="Submitted,Approved,InProcess,Returned,Rejected" OnCommand="DashboardCard_Command"
                        Style="text-decoration: none; display: block;">
                        <div class="dashboard-card" style="background-color: #6c4ebf; cursor: pointer;">
                            <!-- File Plus Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="white"
                                class="bi bi-file-earmark-plus" viewBox="0 0 16 16">
                                <path d="M8 6.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V11a.5.5 0 0 1-1 0V9.5H6a.5.5 0 0 1 0-1h1.5V7a.5.5 0 0 1 .5-.5" />
                                <path d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5z" />
                            </svg>

                            <div class="dashboard-text">
                                <h3 style="font-size: 30px !important; font-weight: bold; color: white !important;">
                                    <asp:Literal ID="litRequestAllCount" runat="server" />
                                </h3>
                                <p style="font-size: 13px !important; color: white !important;">
                                    All Requests Received
                                </p>
                            </div>
                        </div>
                    </asp:LinkButton>
                </div>


                <!-- Card 2 -->
                <div class="col-sm-6 col-lg-3">
                    <asp:LinkButton runat="server" ID="LinkButton2"
                        CommandName="All" CommandArgument="Approved,Returned,Rejected" OnCommand="DashboardCard_Command"
                        Style="text-decoration: none; display: block;">
                        <div class="dashboard-card" style="background-color: #64c395; color: black;">
                            <!-- SVG Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg"
                                width="32" height="32"
                                viewBox="0 0 16 16"
                                fill="currentColor"
                                style="width: 32px !important; height: 32px !important;"
                                class="bi bi-file-earmark-check">
                                <path d="M10.854 7.854a.5.5 0 0 0-.708-.708L7.5 9.793 6.354 8.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0z" />
                                <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2M9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5z" />
                            </svg>

                            <div class="dashboard-text">
                                <h3>
                                    <asp:Literal ID="lit_App_Rej_Ret" runat="server" /></h3>
                                <p style="font-size: 13px;">Approved/Rejected/Returned</p>
                            </div>
                        </div>
                    </asp:LinkButton>

                </div>

                <!-- Card 3 -->
                <div class="col-sm-6 col-lg-3">
                    <asp:LinkButton runat="server" ID="LinkButton3"
                        CommandName="All" CommandArgument="InProcess" OnCommand="DashboardCard_Command"
                        Style="text-decoration: none; display: block;">
                        <div class="dashboard-card" style="background-color: #f3399e;">
                            <!-- Journal Code Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-journal-medical" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v.634l.549-.317a.5.5 0 1 1 .5.866L9 6l.549.317a.5.5 0 1 1-.5.866L8.5 6.866V7.5a.5.5 0 0 1-1 0v-.634l-.549.317a.5.5 0 1 1-.5-.866L7 6l-.549-.317a.5.5 0 0 1 .5-.866l.549.317V4.5A.5.5 0 0 1 8 4M5 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5" />
                                <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2" />
                                <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1z" />
                            </svg>
                            <div class="dashboard-text">
                                <h3>
                                    <asp:Literal ID="LitInprocess" runat="server" /></h3>
                                <p style="font-size: 13px;">In Process</p>
                            </div>
                        </div>
                    </asp:LinkButton>
                </div>

                <!-- Card 4 -->
                <div class="col-sm-6 col-lg-3">
                    <asp:LinkButton runat="server" ID="LinkButton4"
                        CommandName="All" CommandArgument="Submitted" OnCommand="DashboardCard_Command"
                        Style="text-decoration: none; display: block;">
                        <div class="dashboard-card" style="background-color: #fd8160;">
                            <!-- Folder Symlink Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-folder-symlink-fill" viewBox="0 0 16 16">
                                <path d="M13.81 3H9.828a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 6.172 1H2.5a2 2 0 0 0-2 2l.04.87a2 2 0 0 0-.342 1.311l.637 7A2 2 0 0 0 2.826 14h10.348a2 2 0 0 0 1.991-1.819l.637-7A2 2 0 0 0 13.81 3M2.19 3q-.362.002-.683.12L1.5 2.98a1 1 0 0 1 1-.98h3.672a1 1 0 0 1 .707.293L7.586 3zm9.608 5.271-3.182 1.97c-.27.166-.616-.036-.616-.372V9.1s-2.571-.3-4 2.4c.571-4.8 3.143-4.8 4-4.8v-.769c0-.336.346-.538.616-.371l3.182 1.969c.27.166.27.576 0 .742" />
                            </svg>
                            <div class="dashboard-text">
                                <h3>
                                    <asp:Literal ID="LitNew" runat="server" /></h3>
                                <p style="font-size: 13px;">New Application</p>
                            </div>
                        </div>
                    </asp:LinkButton>
                </div>

            </div>


        </div>


        <div class="card" style="box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px; border-radius: 5px !important">
            <div class="card-body">
                <div class="row ">
                    <div class="col-sm-4 col-md-4">
                        <h6 class="card-title fw-semibold mb-4">
                            <asp:Label ID="lblData" runat="server"></asp:Label>SINGLE LINE DOCUMENT HISTORY</h6>
                    </div>
                    <div class="col-sm-6 col-md-6"></div>
                </div>
                <div class="card-body" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px; padding: 25px; margin-bottom: 25px; border-radius: 10px;">
                    <%-- <div class="row" style="margin-bottom: -30px;">
                        <div class="col-4">
                            <div class="form-group row">
                                <label for="search" class="col-sm-3 col-form-label" style="margin-top: -6px;">Search:</label>
                                <div class="col-sm-9" style="margin-left: -35px;">
                                    <asp:TextBox ID="txtSearch" runat="server" PlaceHolder="Auto Search" class="form-control" onkeydown="return SearchOnEnter(event);" Style="margin-top: 4px;" Font-Size="12px" onkeyup="Search_Gridview(this)"></asp:TextBox><br />
                                </div>
                            </div>
                        </div>
                    </div>--%>
                    <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btnSearch">
                        <div class="row" style="margin-bottom: -30px;">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="search" class="col-md-2 col-form-label" style="margin-top: 3px; padding: 0px;">
                                        Search:</label>
                                    <div class="col-md-6" style="margin-left: -35px;">
                                        <asp:TextBox ID="txtSearch" runat="server" PlaceHolder="Auto Search" class="form-control" Font-Size="12px"></asp:TextBox><br />
                                    </div>
                                    <div class="col-md-2">
                                        <asp:Button ID="btnSearch" runat="server" class="btn btn-primary" OnClick="btnSearch_Click" Text="Search" Style="padding-top: 1px; padding-bottom: 1px;" />
                                    </div>
                                    <div class="col-md-2">
                                        <asp:Button ID="btnReset" runat="server" class="btn btn-primary" Text="Reset" OnClick="btnReset_Click" Style="padding-top: 1px; padding-bottom: 1px; padding-left: 17px; padding-right: 17px;" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>

                    <asp:GridView class="table-responsive table table-hover table-striped" ID="GridView1" runat="server" Width="100%"
                        AutoGenerateColumns="false" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" AllowPaging="true" PageSize="100" OnPageIndexChanging="GridView1_PageIndexChanging" BorderWidth="1px" BorderColor="#dbddff">
                        <PagerStyle CssClass="pagination-ys" />
                        <Columns>
                            <asp:TemplateField HeaderText="SNo">
                                <HeaderStyle Width="5%" CssClass="headercolor" />
                                <ItemStyle Width="5%" />
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="SLD_ID" HeaderText="SLD Id">
                                <HeaderStyle HorizontalAlign="center" Width="15%" CssClass="headercolor" />
                                <ItemStyle HorizontalAlign="center" Width="15%" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="OwnerName" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="4%">
                                <HeaderStyle Width="5%" CssClass="headercolor" />
                                <ItemTemplate>
                                    <asp:LinkButton
                                        ID="lnkOwnerName"
                                        runat="server"
                                        Text='<%# Eval("OwnerName") %>'
                                        CommandName="ShowPopup"
                                        CommandArgument='<%# Eval("SLD_ID") %>'
                                        OnCommand="lnkOwnerName_Command"
                                        CssClass="owner-link" />

                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="2%"></ItemStyle>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:TemplateField>


                            <asp:BoundField DataField="SiteOwnerAddress" HeaderText="Address">
                                <HeaderStyle HorizontalAlign="center" Width="15%" CssClass="headercolor" />
                                <ItemStyle HorizontalAlign="Left" Width="15%" CssClass="break-text-10" />
                            </asp:BoundField>
                            <%--                            <asp:BoundField DataField="Status_type" HeaderText="Status">
                                <HeaderStyle HorizontalAlign="center" Width="15%" CssClass="headercolor" />
                                <ItemStyle HorizontalAlign="center" Width="15%" />
                            </asp:BoundField>--%>
                            <asp:TemplateField HeaderText="Application Status">
                                <HeaderStyle HorizontalAlign="Left" CssClass="headercolor" />
                                <ItemStyle HorizontalAlign="Left" />
                                <ItemTemplate>
                                    <asp:Label ID="lblActionTaken" runat="server" Text='<%# Eval("Status_type") %>' Visible="false" />
                                    <asp:Label ID="lblInspectionId" runat="server" Text='<%# Eval("SLD_ID") %>' Visible="false" />

                                    <!-- If ActionTaken is RETURN, show LinkButton -->
                                    <asp:LinkButton
                                        ID="lnkReturn"
                                        runat="server"
                                        Text="Return"
                                        CommandName="ShowReturnPopup"
                                        CommandArgument='<%# Eval("SLD_ID") %>'
                                        OnCommand="lnkReturn_Command"
                                        CssClass="text-danger"
                                        Visible='<%# Eval("Status_type").ToString() == "Returned" %>' />

                                    <!-- Otherwise, show normal text -->
                                    <asp:Label
                                        ID="lblNormalStatus"
                                        runat="server"
                                        Text='<%# Eval("Status_type") %>'
                                        Visible='<%# Eval("Status_type").ToString() != "Returned" %>' />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="PendingAt" HeaderText="PendingAt">
                                <HeaderStyle HorizontalAlign="center" Width="15%" CssClass="headercolor" />
                                <ItemStyle HorizontalAlign="center" Width="15%" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText=" Attached Document" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="4%">
                                <HeaderStyle Width="5%" CssClass="headercolor" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Bind("Path") %>' CommandName="Select1">View document </asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="2%"></ItemStyle>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText=" SLD Approved" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="4%">
                                <HeaderStyle Width="5%" CssClass="headercolor" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="LnkDocumemtPath" runat="server" CommandArgument='<%# Bind("SLDApproved") %>' CommandName="Select">View document </asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="2%"></ItemStyle>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Request Letter" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="4%">
                                <HeaderStyle Width="5%" CssClass="headercolor" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="Lnkbtn" runat="server" CommandArgument='<%# Bind("RequestLetter") %>' CommandName="Print">View document </asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="2%"></ItemStyle>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Electrical Layout Plan" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="4%">
                                <HeaderStyle Width="5%" CssClass="headercolor" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="LnkbtnLaout" runat="server" CommandArgument='<%# Bind("LayoutRepositoryAttachment") %>' CommandName="Print">view document </asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="2%"></ItemStyle>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:TemplateField>

                            <asp:BoundField DataField="SubmittedDate" HeaderText="Submit Date">
                                <HeaderStyle HorizontalAlign="center" Width="15%" CssClass="headercolor" />
                                <ItemStyle HorizontalAlign="center" Width="15%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="AcceptedOrReturnDate" HeaderText="Accepted/Returned Date">
                                <HeaderStyle HorizontalAlign="center" Width="15%" CssClass="headercolor" />
                                <ItemStyle HorizontalAlign="center" Width="15%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Rejection" HeaderText="ReturnOrRejection Reason">
                                <HeaderStyle HorizontalAlign="center" Width="15%" CssClass="headercolor" />
                                <ItemStyle HorizontalAlign="center" Width="15%" CssClass="break-text-10" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ApprovedOrRejectedDate" HeaderText="Approved/Rejected Date">
                                <HeaderStyle HorizontalAlign="center" Width="15%" CssClass="headercolor" />
                                <ItemStyle HorizontalAlign="center" Width="15%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Remarks" HeaderText="Remarks">
                                <HeaderStyle HorizontalAlign="center" Width="15%" CssClass="headercolor" />
                                <ItemStyle HorizontalAlign="center" Width="15%" />
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
                    <uc1:InspectionReturnDetails runat="server" id="InspectionReturnDetails" /> 
                    <div class="modal fade" id="ownerModal" tabindex="-1" role="dialog" aria-labelledby="ownerModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="ownerModalLabel">Owner Details</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body" id="modalContent">
                                    <!-- Dynamic content will go here -->
                                    <div class="row">

                                        <div class="col-md-6">
                                            <div id="OwnerNameDiv" runat="server">
                                                <asp:Label ID="lblOwnerName" runat="server" Text="Name of Owner"></asp:Label>

                                                <asp:TextBox CssClass="form-control" ID="txtNameOfOwner" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px" />
                                            </div>
                                            <div id="AgencyNameDiv" runat="server">
                                                <asp:Label ID="lblAgencyName" runat="server" Text="Name of Agency"></asp:Label>
                                                <asp:TextBox CssClass="form-control" ID="txtNameOfAgency" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <label>
                                                PanNo
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtPanNoOrTanNo" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        </div>

                                        <div class="col-md-12">
                                            <label>
                                                Address
                                      
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtAddress" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>

                                        </div>


                                        <div class="col-md-6">
                                            <label>
                                                ContactNo
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtContactNo" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        </div>

                                        <div class="col-md-6">
                                            <label>
                                                Email
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtEmail" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        </div>

                                        <div class="col-md-6">
                                            <label>
                                                Applicant Type
                                      
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtApplicant" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>


                                        </div>
                                        <div class="col-md-6">
                                            <label>
                                                ContractorType
                                            </label>
                                            <asp:TextBox class="form-control" ID="txtContractorType" ReadOnly="true" autocomplete="off" runat="server" Style="margin-left: 18px"></asp:TextBox>
                                        </div>


                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
    <script src="/Assets/js/Chart.roundedBarCharts.js"></script>


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
            const elements = document.querySelectorAll('.break-text-10');

            elements.forEach(function (element) {
                let text = element.innerText;
                let formattedText = '';
                let currentIndex = 0;

                while (currentIndex < text.length) {
                    // Take a chunk of up to 20 characters
                    let chunk = text.slice(currentIndex, currentIndex + 30);

                    if (chunk.length < 30) {
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
                        currentIndex += 30;
                    }
                }

                element.innerHTML = formattedText.trim(); // Remove any trailing <br>
            });
        });

        function showPopup(content) {
            var popup = document.getElementById("ownerPopup");
            var popupContent = document.getElementById("popupContent");
            popupContent.innerHTML = content;
            popup.style.display = "block";
        }

        function closePopup() {
            document.getElementById("ownerPopup").style.display = "none";
        }
    </script>

</asp:Content>
