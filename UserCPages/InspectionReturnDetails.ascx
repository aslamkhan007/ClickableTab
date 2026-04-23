<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InspectionReturnDetails.ascx.cs" Inherits="CEIHaryana.UserCPages.InspectionReturnDetails" %>
<style>
    .modal-dialog.modal-xl {
        width: 100%;
        max-width: 75%;
    }

    .fade.show {
        height: 100%;
        width: 100%;
    }

    th.header-class.reasontype {
        width: 1%;
    }

    th.header-class.component {
        width: 1%;
    }

    div#modalContent {
        padding-top: 0px;
    }

    .modal-dialog.modal-xl {
        left: 9%;
    }
    th {
    background: #9292cc !important;
}
</style>

<div class="modal fade" id="ownerModal" tabindex="-1" role="dialog" aria-labelledby="ownerModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <!-- Made modal wider -->
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="ownerModalLabel">All Return Reasons History</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="modalContent">
                <!-- Dynamic content will go here -->
                <!-- 🔽 GridView Section: Return History -->
                <div class="row mt-4">
                    <div class="col-md-12">
                        <%--                         <h5>All Return History Reasons</h5>--%>
                        <asp:GridView ID="gvReturnHistory" runat="server" CssClass="table table-bordered table-striped"
                            AutoGenerateColumns="false" EmptyDataText="No return history available.">
                            <Columns>
                                <asp:TemplateField HeaderText="ReasonType">
                                    <HeaderStyle HorizontalAlign="Center" CssClass="header-class reasontype" />
                                    <ItemStyle HorizontalAlign="Left" CssClass="item-class" />
                                    <ItemTemplate>
                                        <%# Eval("ReasonTypeValue") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Component">
                                    <HeaderStyle HorizontalAlign="Center" CssClass="header-class component" />
                                    <ItemStyle HorizontalAlign="Left" CssClass="item-class" />
                                    <ItemTemplate>
                                        <%# Eval("Component") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Reason for Return">
                                    <HeaderStyle HorizontalAlign="Center" CssClass="header-class reason" />
                                    <ItemStyle HorizontalAlign="Left" CssClass="item-class break-text-10" />
                                    <ItemTemplate>
                                        <%# Eval("ReasonForReturn") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <!-- End GridView Section -->

            </div>
        </div>
    </div>
</div>
<script>
    window.onpageshow = function (event) {
        if (event.persisted || performance.navigation.type === 2) {
            const modal = document.getElementById('ownerModal');
            if (modal) {
                modal.style.visibility = 'hidden';
                modal.style.display = 'none';
                modal.classList.remove('show');
                modal.setAttribute('aria-hidden', 'true');
            }
            document.body.classList.remove('modal-open');
            document.body.style.paddingRight = '';
            const backdrop = document.querySelector('.modal-backdrop');
            if (backdrop) backdrop.remove();
        }
    };
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
                let chunk = text.slice(currentIndex, currentIndex + 80);

                if (chunk.length < 80) {
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
                    currentIndex += 80;
                }
            }

            element.innerHTML = formattedText.trim(); // Remove any trailing <br>
        });
    });
</script>
