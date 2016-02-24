<%@ Page Title="" Language="C#" MasterPageFile="~/Master/FrontEnd.master" AutoEventWireup="true"
    CodeFile="PatientMedicines.aspx.cs" Inherits="PatientMedicines" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" class="tblHeight" align="center">
        <tr>
            <td style="width: 200px" valign="top">
                <table width="100%">
                    <tr>
                        <td class="Heading">
                            Admin Panel
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div id="menu8">
                                <ul>
                                    <% if (!Common.CommonFunction.IsDoctor())
                                       { %>
                                    <li><a href="NewsEvent.aspx" title="News &amp; Events">News & Events</a></li>
                                    <li><a href="Floors.aspx" title="Floors">Floors</a></li>
                                    <li><a href="Bed.aspx" title="Bed">Bed</a></li>
                                    <li><a href="Departments.aspx" title="Departments">Departments</a></li>
                                    <li><a href="Doctors.aspx" title="Doctors">Doctors</a></li>
                                    <li><a href="Employee.aspx" title="Employee">Employee</a></li>
                                    <li><a href="AdminMedicine.aspx" title="Medicine">Medicine</a></li><%} %>
                                    <li><a href="Patients.aspx" title="Patients">Patients</a></li>
                                    <li><a href="PatientMedicines.aspx" class="active" title="Patients medicines">Patients
                                        medicines</a></li>
                                    <% if (!Common.CommonFunction.IsDoctor())
                                       { %>
                                    <li><a href="Operations.aspx" title="Operations">Operations</a></li>
                                    <li><a href="AdminSurgery.aspx" title="Surgery">Surgery</a></li>
                                    <li><a href="Inventory.aspx" title="Inventory">Inventory</a></li>
                                    <li><a href="Reports/InPatients.aspx" title="In Patient Report">In Patient Report</a></li>
                                    <li><a href="Reports/OutPatients.aspx" title="Out Patient Report">Out Patient Report</a></li>
                                    <li><a href="Reports/PatientsByDoctor.aspx" title="Patient Report By Doctor">Patient
                                        Report By Doctor</a></li><%} %>
                                </ul>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
            <td align="left" valign="top" width="100%">
                <asp:Panel ID="pnlListData" runat="server">
                    <table width="100%">
                        <tr>
                            <td align="left" width="75%">
                                <asp:Panel ID="pnlData" runat="server">
                                    <table width="100%" class="PnlBorder">
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="style31" colspan="5">
                                                <asp:Label ID="lblMessage" runat="server" CssClass="HeaderText"></asp:Label>
                                                &nbsp; &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr id="trNewProduct" runat="server" visible="false">
                                            <td class="style27" colspan="2">
                                                <asp:LinkButton ID="lnkNewProduct" runat="server" Font-Names="Verdana" Font-Size="Small"
                                                    Font-Underline="False" OnClick="lnkNewProduct_Click" CausesValidation="false"
                                                    Visible="False">Add New Product</asp:LinkButton>
                                            </td>
                                            <td colspan="2">
                                                &nbsp;
                                            </td>
                                            <td colspan="2">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td colspan="4">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlPatients"
                                                    Display="None" ErrorMessage="Patient" InitialValue=""></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="style30">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-size: small; font-family: Arial">
                                                <strong>Patient: *</strong>&nbsp;
                                            </td>
                                            <td class="style32" colspan="4">
                                                <asp:DropDownList ID="ddlPatients" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPatients_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-size: small; font-family: Arial">
                                                <strong>Medicine: *</strong>&nbsp;
                                            </td>
                                            <td class="style32" colspan="4">
                                                <asp:DropDownList ID="ddlMedicine" runat="server">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlMedicine"
                                                    Display="None" ErrorMessage="Medicine" InitialValue=""></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style31">
                                                <asp:Label ID="lblPath" runat="server" Visible="False"></asp:Label>
                                            </td>
                                            <td class="style32" colspan="4">
                                                <asp:Label ID="lblId" runat="server" Visible="False"></asp:Label>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style31">
                                                &nbsp;
                                            </td>
                                            <td colspan="2">
                                                <asp:Button ID="btnAdd" Text="Add" runat="server" OnClick="btnAdd_Click" Width="76px"
                                                    TabIndex="8" />
                                            </td>
                                            <td colspan="3">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style31">
                                                &nbsp;
                                            </td>
                                            <td class="style32" colspan="4">
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style31">
                                                &nbsp;
                                            </td>
                                            <td class="style32" colspan="4">
                                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                                                    ShowSummary="False" HeaderText="Please provide.." />
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <table class="" width="95%">
                                                    <tr style="height: 40px">
                                                        <td width="110px" align="right" style="padding-right: 10px;">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4" align="center">
                                                            <asp:Label ID="lblRecMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                                                            <asp:Repeater ID="rptMedicine" runat="server" OnItemCommand="rptMedicine_ItemCommand">
                                                                <HeaderTemplate>
                                                                    <table cellpadding="4" cellspacing="0" style="background-color: #EBEFF0; border-top: 1px solid #df5015;
                                                                        border-left: 1px solid #df5015; border-right: 1px solid #df5015; border-bottom: 1px solid #df5015;"
                                                                        width="640px">
                                                                        <tr>
                                                                            <td style="border-right: 1px solid #df5015" width="10%">
                                                                                <b>Sr No</b>
                                                                            </td>
                                                                            <td style="border-right: 1px solid #df5015" width="70%">
                                                                                <b>Patient Name</b>
                                                                            </td>
                                                                            <td style="border-right: 1px solid #df5015" width="70%">
                                                                                <b>Medicine</b>
                                                                            </td>
                                                                            <td style="border-right: 1px solid #df5015" width="70%">
                                                                                <b>Time</b>
                                                                            </td>
                                                                            <td align="center" style="font-size: small; font-weight: bold; font-family: Verdana;">
                                                                                Delete
                                                                            </td>
                                                                        </tr>
                                                                        <%--</table>--%>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td style="font-size: small; font-family: Verdana; background-color: #EBEFF0; border-top: 1px solid #df5015;
                                                                            border-right: 1px solid #df5015" title="<%# Convert.ToString(Eval("inPatientMedicineMappingId")) %>">
                                                                            <%# Convert.ToString(Eval("inPatientMedicineMappingId"))%>
                                                                        </td>
                                                                        <td style="font-size: small; font-family: Verdana; background-color: #EBEFF0; border-top: 1px solid #df5015;
                                                                            border-right: 1px solid #df5015" title="<%# Convert.ToString(Eval("stPatientName")) %>">
                                                                            <%# Convert.ToString(Eval("stPatientName"))%>
                                                                        </td>
                                                                        <td style="font-size: small; font-family: Verdana; background-color: #EBEFF0; border-top: 1px solid #df5015;
                                                                            border-right: 1px solid #df5015" title="<%# Convert.ToString(Eval("stMedicineName")) %>">
                                                                            <%# Convert.ToString(Eval("stMedicineName"))%>
                                                                        </td>
                                                                        <td style="font-size: small; font-family: Verdana; background-color: #EBEFF0; border-top: 1px solid #df5015;
                                                                            border-right: 1px solid #df5015">
                                                                            <%# Convert.ToDateTime(Eval("dtGivenDate")).ToString("dd/MM/yyyy")%>
                                                                        </td>
                                                                        <td align="center" style="background-color: #EBEFF0; border-top: 1px solid #df5015;">
                                                                            <asp:LinkButton ID="lnkbtnStatusDel" runat="server" CausesValidation="false" CommandArgument='<%#Convert.ToString(Eval("inPatientMedicineMappingId")) %>'
                                                                                CommandName="IsDeleted" CssClass="labelHover" Font-Names="Verdana" Font-Size="14px"
                                                                                ForeColor="Blue" OnClientClick="javascript:return window.confirm('Are you sure you want to delete this Medicine ?')"
                                                                                Text="Delete"></asp:LinkButton>
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    </table>
                                                                </FooterTemplate>
                                                            </asp:Repeater>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4">
                                                            <asp:Label ID="lblCount" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="Panel1" runat="server">
            </td>
        </tr>
    </table>
    </asp:Panel> </td> </tr> </table>
</asp:Content>
