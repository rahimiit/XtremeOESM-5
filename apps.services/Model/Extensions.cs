using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace apps.Services.Model
{
    public static class Extensions
    {
        public static DataTable ToDataTable<T>(this IList<T> data)
        {
            PropertyDescriptorCollection props =
                TypeDescriptor.GetProperties(typeof(T));
            DataTable table = new DataTable();
            for (int i = 0; i < props.Count; i++)
            {
                PropertyDescriptor prop = props[i];
                table.Columns.Add(prop.Name, prop.PropertyType);
            }
            object[] values = new object[props.Count];
            foreach (T item in data)
            {
                for (int i = 0; i < values.Length; i++)
                {
                    values[i] = props[i].GetValue(item);
                }
                table.Rows.Add(values);
            }
            return table;
        }

        public static List<TableIds> ToTableIds(this string data)
        {
            List<string> Idslist = data.Split(',').ToList();
            Idslist.Remove("");

            List<TableIds> _tableIds = new List<TableIds>();
            foreach (var each in Idslist.Distinct())
            {
                TableIds contract = new TableIds();
                contract.Id = each;
                _tableIds.Add(contract);
            }

            return _tableIds;
        }
    }




    public class TableIds
    {
        public string Id { get; set; }
    }
}
