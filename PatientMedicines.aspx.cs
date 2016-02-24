using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PatientMedicines : System.Web.UI.Page
{
    HMSDataContext mNewsEventContext = null;
    string msCategoryImage = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {

        Page.Title = "Patient Medicine > Admin > Krishna Hospitals";

        if (Session["UserID"] == null)
            Response.Redirect("~/Login.aspx?ReturnUrl=" + Request.RawUrl);
        else
        {
            if (!IsPostBack)
            {
                //mvProduct.ActiveViewIndex = 1;
                bindPatientMedicine(0);
                fillPatients();
                fillMedicine();
            }
        }
    }
    private void fillPatients()
    {
        mNewsEventContext = new HMSDataContext();
        List<sp_fillPatientsResult> loNewsEventBind = mNewsEventContext.sp_fillPatients().ToList();

        if (Convert.ToInt32(Session["DoctorId"]) > 0)
            loNewsEventBind = loNewsEventBind.Where(c => c.inDoctorId == Convert.ToInt32(Session["DoctorId"])).ToList();

        if (loNewsEventBind.Count > 0)
        {
            ddlPatients.DataSource = loNewsEventBind;
            ddlPatients.DataTextField = "stPatientName";
            ddlPatients.DataValueField = "inPatientId";
            ddlPatients.DataBind();
        }
        else
        {
            ddlPatients.DataSource = null;
            ddlPatients.DataBind();
        }
        ddlPatients.Items.Insert(0, new ListItem("Select Patient", ""));

    }


    private void fillMedicine()
    {
        mNewsEventContext = new HMSDataContext();
        List<tblMedicine> loNewsEventBind = mNewsEventContext.tblMedicines.Where(c => c.inMedicineId > 0).ToList();


        if (loNewsEventBind.Count > 0)
        {
            ddlMedicine.DataSource = loNewsEventBind;
            ddlMedicine.DataTextField = "stMedicineName";
            ddlMedicine.DataValueField = "inMedicineId";
            ddlMedicine.DataBind();
        }
        else
        {
            ddlMedicine.DataSource = null;
            ddlPatients.DataBind();
        }
        ddlMedicine.Items.Insert(0, new ListItem("Select Medicine", ""));

    }

    private void bindPatientMedicine(int fiPatientId)
    {
        mNewsEventContext = new HMSDataContext();
        List<sp_GetMedicinebyPatientIdResult> loNewsEventBind = mNewsEventContext.sp_GetMedicinebyPatientId(fiPatientId).ToList();

        if (Convert.ToInt32(Session["DoctorId"]) > 0)
            loNewsEventBind = loNewsEventBind.Where(c => c.inDoctorId == Convert.ToInt32(Session["DoctorId"])).ToList();

        if (loNewsEventBind.Count > 0)
        {
            rptMedicine.DataSource = loNewsEventBind;
            rptMedicine.DataBind();
            lblRecMessage.Text = string.Empty;
        }
        else
        {
            lblRecMessage.Text = "No record(s) found.";
            rptMedicine.DataSource = null;
            rptMedicine.DataBind();
        }


    }



    private void ClearControl()
    {

    }



    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            mNewsEventContext = new HMSDataContext();
            tblPatientMedicineMapping loMedicine = new tblPatientMedicineMapping();
            loMedicine.inPatientId = Convert.ToInt32(ddlPatients.SelectedValue);
            loMedicine.inMedicineId = Convert.ToInt32(ddlMedicine.SelectedValue);
            loMedicine.dtGivenDate = DateTime.Now;
            mNewsEventContext.tblPatientMedicineMappings.InsertOnSubmit(loMedicine);
            mNewsEventContext.SubmitChanges();
            ClearControl();
            bindPatientMedicine(Convert.ToInt32(ddlPatients.SelectedValue));
            //mvProduct.ActiveViewIndex = 1;
            Common.CommonFunction.showMsg("Medicine has been added to the patient.", this.Page);

        }


    }




    protected void ImageButton1_Click(object sender, EventArgs e)
    {
        //mvProduct.ActiveViewIndex = 1;
    }
    protected void lnkNewProduct_Click(object sender, EventArgs e)
    {

    }
    protected void lnkAdd_Click(object sender, EventArgs e)
    {

    }




    protected void rptMedicine_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

        if (e.CommandName == "IsDeleted")
        {
            int inlProdId = Convert.ToInt32(e.CommandArgument);
            lblId.Text = Convert.ToString(inlProdId);
            mNewsEventContext = new HMSDataContext();

            tblPatientMedicineMapping loDelete = mNewsEventContext.tblPatientMedicineMappings.Where(c => c.inPatientMedicineMappingId == inlProdId).FirstOrDefault();
            mNewsEventContext.tblPatientMedicineMappings.DeleteOnSubmit(loDelete);
            mNewsEventContext.SubmitChanges();
            Common.CommonFunction.showMsg("Patient medicine has been deleted successfully.", this.Page);
            bindPatientMedicine(Convert.ToInt32(ddlPatients.SelectedValue));
        }

    }

    protected void txtTitle_TextChanged(object sender, EventArgs e)
    {

    }
    protected void imgSerch_Click(object sender, ImageClickEventArgs e)
    {
    }
    protected void ddlPatients_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlPatients.SelectedValue != "")
            bindPatientMedicine(Convert.ToInt32(ddlPatients.SelectedValue));
    }
}