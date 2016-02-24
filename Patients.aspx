<%@ Page Title="" Language="C#" MasterPageFile="~/Master/FrontEnd.master" AutoEventWireup="true"
    CodeFile="Patients.aspx.cs" Inherits="Patients" %>

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
                                    <li><a href="Patients.aspx" class="active" title="Patients">Patients</a></li>
                                    <li><a href="PatientMedicines.aspx" title="Patients medicines">Patients medicines</a></li><% if (!Common.CommonFunction.IsDoctor())
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
                                <asp:MultiView ID="mvProduct" runat="server">
                                    <asp:View ID="viewData" runat="server">
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
                                                    </td>
                                                    <td class="style30">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; font-family: Arial">
                                                        <strong>First name: *</strong>&nbsp;
                                                    </td>
                                                    <td class="style32" colspan="4">
                                                        <asp:TextBox ID="txtFirstName" MaxLength="10" runat="server" Width="220px" TabIndex="1"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName"
                                                            Display="None" ErrorMessage="First Name"></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; font-family: Arial">
                                                        <strong>Last Name: *</strong>&nbsp;
                                                    </td>
                                                    <td class="style32" colspan="4">
                                                        <asp:TextBox ID="txtLastName" MaxLength="10" runat="server" Width="220px" TabIndex="1"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName"
                                                            Display="None" ErrorMessage="Last Name"></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; font-family: Arial">
                                                        <strong>Gender: *</strong>&nbsp;
                                                    </td>
                                                    <td class="style32" colspan="4">
                                                        <div style="float: left;">
                                                            <asp:RadioButton ID="rdMale" runat="server" GroupName="Gender" Text="Male" />
                                                        </div>
                                                        <div style="float: left; margin-left: 10px;">
                                                            <asp:RadioButton ID="rdFemale" runat="server" GroupName="Gender" Text="Female" />
                                                        </div>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; font-family: Arial">
                                                        <strong>Status: *</strong>&nbsp;
                                                    </td>
                                                    <td class="style32" colspan="4">
                                                        <div style="float: left;">
                                                            <asp:RadioButton ID="rdSingle" runat="server" GroupName="Status" Text="Single" />
                                                        </div>
                                                        <div style="float: left; margin-left: 10px;">
                                                            <asp:RadioButton ID="rdMarried" runat="server" GroupName="Status" Text="Married" />
                                                        </div>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; font-family: Arial">
                                                        <strong>Age: *</strong>&nbsp;
                                                    </td>
                                                    <td class="style32" colspan="4">
                                                        <asp:TextBox ID="txtAge" MaxLength="10" runat="server" Width="220px" TabIndex="1"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; font-family: Arial">
                                                        <strong>Weight: *</strong>&nbsp;
                                                    </td>
                                                    <td class="style32" colspan="4">
                                                        <asp:TextBox ID="txtWeight" MaxLength="10" runat="server" Width="220px" TabIndex="1"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; font-family: Arial">
                                                        <strong>Phone: *</strong>&nbsp;
                                                    </td>
                                                    <td class="style32" colspan="4">
                                                        <asp:TextBox ID="txtPhone" MaxLength="10" runat="server" Width="220px" TabIndex="1"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPhone"
                                                            Display="None" ErrorMessage="Phone"></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; font-family: Arial">
                                                        <strong>Address: *</strong>&nbsp;
                                                    </td>
                                                    <td class="style32" colspan="4">
                                                        <asp:TextBox ID="txtAddress" MaxLength="10" runat="server" Width="220px" TabIndex="1"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAddress"
                                                            Display="None" ErrorMessage="Address"></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; font-family: Arial">
                                                        <strong>Symtoms: *</strong>&nbsp;
                                                    </td>
                                                    <td class="style32" colspan="4">
                                                        <asp:TextBox ID="txtSymtoms" MaxLength="10" runat="server" Width="220px" TabIndex="1"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; font-family: Arial">
                                                        <strong>Doctor: *</strong>&nbsp;
                                                    </td>
                                                    <td class="style32" colspan="4">
                                                        <asp:DropDownList ID="ddlDoctor" runat="server">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlDoctor"
                                                            Display="None" ErrorMessage="Doctor" InitialValue=""></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; font-family: Arial">
                                                        <strong>Department: *</strong>&nbsp;
                                                    </td>
                                                    <td class="style32" colspan="4">
                                                        <asp:DropDownList ID="ddlDepartment" runat="server">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlDepartment"
                                                            Display="None" ErrorMessage="Department" InitialValue=""></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; font-family: Arial">
                                                        <strong>Floor: *</strong>&nbsp;
                                                    </td>
                                                    <td class="style32" colspan="4">
                                                        <asp:DropDownList ID="ddlFloor" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFloor_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlFloor"
                                                            Display="None" ErrorMessage="Floor" InitialValue=""></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; font-family: Arial">
                                                        <strong>Bed: *</strong>&nbsp;
                                                    </td>
                                                    <td class="style32" colspan="4">
                                                        <asp:DropDownList ID="ddlBed" runat="server">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlBed"
                                                            Display="None" ErrorMessage="Bed" InitialValue=""></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; font-family: Arial">
                                                        <strong>Photo: *</strong>&nbsp;
                                                    </td>
                                                    <td class="style32" colspan="4">
                                                        <asp:FileUpload ID="fuCategoryImg" runat="server" Width="220px" />
                                                    </td>
                                                    <td>
                                                        <table>
                                                            <tr id="trView" runat="server">
                                                                <td align="left">
                                                                    <a id="tdView" runat="server" class="ImageEvent" href="#" target="_blank">View</a>&nbsp;|&nbsp;<a
                                                                        id="tdDeleteImg" runat="server" class="ImageEvent" href="#" onclick="javascript:return window.confirm('Are you sure you want to delete this Image?')"
                                                                        onserverclick="btnImgDelete_Click">Delete</a>
                                                                </td>
                                                                <td align="left">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: small; font-family: Arial">
                                                        <strong>Patient Status: *</strong>&nbsp;
                                                    </td>
                                                    <td class="style32" colspan="4">
                                                        <div style="float: left;">
                                                            <asp:RadioButton ID="rdINStatus" runat="server" GroupName="PatientStatus" Text="IN" />
                                                        </div>
                                                        <div style="float: left; margin-left: 10px;">
                                                            <asp:RadioButton ID="rdOutStatus" runat="server" GroupName="PatientStatus" Text="Out" />
                                                        </div>
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
                                                        <asp:Button ID="btnSave" Text="Save" runat="server" OnClick="btnSave_Click" Width="76px"
                                                            TabIndex="8" />
                                                        <asp:Button ID="btnEdit" runat="server" Text="Update" OnClick="btnEdit_Click" TabIndex="9" />
                                                        &nbsp;
                                                        <asp:Button ID="ImageButton1" runat="server" Text="Cancel" CausesValidation="False"
                                                            OnClick="ImageButton1_Click" TabIndex="10" />
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
                                            </table>
                                        </asp:Panel>
                                    </asp:View>
                                    <asp:View ID="viewItem" runat="server">
                                        <asp:Panel ID="Panel1" runat="server">
                                            <table class="PnlBorder" width="95%">
                                                <tr style="height: 40px">
                                                    <td width="110px" align="right" style="padding-right: 10px;">
                                                        <asp:LinkButton ID="lnkNewAdd" runat="server" CssClass="add-btn" OnClick="lnkNewAdd_Click">Add New Patient</asp:LinkButton>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div style="float: left;">
                                                            Search:</div>
                                                        <div style="float: left; margin-right: 10px; margin-left: 10px">
                                                            <asp:TextBox ID="txtSearch" runat="server" TabIndex="2"></asp:TextBox></div>
                                                        <div style="float: left; margin-right: 10px; margin-left: 10px">
                                                            <asp:Button ID="btnSearch" Text="Search" runat="server" OnClick="btnSearch_Click" />
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr style="height: 40px">
                                                    <td width="110px" align="right" style="padding-right: 10px;">
                                                        <div style="float: left; margin-right: 10px; margin-left: 10px">
                                                            <asp:DropDownList ID="drpRecords" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpRecords_SelectedIndexChanged"
                                                                TabIndex="2">
                                                                <asp:ListItem Value="10">10 records</asp:ListItem>
                                                                <asp:ListItem Value="50">50 records</asp:ListItem>
                                                                <asp:ListItem Value="100">100 records</asp:ListItem>
                                                                <asp:ListItem Value="150">150 records</asp:ListItem>
                                                                <asp:ListItem Value="200">200 records</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                        <asp:DropDownList Style="display: none;" ID="ddlFilterEmployee" runat="server">
                                                        </asp:DropDownList>
                                                        <asp:DropDownList ID="ddlFilterDoctors" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlFilterDoctors_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:DropDownList ID="ddlFilterFloors" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFilterFloors_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:DropDownList ID="ddlInOut" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlInOut_SelectedIndexChanged">
                                                            <asp:ListItem Text="In Patients" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="Out Patients" Value="0"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4" align="center">
                                                        <asp:Label ID="lblRecMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                                                        <asp:Repeater ID="rptPatients" runat="server" OnItemCommand="rptPatients_ItemCommand"
                                                            OnItemDataBound="rptPatients_ItemDataBound">
                                                            <HeaderTemplate>
                                                                <table cellpadding="4" cellspacing="0" style="background-color: #EBEFF0; border-top: 1px solid #df5015;
                                                                    border-left: 1px solid #df5015; border-right: 1px solid #df5015; border-bottom: 1px solid #df5015;"
                                                                    width="640px">
                                                                    <tr>
                                                                        <td style="border-right: 1px solid #df5015" width="10%">
                                                                            <b>Sr No</b>
                                                                        </td>
                                                                        <td style="border-right: 1px solid #df5015" width="25%">
                                                                            <b>Patient Name</b>
                                                                        </td>
                                                                        <td style="border-right: 1px solid #df5015" width="20%">
                                                                            <b>Department</b>
                                                                        </td>
                                                                        <td style="border-right: 1px solid #df5015" width="25%">
                                                                            <b>Doctor</b>
                                                                        </td>
                                                                        <td style="border-right: 1px solid #df5015" width="10%">
                                                                            <b>Patient Status</b>
                                                                        </td>
                                                                        <td align="center" style="font-size: small; font-weight: bold; font-family: Verdana;">
                                                                            Action
                                                                        </td>
                                                                    </tr>
                                                                    <%--</table>--%>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td style="font-size: small; font-family: Verdana; background-color: #EBEFF0; border-top: 1px solid #df5015;
                                                                        border-right: 1px solid #df5015">
                                                                        <%# Convert.ToString(Eval("inPatientId"))%>
                                                                    </td>
                                                                    <td style="font-size: small; font-family: Verdana; background-color: #EBEFF0; border-top: 1px solid #df5015;
                                                                        border-right: 1px solid #df5015">
                                                                        <%# Convert.ToString(Eval("stPatientName"))%>
                                                                    </td>
                                                                    <td style="font-size: small; font-family: Verdana; background-color: #EBEFF0; border-top: 1px solid #df5015;
                                                                        border-right: 1px solid #df5015">
                                                                        <%# Convert.ToString(Eval("stDepartmentName"))%>
                                                                    </td>
                                                                    <td style="font-size: small; font-family: Verdana; background-color: #EBEFF0; border-top: 1px solid #df5015;
                                                                        border-right: 1px solid #df5015">
                                                                        <%# Convert.ToString(Eval("DoctorName"))%>
                                                                    </td>
                                                                    <td style="font-size: small; font-family: Verdana; background-color: #EBEFF0; border-top: 1px solid #df5015;
                                                                        border-right: 1px solid #df5015">
                                                                        <%# Convert.ToBoolean(Eval("flgIsIn")) == true ? "IN" : "OUT"%>
                                                                    </td>
                                                                    <td align="center" style="background-color: #EBEFF0; border-top: 1px solid #df5015;">
                                                                        <asp:LinkButton ID="lnkbtnStatus" runat="server" CausesValidation="false" CommandArgument='<%#Convert.ToString(Eval("inPatientId")) %>'
                                                                            CommandName="IsEdit" CssClass="labelHover" Font-Names="Verdana" Font-Size="14px"
                                                                            ForeColor="Blue" Text="Edit"></asp:LinkButton>
                                                                        <% if (!Common.CommonFunction.IsDoctor())
                                                                           { %>
                                                                        <asp:LinkButton ID="lnkbtnStatusDel" runat="server" CausesValidation="false" CommandArgument='<%#Convert.ToString(Eval("inPatientId")) %>'
                                                                            CommandName="IsDeleted" CssClass="labelHover" Font-Names="Verdana" Font-Size="14px"
                                                                            ForeColor="Blue" OnClientClick="javascript:return window.confirm('Are you sure you want to delete this Patient ?')"
                                                                            Text="Delete"></asp:LinkButton>
                                                                        <%} %>
                                                                        <asp:Label Visible="false" ID="Count" runat="server" Text='<%# ViewState["RecordCount"] = Convert.ToInt32(Eval("inRecordCount")) %>'></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <tr class="last">
                                                                    <td colspan="7" style="background-color: #EBEFF0; border-top: 1px solid #df5015;">
                                                                        <div style="float: right; width: 300px;">
                                                                            <div style="float: right; padding-top: 2px;">
                                                                                <asp:LinkButton CausesValidation="false" runat="server" ID="imgbtnLast" ToolTip="Last"
                                                                                    OnClick="imgbtnLast_Click">
                                                                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/last.gif" />
                                                                                </asp:LinkButton>
                                                                            </div>
                                                                            <div style="float: right; padding-top: 2px;">
                                                                                <asp:LinkButton CausesValidation="false" runat="server" ID="imgbtnNext" ToolTip="Next"
                                                                                    OnClick="imgbtnNext_Click">
                                                                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/next.gif" />
                                                                                </asp:LinkButton>
                                                                            </div>
                                                                            <div style="float: right; padding-top: 2px;">
                                                                                <span class="Normal">Page
                                                                                    <%# ViewState["PageNum"] %>
                                                                                    of
                                                                                    <%# (Math.Ceiling((Convert.ToDecimal(ViewState["RecordCount"]) / Convert.ToDecimal(ViewState["PageSize"]))))%>
                                                                                    (<%# Convert.ToString(ViewState["RecordCount"])%>&nbsp;Total Records)</span></div>
                                                                            <div style="float: right; padding-top: 2px;">
                                                                                <asp:LinkButton CausesValidation="false" runat="server" ID="imgbtnPrevious" ToolTip="Previous"
                                                                                    OnClick="imgbtnPrevious_Click">
                                                                                    <asp:Image ID="Image3" runat="server" ImageUrl="~/images/prev.gif" />
                                                                                </asp:LinkButton>
                                                                            </div>
                                                                            <div style="float: right; padding-top: 2px;">
                                                                                <asp:LinkButton CausesValidation="false" runat="server" ID="imgbtnFirst" ToolTip="First"
                                                                                    OnClick="imgbtnFirst_Click">
                                                                                    <asp:Image ID="Image4" runat="server" ImageUrl="~/images/first.gif" />
                                                                                </asp:LinkButton>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
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
                                    </asp:View>
                                </asp:MultiView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
