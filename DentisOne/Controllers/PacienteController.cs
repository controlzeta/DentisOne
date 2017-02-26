using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DentisOne.Models;
using System.IO;
using System.Web.Script.Serialization;

namespace DentisOne.Controllers
{
    public class PacienteController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult AltasPaciente()
        {
            DentisOne.Models.PacienteModel m = new Models.PacienteModel();
            return View(m.paciente);
        }

        public ActionResult BuscadorPacientes()
        {
            DentisOne.Models.PacienteModel m = new Models.PacienteModel();
            return View(m);
        }

        public ActionResult InsertaPaciente(PacienteModel.Paciente p)
        {
            //string pic = System.IO.Path.GetFileName(p.uploadImage);

            PacienteModel m = new PacienteModel();
            bool exito = m.InsertaPaciente(p);
            return Json(exito);
        }

        public ActionResult FileUpload(HttpPostedFileBase file)
        {
            if (file != null)
            {
                string pic = System.IO.Path.GetFileName(file.FileName);
                string path = System.IO.Path.Combine(
                                       Server.MapPath("~/Pacientes"), pic);
                // file is uploaded
                file.SaveAs(path);

                // save the image path path to the database or you can send image 
                // directly to database
                // in-case if you want to store byte[] ie. for DB
                using (MemoryStream ms = new MemoryStream())
                {
                    file.InputStream.CopyTo(ms);
                    byte[] array = ms.GetBuffer();
                }

            }
            // after successfully uploading redirect the user
            return RedirectToAction("actionname", "controller name");
        }

    }
}
