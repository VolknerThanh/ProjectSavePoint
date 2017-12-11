using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for CSDL
/// </summary>

public class CSDL
{
    private static CSDL instance;
    // đường dẫn
    private string conn = "Data Source=DESKTOP-GBE3FLU\\SILVER;Initial Catalog=ShoesDB;Integrated Security=True";
    //private string conn = @"Data Source = HPHUONG\SQLEXPRESS;Initial Catalog = QLTiecCuoi; Integrated Security = True";

    public static CSDL Instance
    {
        get
        {
            if (instance == null)
                instance = new CSDL();
            return instance;
        }

        private set
        {
            instance = value;
        }
    }
    public DataTable Run(string query, object[] param = null)
    {
        DataTable data = new DataTable();
        using (SqlConnection connection = new SqlConnection(conn))
        {
            connection.Open();
            SqlCommand command = new SqlCommand(query, connection);
            if (param != null)
            {
                string[] danhsach = query.Split(' ');
                int i = 0;
                foreach (string item in danhsach)
                {
                    if (item.Contains('@'))
                    {
                        command.Parameters.AddWithValue(item, param[i]);
                        i++;
                    }
                }
            }
            SqlDataAdapter adp = new SqlDataAdapter(command);
            adp.Fill(data);
            connection.Close();
        }
        return data;
    }
    public DataTable ExecuteQuery(string query)
    {
        DataTable data = new DataTable();
        SqlConnection connection = new SqlConnection(conn);
        connection.Open();
        SqlCommand cmd = new SqlCommand(query, connection);
        data.Load(cmd.ExecuteReader());
        connection.Close();
        return data;
    }
}
