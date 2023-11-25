<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Equipos.aspx.cs" Inherits="WebApplication1.Equipos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div class="container text-center">
            <h1> Equipos </h1>
            <p>&nbsp;</p>
        </div>
    <div>
    <br />
    <br />
    <asp:GridView runat="server" ID="datagrid" PageSize="10" HorizontalAlign="Center"
        CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header"
        RowStyle-CssClass="rows" AllowPaging="True" />
    <br />
    <br />
    <br />
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Equipo ID</label>
            <asp:TextBox ID="CajaEquipoID" runat="server" Width="205px"></asp:TextBox>
        </div>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Tipo Equipo</label>
            <asp:TextBox ID="CajaTipoEquipo" runat="server"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Modelo</label>
            <asp:TextBox ID="CajaModelo" runat="server" Width="218px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        </div>

        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Usuario ID</label>
            <asp:TextBox ID="CajaUsuarioID" runat="server" Width="197px"></asp:TextBox>
        </div>

        <asp:Button ID="Btn_Agregar" class="btn btn-info" runat="server" Text="Agregar" OnClick="Btn_Agregar_Click"/>
        <asp:Button ID="Btn_Borrar" class="btn btn-primary" runat="server" Text="Borrar" OnClick="Btn_Borrar_Click1"/>
        <asp:Button ID="Btn_Modificar" class="btn btn-info" runat="server" Text="Modificar" OnClick="Btn_Modificar_Click1"/>
        <asp:Button ID="Btn_Buscar" class="btn btn-primary" runat="server" Text="Buscar" OnClick="Btn_Buscar_Click1" />

</div>

</asp:Content>
