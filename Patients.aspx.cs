using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class Patients : System.Web.UI.Page
{
    HMSDataContext moHMSDataContext = null;
    string msCategoryImage = string.Empty;
    string msImagepath = String.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {


        msImagepath = Server.MapPath(ConfigurationSettings.AppSettings["PatientImagePath"]);
        Common.CommonFunction.setEnterEvent(txtFirstName, btnSave);
        Common.CommonFunction.setEnterEvent(txtLastName, btnSave);

        Page.Title = "Patients > Admin > Krishna Hospitals";

        if (Session["UserID"] == null)
            Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
        else
        {
            if (!IsPostBack)
            {
                ViewState["PatientId"] = null;
                mvProduct.ActiveViewIndex = 1;
                BindData();
                fillDoctors();
                fillDepartments();
                fillFloors();
                rdINStatus.Checked = true;
                trView.Visible = false;
            }
        }
    }


    private void fillDoctors()
    {
        moHMSDataContext = new HMSDataContext();
        var loDoctors = from c in moHMSDataContext.tblDoctors
                        join d in moHMSDataContext.tblDepartments on c.inDepartmentId equals d.inDepartmentId
                        select new { c.stFirstName, c.stLastName, c.inPhoneNumber, c.inDoctorId, d.stDepartmentName };

        if (Convert.ToInt32(Session["DoctorId"]) > 0)
            loDoctors = loDoctors.Where(c => c.inDoctorId == Convert.ToInt32(Session["DoctorId"]));

        if (loDoctors.Count() > 0)
        {
            ddlDoctor.DataSource = loDoctors;
            ddlDoctor.DataTextField = "stFirstName";
            ddlDoctor.DataValueField = "inDoctorId";
            ddlDoctor.DataBind();


            ddlFilterDoctors.DataSource = loDoctors;
            ddlFilterDoctors.DataTextField = "stFirstName";
            ddlFilterDoctors.DataValueField = "inDoctorId";
            ddlFilterDoctors.DataBind();
        }
        else
        {
            ddlDoctor.DataSource = null;
            ddlDoctor.DataBind();
        }
        ddlDepartment.Items.Insert(0, new ListItem("Select Doctor", ""));
        ddlFilterDoctors.Items.Insert(0, new ListItem("Select Doctor", ""));
    }


    private void fillDepartments()
    {
        moHMSDataContext = new HMSDataContext();
        List<tblDepartment> loResult = moHMSDataContext.tblDepartments.Where(c => c.inDepartmentId > 0).ToList();

        if (loResult.Count > 0)
        {
            ddlDepartment.DataSource = loResult;
            ddlDepartment.DataTextField = "stDepartmentName";
            ddlDepartment.DataValueField = "inDepartmentId";
            ddlDepartment.DataBind();

        }
        else
        {
            ddlDepartment.DataSource = null;
            ddlDepartment.DataBind();
        }
        ddlDepartment.Items.Insert(0, new ListItem("Select Department", ""));

    }


    private void fillBeds(int fiFloor, int fiPatientId)
    {
        ddlBed.Items.Clear();
        moHMSDataContext = new HMSDataContext();

        List<getActiveBedResult> logetActiveBedResult;
        logetActiveBedResult = moHMSDataContext.getActiveBed(fiPatientId).ToList();


        if (fiFloor > 0)
            logetActiveBedResult = logetActiveBedResult.Where(c => c.inFloorId == fiFloor).ToList();

        if (logetActiveBedResult.Count > 0)
        {
            ddlBed.DataSource = logetActiveBedResult;
            ddlBed.DataTextField = "stBedName";
            ddlBed.DataValueField = "inBedId";
            ddlBed.DataBind();
        }
        else
        {
            ddlBed.DataSource = null;
            ddlBed.DataBind();
        }
        ddlBed.Items.Insert(0, new ListItem("Select Bed", ""));

    }

    private void fillFloors()
    {
        moHMSDataContext = new HMSDataContext();
        List<tblFloor> loNewsEventBind = moHMSDataContext.tblFloors.Where(c => c.inFloorId > 0).ToList();


        if (loNewsEventBind.Count > 0)
        {
            ddlFloor.DataSource = loNewsEventBind;
            ddlFloor.DataTextField = "stFloorName";
            ddlFloor.DataValueField = "inFloorId";
            ddlFloor.DataBind();
            ddlFloor.Items.Insert(0, new ListItem("Select Floor", ""));

            ddlFilterFloors.DataSource = loNewsEventBind;
            ddlFilterFloors.DataTextField = "stFloorName";
            ddlFilterFloors.DataValueField = "inFloorId";
            ddlFilterFloors.DataBind();
            ddlFilterFloors.Items.Insert(0, new ListItem("Select Floor", ""));
        }

    }


    protected void rptPatients_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Header && e.CommandName == "Sort")
        {
            if (Convert.ToString(ViewState["Sort"]).EndsWith(" asc"))
            {
                ViewState["Sort"] = e.CommandArgument.ToString() + " desc";
            }
            else
            {
                ViewState["Sort"] = e.CommandArgument.ToString() + " asc";
            }
            BindData();
        }
        else if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            if (e.CommandName == "IsEdit")
            {

                int inlProdId = Convert.ToInt32(e.CommandArgument);
                lblId.Text = Convert.ToString(inlProdId);
                ViewState["PatientId"] = Convert.ToString(inlProdId);
                moHMSDataContext = new HMSDataContext();

                tblPatient loSelect = moHMSDataContext.tblPatients.Where(c => c.inPatientId == inlProdId).First();
                if (loSelect != null)
                {
                    txtFirstName.Text = loSelect.stFirstName;
                    txtLastName.Text = loSelect.stLastName;
                    txtAddress.Text = loSelect.stAddress;

                    if (loSelect.stStatus == "Single")
                        rdSingle.Checked = true;
                    else
                        rdMarried.Checked = true;

                    if (loSelect.stGender == "Male")
                        rdMale.Checked = true;
                    else
                        rdFemale.Checked = true;

                    if (loSelect.flgIsIn == true)
                        rdINStatus.Checked = true;
                    else
                        rdOutStatus.Checked = true;

                    txtAge.Text = Convert.ToString(loSelect.inAge);
                    txtPhone.Text = Convert.ToString(loSelect.inPhone);
                    txtSymtoms.Text = loSelect.stSymtoms;
                    txtWeight.Text = Convert.ToString(loSelect.inWeight);
                    ddlFloor.SelectedValue = Convert.ToString(loSelect.inFloorId);
                    ddlDepartment.SelectedValue = Convert.ToString(loSelect.inDepartmentId);
                    ddlDoctor.SelectedValue = Convert.ToString(loSelect.inDoctorId);

                    fillBeds(Convert.ToInt32(loSelect.inFloorId), inlProdId);
                    ddlBed.SelectedValue = Convert.ToString(loSelect.inBedId);

                    lblPath.Text = loSelect.stImage;
                    if (lblPath.Text != string.Empty)
                    {
                        trView.Visible = true;
                    }
                    else
                    {
                        trView.Visible = false;
                    }
                    tdView.HRef = ConfigurationSettings.AppSettings["PatientImagePath"] + loSelect.stImage;

                    mvProduct.ActiveViewIndex = 0;
                    btnSave.Visible = false;
                    btnEdit.Visible = true;
                    lblMessage.Text = "Update Patient";

                }
                txtFirstName.Focus();
            }
            if (e.CommandName == "IsDeleted")
            {
                int inlProdId = Convert.ToInt32(e.CommandArgument);
                lblId.Text = Convert.ToString(inlProdId);
                moHMSDataContext = new HMSDataContext();

                tblPatient loDelete = moHMSDataContext.tblPatients.Where(c => c.inPatientId == inlProdId).FirstOrDefault();
                moHMSDataContext.tblPatients.DeleteOnSubmit(loDelete);
                moHMSDataContext.SubmitChanges();
                Common.CommonFunction.showMsg("Patient deleted successfully.", this.Page);
                BindData();
                ClearControl();
            }
        }
    }

    protected void imgbtnLast_Click(object sender, EventArgs e)
    {
        ViewState["PageNum"] = Math.Ceiling((Convert.ToDecimal(ViewState["RecordCount"]) / Convert.ToDecimal(ViewState["PageSize"])));
        BindData();
    }

    protected void imgbtnNext_Click(object sender, EventArgs e)
    {
        ViewState["PageNum"] = Convert.ToInt32(ViewState["PageNum"]) + 1;
        BindData();
    }

    protected void imgbtnPrevious_Click(object sender, EventArgs e)
    {
        ViewState["PageNum"] = Convert.ToInt32(ViewState["PageNum"]) - 1;
        BindData();
    }

    protected void imgbtnFirst_Click(object sender, EventArgs e)
    {
        ViewState["PageNum"] = 1;
        BindData();
    }

    protected void rptPatients_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        LinkButton imgbtnFirst;
        LinkButton imgbtnLast;
        LinkButton imgbtnPrevious;
        LinkButton imgbtnNext;
        if (e.Item.ItemType == ListItemType.Footer)
        {
            imgbtnFirst = (LinkButton)e.Item.FindControl("imgbtnFirst");
            imgbtnLast = (LinkButton)e.Item.FindControl("imgbtnLast");
            imgbtnPrevious = (LinkButton)e.Item.FindControl("imgbtnPrevious");
            imgbtnNext = (LinkButton)e.Item.FindControl("imgbtnNext");
            if (Convert.ToInt32(ViewState["PageNum"]) == 1)
            {
                imgbtnFirst.Enabled = false;
                imgbtnPrevious.Enabled = false;
            }
            if (Convert.ToInt32(ViewState["PageNum"]) == Math.Ceiling(Convert.ToDecimal(ViewState["RecordCount"]) / Convert.ToDecimal(ViewState["PageSize"])))
            {
                imgbtnLast.Enabled = false;
                imgbtnNext.Enabled = false;
            }
        }
    }

    protected void imgbtnGo_Click(object sender, EventArgs e)
    {
        ViewState["PageNum"] = "1";
        BindData();
    }

    protected void drpRecords_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindData();
    }

    protected void drpStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindData();
    }


    private void ClearControl()
    {
        txtFirstName.Text = String.Empty;
        txtLastName.Text = String.Empty;
        txtAddress.Text = string.Empty;
        txtAge.Text = String.Empty;
        txtPhone.Text = String.Empty;
        txtSymtoms.Text = String.Empty;
        txtWeight.Text = String.Empty;
    }


    private void BindData()
    {
        moHMSDataContext = new HMSDataContext();


        if (string.IsNullOrEmpty(Convert.ToString(ViewState["Sort"])))
        {
            ViewState["Sort"] = "inPatientId desc";
        }
        if (string.IsNullOrEmpty(Convert.ToString(ViewState["PageNum"])))
        {
            ViewState["PageNum"] = 1;
        }
        int liEmployeeId = 0;
        int liDoctorId = 0;
        int liFloorId = 0;
        int liInout = 0;

        int.TryParse(ddlFilterDoctors.SelectedValue, out liDoctorId);
        int.TryParse(ddlFilterEmployee.SelectedValue, out liEmployeeId);
        int.TryParse(ddlFilterFloors.SelectedValue, out liFloorId);

        if (ddlInOut.SelectedIndex != 0)
        {
            if (ddlInOut.SelectedItem.Value == "1")
                liInout = 1;
            else
                liInout = 2;
        }

        ViewState["PageSize"] = drpRecords.SelectedValue;
        List<sp_getPatientsResult> loResult = moHMSDataContext.sp_getPatients(Convert.ToInt32(ViewState["PageNum"]), Convert.ToInt32(ViewState["PageSize"]), Convert.ToString(ViewState["Sort"]), Convert.ToString(txtSearch.Text.Replace("'", "''").Trim()), liEmployeeId, liDoctorId, liFloorId, liInout).ToList();

        if (Convert.ToInt32(Session["DoctorId"]) > 0)
            loResult = loResult.Where(c => c.inDoctorId == Convert.ToInt32(Session["DoctorId"])).ToList();

        if (loResult.Count > 0)
        {
            rptPatients.DataSource = loResult;
            rptPatients.DataBind();

            rptPatients.Visible = true;
            lblRecMessage.Text = "";
        }
        else
        {
            rptPatients.DataSource = null;
            rptPatients.DataBind();
            rptPatients.Visible = false;
            lblRecMessage.Text = "No record(s) found.";
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            moHMSDataContext = new HMSDataContext();

            if (editImgCode())
            {

                tblPatient loSelect = new tblPatient();
                loSelect.stFirstName = txtFirstName.Text;
                loSelect.stLastName = txtLastName.Text;
                loSelect.stAddress = txtAddress.Text;
                if (rdSingle.Checked)
                    loSelect.stStatus = "Single";
                else
                    loSelect.stStatus = "Married";

                if (rdMale.Checked)
                    loSelect.stGender = "Male";
                else
                    loSelect.stGender = "Female";

                if (rdINStatus.Checked)
                    loSelect.flgIsIn = true;
                else
                    loSelect.flgIsIn = false;

                loSelect.inEmployeeId = Convert.ToInt32(Session["ID"]);
                loSelect.inAge = Convert.ToByte(txtAge.Text);
                loSelect.inPhone = Convert.ToInt64(txtPhone.Text);
                loSelect.stSymtoms = txtSymtoms.Text;
                loSelect.inWeight = Convert.ToByte(txtWeight.Text);
                loSelect.inBedId = Convert.ToInt32(ddlBed.SelectedValue);
                loSelect.inFloorId = Convert.ToInt32(ddlFloor.SelectedValue);
                loSelect.inDepartmentId = Convert.ToInt32(ddlDepartment.SelectedValue);
                loSelect.inDoctorId = Convert.ToInt32(ddlDoctor.SelectedValue);
                loSelect.dtAdmissionDate = DateTime.Now;
                loSelect.stImage = lblPath.Text;


                moHMSDataContext.tblPatients.InsertOnSubmit(loSelect);
                moHMSDataContext.SubmitChanges();
                ClearControl();
                BindData();
                mvProduct.ActiveViewIndex = 1;
                Common.CommonFunction.showMsg("Patient saved successfully.", this.Page);
            }

        }


    }

    private Boolean editImgCode()
    {
        try
        {
            if (!string.IsNullOrEmpty(fuCategoryImg.FileName))
            {
                HttpPostedFile file1 = (HttpPostedFile)(fuCategoryImg.PostedFile);
                if ((file1 != null) && (file1.ContentLength > 0))
                {
                    if (isImage(file1) == false)
                    {
                        Common.CommonFunction.showMsg("Please Upload Only .jpg,.gif,.png File.", this);
                        return false;
                    }
                }

            }

            String lsPatientImage = String.Empty;


            if (fuCategoryImg.HasFile)
            {
                lsPatientImage = Common.CommonFunction.makeFilePathForAjax(fuCategoryImg.FileName);

            }
            else
            {
                if (lblPath.Text != null)
                {
                    lsPatientImage = lblPath.Text;

                }
                else
                {
                    lsPatientImage = string.Empty;

                }
                lblPath.Text = lsPatientImage;
            }

            //lsCatImageLogo = lsCatImageLogo + txtCategorycode.Text;
            Common.CommonFunction.createDirectory(msImagepath);

            if (!string.IsNullOrEmpty(fuCategoryImg.FileName))
            {
                fuCategoryImg.SaveAs(msImagepath + @"\" + lsPatientImage);
                lblPath.Text = lsPatientImage;
                string path = msImagepath + lsPatientImage;

            }
            return true;
        }
        catch (Exception)
        {
            throw;
        }
    }
    private bool isImage(HttpPostedFile file)
    {
        return ((file != null) && System.Text.RegularExpressions.Regex.IsMatch(file.ContentType, "image/\\S+") && (file.ContentLength > 0));
    }

    protected void btnImgDelete_Click(object sender, EventArgs e)//fuProImage,fuProImage
    {
        moHMSDataContext = new HMSDataContext();
        tblPatient loSelect = moHMSDataContext.tblPatients.Where(c => c.inPatientId == Convert.ToInt32(lblId.Text)).FirstOrDefault();
        loSelect.stImage = string.Empty;
        moHMSDataContext.SubmitChanges();
        trView.Visible = false;
        lblPath.Text = string.Empty;
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (editImgCode())
            {
                moHMSDataContext = new HMSDataContext();
                tblPatient loSelect = moHMSDataContext.tblPatients.Where(c => c.inPatientId == Convert.ToInt32(lblId.Text)).FirstOrDefault();
                loSelect.stFirstName = txtFirstName.Text;
                loSelect.stLastName = txtLastName.Text;
                if (rdSingle.Checked)
                    loSelect.stStatus = "Single";
                else
                    loSelect.stStatus = "Married";

                if (rdMale.Checked)
                    loSelect.stGender = "Male";
                else
                    loSelect.stGender = "Female";

                if (rdINStatus.Checked)
                    loSelect.flgIsIn = true;
                else
                    loSelect.flgIsIn = false;

                loSelect.stAddress = txtAddress.Text;
                loSelect.inAge = Convert.ToByte(txtAge.Text);
                loSelect.inPhone = Convert.ToInt64(txtPhone.Text);
                loSelect.stSymtoms = txtSymtoms.Text;
                loSelect.inWeight = Convert.ToByte(txtWeight.Text);
                loSelect.inBedId = Convert.ToInt32(ddlBed.SelectedValue);
                loSelect.inFloorId = Convert.ToInt32(ddlFloor.SelectedValue);
                loSelect.inDepartmentId = Convert.ToInt32(ddlDepartment.SelectedValue);
                loSelect.inDoctorId = Convert.ToInt32(ddlDoctor.SelectedValue);
                loSelect.stImage = lblPath.Text;

                if (rdOutStatus.Checked)
                    loSelect.dtOutDate = DateTime.Now;

                moHMSDataContext.SubmitChanges();
                ClearControl();
                BindData();
                mvProduct.ActiveViewIndex = 1;
                Common.CommonFunction.showMsg("Patient details updated successfully.", this.Page);
            }
        }
    }


    protected void ImageButton1_Click(object sender, EventArgs e)
    {
        mvProduct.ActiveViewIndex = 1;
    }
    protected void lnkNewProduct_Click(object sender, EventArgs e)
    {

    }
    protected void lnkAdd_Click(object sender, EventArgs e)
    {

    }

    protected void lnkNewAdd_Click(object sender, EventArgs e)
    {

        ClearControl();
        //rdOutStatus.Visible = false;
        mvProduct.ActiveViewIndex = 0;
        btnSave.Visible = true;
        btnEdit.Visible = false;
        txtFirstName.Focus();
        lblMessage.Text = "Add Patient";

    }



    protected void ddlFloor_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlFloor.SelectedValue != "")
        {
            if (ViewState["PatientId"] != null)
                fillBeds(Convert.ToInt32(ddlFloor.SelectedValue), Convert.ToInt32(ViewState["PatientId"]));
            else
                fillBeds(Convert.ToInt32(ddlFloor.SelectedValue), 0);
        }
        else
        {
            if (ViewState["PatientId"] != null)
                fillBeds(0, Convert.ToInt32(ViewState["PatientId"]));
            else
                fillBeds(0, 0);
        }

    }
    protected void ddlFilterFloors_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindData();
    }


    protected void ddlFilterDoctors_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindData();
    }
    protected void ddlInOut_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindData();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindData();
    }
}