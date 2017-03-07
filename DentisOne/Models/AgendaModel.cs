using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DentisOne.Models
{
    public class AgendaModel
    {
        public Calendario calendario;
        public class Calendario
        {
            public DateTime Hoy { get; set; }
            public List<DateTime> MesActual { get; set; }
            public Mes mesAnterior { get; set; }
            public Mes mes { get; set; }
            public Mes mesSiguiente { get; set; }
            public Calendario()
            {
                Hoy = DateTime.Today;
                mesAnterior = new Mes();
                mesSiguiente = new Mes();
                mes = new Mes();
                MesActual = new List<DateTime>();
                DateTime Inicio = Hoy.AddDays(-15);
                DateTime Termino = Hoy.AddDays(-15);
                for (int i = 0; i <= 30; i++)
                {
                    DateTime nuevoDia = Inicio.AddDays(i);
                    MesActual.Add(nuevoDia);
                }
                mes.Nombre = getMonth(Hoy.Month);
                mesSiguiente.Nombre = getMonth(Hoy.Month + 1);
                mesSiguiente.numMes = Hoy.Month + 1;
                mesAnterior.Nombre = getMonth(Hoy.Month - 1);
                mesAnterior.numMes = Hoy.Month - 1;
            }
        }

        public class Horario 
        { 
            public TimeSpan numeroHoras { get; set; }
            public TimeSpan inicioJornada { get; set; }
            public TimeSpan terminoJornada { get; set; }
            public TimeSpan inicioComida { get; set; }
            public TimeSpan terminoComida { get; set; }
        }

        public class dia 
        {
            public string nombre { get; set; }
            public int numDia { get; set; }
        }

        public class Mes 
        {
            public List<dia> diasDelMes { get; set; }
            public string Nombre { get; set; }
            public int TotalDias { get; set; }
            public int Semanas { get; set; }
            public int numMes { get; set; }
        }

        public static string getMonth(int mes)
        {
            switch (mes)
            {
                case 0:
                    return "Enero";
                case 1:
                    return "Febrero";
                case 2:
                    return "Marzo";
                case 3:
                    return "Abril";
                case 4:
                    return "Mayo";
                case 5:
                    return "Junio";
                case 6:
                    return "Julio";
                case 7:
                    return "Agosto";
                case 8:
                    return "Septiembre";
                case 9:
                    return "Octubre";
                case 10:
                    return "Noviembre";
                case 11:
                    return "Diciembre";
                default:
                    return "Enero";
            }
        }
    }
}