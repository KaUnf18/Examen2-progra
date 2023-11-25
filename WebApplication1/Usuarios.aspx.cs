using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Clases;

namespace WebApplication1
{
    public partial class Usuarios : System.Web.UI.Page
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
                using (SqlCommand cmd = new SqlCommand("Select * From Usuarios"))
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
            if (Clases.Usuarios.Agregar(CajaNombre.Text, CajaCorreoElectronico.Text, CajaTelefono.Text) > 0)
            {
                LlenarGrid();
                alertas("Usuario Agregado Correctamente");
            }
            else
            {
                alertas("Error al Agregar al Usuario");
            }
        }

        protected void Btn_Borrar_Click(object sender, EventArgs e)
        {
            if (Clases.Usuarios.Borrar(int.Parse(CajaUsuarioID.Text)) > 0)
            {
                LlenarGrid();
                alertas("Usuario Eliminado Correctamente");
            }
            else
            {
                alertas("Error al Eliminar al Usuario");
            }
        }

        protected void Btn_Modificar_Click(object sender, EventArgs e)
        {
            if (Clases.Usuarios.Modificar(int.Parse(CajaUsuarioID.Text), CajaNombre.Text, CajaCorreoElectronico.Text, CajaTelefono.Text) > 0)
            {
                LlenarGrid();
                alertas("Usuario Modificado Correctamente");
            }
            else
            {
                alertas("Error al Modificar al Usuario");
            }
        }

        protected void Btn_Buscar_Click(object sender, EventArgs e)
        {
            int Usuariocodigo = int.Parse(CajaUsuarioID.Text);
            string constr = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Select * From Usuarios Where UsuarioID ='" + Usuariocodigo + "'"))


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
}