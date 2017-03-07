using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DentisOne.Models;
namespace DentisOne.Controllers
{
    public class AgendaController : Controller
    {
        //
        // GET: /Agenda/

        public ActionResult Index()
        {
            AgendaModel m = new AgendaModel();
            m.calendario = new AgendaModel.Calendario();
            return View(m);
        }

    }
}
