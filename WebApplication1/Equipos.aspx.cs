using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Equipos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LlenarGrid();
            }
        }

        public void alertas(String texto)
        {
            string message = texto;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());

        }

        protected void LlenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Select * From Equipos"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            datagrid.DataSource = dt;
                            datagrid.DataBind();  // actualizar el grid view
                        }
                    }
                }
            }
        }

        protected void Btn_Agregar_Click(object sender, EventArgs e)
        {
            if (Clases.Equipos.Agregar(CajaTipoEquipo.Text, CajaModelo.Text, int.Parse(CajaUsuarioID.Text)) > 0)
            {
                LlenarGrid();
                alertas("Equipo Agregado Correctamente");
            }
            else
            {
                alertas("Error al Agregar al Equipo");
            }
        }

        protected void Btn_Buscar_Click1(object sender, EventArgs e)
        {
            int EquipoCodigo = int.Parse(CajaEquipoID.Text);
            string constr = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Select * From Equipos Where EquipoID ='" + EquipoCodigo + "'"))


                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        datagrid.DataSource = dt;
                        datagrid.DataBind();  // actualizar el grid view
                    }
                }
            }
        }

        protected void Btn_Modificar_Click1(object sender, EventArgs e)
        {
            if (Clases.Equipos.Modificar(int.Parse(CajaEquipoID.Text), CajaTipoEquipo.Text, CajaModelo.Text, int.Parse(CajaUsuarioID.Text)) > 0)
            {
                LlenarGrid();
                alertas("Equipo Modificado Correctamente");
            }
            else
            {
                alertas("Error al Modificar al Equipo");
            }
        }

        protected void Btn_Borrar_Click1(object sender, EventArgs e)
        {
            if (Clases.Equipos.Borrar(int.Parse(CajaEquipoID.Text)) > 0)
            {
                LlenarGrid();
                alertas("Equipo Eliminado Correctamente");
            }
            else
            {
                alertas("Error al eliminar al Equipo");
            }
        }
    }
}