using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DentisOne.Utilidades
{
    public class Utils
    {
        public string transformID(int id)
        {
            string aux = id.ToString();
            string number = "";
            switch (aux.Length)
            { 
                case 1:
                    number = "000" + aux;
                    break;
                case 2:
                    number = "00" + aux;
                    break;
                case 3:
                    number = "0" + aux;
                    break;
                case 4:
                    number = aux;
                    break;
            }
            return number;
        }
    }
}