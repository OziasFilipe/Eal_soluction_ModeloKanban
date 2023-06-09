﻿<%@ Page Language="C#"  CodeFile="Portal.aspx.cs" Inherits="EalSoluction.Pages.Portal.Portal" %>

<%@ Import Namespace="Ext.Net.Utilities" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!X.IsAjaxRequest)
        {
          
            this.ResourceManager1.RegisterClientScriptBlock("text", string.Format("var text=\"{0}\";", "text"));

            foreach (Portlet portlet in ControlUtils.FindControls<Portlet>(this.Page))
            {
                portlet.Html = "<p>" +
                               "Tarefas teste sadsdasda" +
                               "</p>" +
                               "<button type=\"button\" class=\"btn btn-dark\">Dark</button>" +
                               "</br>" +
                               "<p>teste master</p>";

                portlet.BodyPadding = 5;
                portlet.CloseAction = CloseAction.Hide;
            }
        }

        foreach (Portlet portlet in ControlUtils.FindControls<Portlet>(this.Page))
        {
            portlet.DirectEvents.Hide.Event += Portlet_Hide;
            portlet.DirectEvents.Hide.EventMask.ShowMask = true;
            portlet.DirectEvents.Hide.EventMask.Msg = "Saving...";
            portlet.DirectEvents.Hide.EventMask.MinDelay = 500;

            portlet.DirectEvents.Hide.ExtraParams.Add(new Ext.Net.Parameter("ID", portlet.ClientID));
        }
    }

    protected void Portlet_Hide(object sender, DirectEventArgs e)
    {
        X.Msg.Alert("Status", e.ExtraParams["ID"] + " Hidden").Show();
    }
</script>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Portal in TabPanel - Ext.NET Examples</title>
    <link href="/resources/css/examples.css" rel="stylesheet" />
    <!--CSS Bootstrap-->
    <link href="Content/CSS/Bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form runat="server">
        <ext:ResourceManager ID="ResourceManager1" runat="server" />

        <ext:Viewport runat="server" Layout="Border">
            <Items>
                <ext:Panel
                    runat="server"
                    Region="West"
                    Title="Nome do Projeto"
                    Width="200"
                    Collapsible="true"
                    Split="true"
                    MinWidth="175"
                    MaxWidth="400"
                    MarginSpec="5 0 5 5"
                    Layout="Accordion">
                    <Items>
                        <ext:Panel
                            runat="server"
                            Border="false"
                            Collapsed="true"
                            Icon="Note"
                            Scrollable="Both"
                            Title="Content"
                            Html="={text}"
                            BodyPadding="5" />
                        <ext:Panel
                            runat="server"
                            Border="false"
                            Collapsed="true"
                            Icon="FolderWrench"
                            Scrollable="Both"
                            Title="Settings"
                            Html="={text}"
                            BodyPadding="5" />
                    </Items>
                </ext:Panel>
     
                <ext:TabPanel
                    runat="server"
                    Region="Center"
                    Title="TabPanel"
                    MarginSpec="5 5 5 0"
                    >
                    <Items>
                        <ext:Panel runat="server" Title="Projeto 1" Layout="Fit">
                            <Items>
                                <ext:Portal runat="server" Border="false">
                                    <Items>
                                        <ext:PortalColumn runat="server">
                                            <Items>
                                                <ext:Portlet ID="Portlet1" runat="server" Title="Another Panel 1" Icon="Accept" />
                                            </Items>
                                        </ext:PortalColumn>
                                        <ext:PortalColumn runat="server">
                                            <Items>
                                                <ext:Portlet ID="Portlet2" runat="server" Title="Panel 2" />
                                                <ext:Portlet ID="Portlet3" runat="server" Title="Another Panel 2" />
                                            </Items>
                                        </ext:PortalColumn>
                                        <ext:PortalColumn runat="server">
                                            <Items>
                                                <ext:Portlet ID="Portlet4" runat="server" Title="Panel 3" />
                                                <ext:Portlet ID="Portlet5" runat="server" Title="Another Panel 3" />
                                            </Items>
                                        </ext:PortalColumn>
                                    </Items>
                                </ext:Portal>
                            </Items>
                        </ext:Panel>
                        <ext:Panel runat="server" Title="Projeto 2" Layout="Fit">
                            <Items>
                                <ext:Portal runat="server" Border="false">
                                    <Items>
                                        <ext:PortalColumn runat="server">
                                            <Items>
                                                <ext:Portlet ID="Portlet7" Title="Another Panel 3" runat="server" />
                                            </Items>
                                        </ext:PortalColumn>
                                        <ext:PortalColumn runat="server">
                                            <Items>
                                                <ext:Portlet ID="Portlet8" Title="Projeto 2" runat="server" />
                                                <ext:Portlet ID="Portlet9" Title="Another Panel 2" runat="server" />
                                            </Items>
                                        </ext:PortalColumn>
                                        <ext:PortalColumn runat="server">
                                            <Items>
                                                <ext:Portlet ID="Portlet10" Title="Another Panel 1" runat="server" />
                                            </Items>
                                        </ext:PortalColumn>
                                    </Items>
                                </ext:Portal>
                            </Items>
                        </ext:Panel>
                    </Items>
                </ext:TabPanel>
            </Items>
        </ext:Viewport>
    </form>
<!--Jquery-->
    <script src="scripts/JS/jquery-1.12.4.min.js"></script>
    <!--JavaScript Bootstrap-->
  <script src="scripts/JS/Bootstrap.js"></script>
</body>
</html>