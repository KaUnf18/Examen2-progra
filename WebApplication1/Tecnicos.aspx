<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Tecnicos.aspx.cs" Inherits="WebApplication1.Tecnicos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                <div class="container text-center">
            <h1> Tecnicos </h1>
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
            <label for="exampleInputEmail1" class="form-label">Tecnico ID</label>
            <asp:TextBox ID="CajaTecnicoID" runat="server" Width="281px"></asp:TextBox>
        </div>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Nombre Del Tecnico</label>
            <asp:TextBox ID="CajaNombreTecnico" runat="server" Width="214px"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Especialidad del Tecnico</label>
            <asp:TextBox ID="CajaEspecialidad" runat="server"></asp:TextBox>
        </div>
        
        <asp:Button ID="Btn_Agregar" class="btn btn-info" runat="server" Text="Agregar" OnClick="Btn_Agregar_Click"/>
        <asp:Button ID="Btn_Borrar" class="btn btn-primary" runat="server" Text="Borrar" OnClick="Btn_Borrar_Click"/>
        <asp:Button ID="Btn_Modificar" class="btn btn-info" runat="server" Text="Modificar" OnClick="Btn_Modificar_Click"/>
        <asp:Button ID="Btn_Buscar" class="btn btn-primary" runat="server" Text="Buscar" OnClick="Btn_Buscar_Click" />

</div>
</asp:Content>
