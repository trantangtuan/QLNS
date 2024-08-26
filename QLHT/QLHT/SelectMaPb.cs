using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLHT
{
    public sealed class SelectMaPb
    {
        public static SelectMaPb a = null;
        public int mapb {  get; set; }      // đây là biến lưu trữ
        public static SelectMaPb get()
        {
            
                if (a == null)
                {
                    a = new SelectMaPb();
                }
                return a;
            
        }

       
    }
}
