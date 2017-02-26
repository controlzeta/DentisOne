using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using DentisOne.Utilidades;
using System.Web.Script.Serialization;

namespace DentisOne.Models
{
    public class PacienteModel
    {
        public Paciente paciente = new Paciente();
        public List<Paciente> lstPacientes = new List<Paciente>();
        public string listaPacientes;
        public PacienteModel()
        {
            using (DentisOneDBEntities db = new DentisOneDBEntities())
            {
                var patients = (from pt in db.Patients
                                  select pt
                             ).ToList();

                lstPacientes = getPatients(patients);
                listaPacientes = new JavaScriptSerializer().Serialize(lstPacientes);
            }
        }

        public List<Paciente> getPatients(List<Patient> patients)
        {
            List<Paciente> lst = new List<Paciente>();
            foreach (var p in patients)
            {
                Paciente _paciente = new Paciente();
                _paciente.Name = p.Name;
                _paciente.LastName = p.LastName;
                _paciente.PhoneNumber = p.PhoneNumber;
                _paciente.Mobile = p.Mobile;
                _paciente.Birthday = (DateTime)p.Birthday;
                _paciente.Age = p.Age != null ? (int)p.Age : 0;
                _paciente.Email = p.Email;
                _paciente.id = p.idPatient;
                lst.Add(_paciente);
            }
            return lst;
        }
        public bool InsertaPaciente( Paciente p)
        {
            try 
	        {	        
		        Patient paciente = new Patient();
                Utils utils = new Utils();
                using(DentisOneDBEntities db = new DentisOneDBEntities())
                {
                    paciente.Name = p.Name;
                    paciente.LastName = p.LastName;
                    paciente.PhoneNumber = p.PhoneNumber;
                    paciente.Mobile = p.Mobile;
                    paciente.Email = p.Email;
                    paciente.Birthday = p.Birthday;
                    paciente.UserRegistration = DateTime.Now;
                    db.Patients.Add(paciente);
                    db.SaveChanges();
                    if (paciente.idPatient != 0)
                    {
                        string path = HttpContext.Current.Server.MapPath("~/Pacientes");
                        //string exeFile = (new System.Uri(Assembly.GetEntryAssembly().CodeBase)).AbsolutePath;
                        //string exeDir = Path.GetDirectoryName(exeFile);
                        //string fullPath = Path.Combine(exeDir + "\\Pacientes\\");
                        string pacientePath = path + "\\Paciente-" + utils.transformID(paciente.idPatient);
                        if (!System.IO.Directory.Exists(pacientePath))
                        {
                            System.IO.Directory.CreateDirectory(pacientePath);
                        }
                    }
                }
	        }
	        catch (Exception ex)
	        {
		        return false;
	        }
           
            return true;
        }
        public class Paciente
        {
            public int id { get; set; }
            public string Name { get; set; }
            public string LastName { get; set; }
            public int Age { get; set; }
            public string PhoneNumber { get; set; }
            public string Mobile { get; set; }
            public string Email { get; set; }
            public string Folder { get; set; }
            public int idPreferredContactForm { get; set; }
            public string PreferredContactForm { get; set; }
            public int idClinicalStory { get; set; }
            public DateTime Birthday { get; set; }
            public DateTime UserRegistration { get; set; }
            public string uploadImage { get; set; }
            public string Avatar { get; set; }

            public Paciente()
            {
                Birthday = DateTime.Now.Date;
            }
        }
    }
}