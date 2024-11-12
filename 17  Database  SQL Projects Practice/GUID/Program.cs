using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GUID;

namespace GUID
{
    internal class Program
    {
        static void Main(string[] args)
        {

            for (int i = 0; i < 10000; i++)
            {
                Guid guid =Guid.NewGuid();
                Console.WriteLine(guid +" "+ guid +" "+ guid);

                for (int j = 0; j < 10; j++)
                {
                    Console.WriteLine(guid + " " + guid + " " + guid);
                }

            }


            Console.ReadKey();

        }
    }
}
