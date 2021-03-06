﻿<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="type_of_stillbirth.aspx.cs" Inherits="maamta_pw.type_of_stillbirth" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* For DropDown CSS */
        .textDropDownCSS {
            font-size: 1.2em;
            font-family: Calibri;
            Height: 2.4em;
            color: #16a085;
        }

        .StylePager {
            border-radius: 5px;
            text-align: left;
        }

            .StylePager a:hover {
                background-color: #33d9b2;
                margin-right: 3px;
                padding: 3px;
                border-radius: 3px;
            }

            .StylePager a {
                padding: 3px;
                margin-right: 3px;
            }

            .StylePager span {
                background: #FF4081;
                padding: 4px;
                border-radius: 3px;
                margin-right: 3px;
            }


        /* For Mobile Browser*/
        @media only screen and (max-width: 40em) {
            tddd, thhh {
                margin-top: 0.8em;
                display: block;
                text-align: center;
            }

            .Mobile {
                width: 90%;
                padding-left: 7%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:Panel ID="panel_VIEW_type_of_stillbirth" runat="server">

        <div style="color: #ff6b6b; font-size: 22px; width: 100%">
            Type of Stillbirth:
        </div>
        <hr style="border-top: 1px solid #ccc; background: transparent; margin-top: -3px" />

        <div id="divExportButton" runat="server" style="text-align: right; margin-top: -17px">
            <button type="button" id="Button1" class="btn btn-success" runat="server" style="height: 38px" onserverclick="btnExport_Click">
                Export &nbsp<span class="glyphicon glyphicon-export"></span>
            </button>
        </div>


        <%--Search Button--%>
        <div id="divSearch" runat="server" class="col-lg-4 col-lg-offset-4" style="margin-bottom: 10px; margin-top: 0px;">

            <div id="imaginary_container" style="margin-top: 10px">
                <div class="input-group stylish-input-group">
                    <asp:TextBox ID="txtdssid" CssClass="form-control txtboxx" ClientIDMode="Static" runat="server" placeholder="DSSID or STUDY-ID" MaxLength="18" ForeColor="Black"></asp:TextBox>
                    <span class="input-group-addon">
                        <button type="submit" id="btnSearch" runat="server" style="height: 20px" onserverclick="btnSearch_Click">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>
                    </span>
                </div>
            </div>

        </div>





        <div style="width: 100%; height: 460px; overflow: scroll; margin-top: 20px">
            <asp:GridView ID="GridView1" runat="server" EmptyDataText="No Record Found." AllowPaging="True" PageSize="200" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="OnRowDataBound" CssClass="footable" AllowSorting="false" ForeColor="#333333" AutoGenerateColumns="false">
                <Columns>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:LinkButton ID="Link_id" OnClick="Link_EditForm" Text='Edit' runat="server" ToolTip="Edit Type of Stillbirth" CommandArgument='<%#Eval("study_code")%>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Serial no.">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                        <ItemStyle Width="2%" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="assis_id" HeaderText="assis_id" />
                    <asp:BoundField DataField="study_code" HeaderText="study_code" />
                    <asp:BoundField DataField="date_of_visit" HeaderText="Date of Visit" />
                    <asp:BoundField DataField="woman_nm" HeaderText="Woman Name" />
                    <asp:BoundField DataField="husband_nm" HeaderText="Husband Name" />
                    <asp:BoundField DataField="dssid" HeaderText="dssid" />
                    <asp:BoundField DataField="type_of_stillbirth" HeaderText="Type of Stillbirth" />
                    <asp:BoundField DataField="description" HeaderText="Description" />
                </Columns>

                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#33d9b2" ForeColor="white" Font-Bold="True" Height="40px" />
                <PagerStyle BackColor="#576574" ForeColor="White" CssClass="StylePager" />
                <PagerSettings Position="TopAndBottom" Mode="NumericFirstLast" PreviousPageText="&amp;lt;" PageButtonCount="13" />

                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>



            <asp:GridView ID="GridView2" runat="server" EmptyDataText="No Record Found." CssClass="footable" AllowSorting="false" ForeColor="#333333" AutoGenerateColumns="false">
                <Columns>

                    <asp:TemplateField HeaderText="Serial no.">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                        <ItemStyle Width="2%" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="assis_id" HeaderText="assis_id" />
                    <asp:BoundField DataField="study_code" HeaderText="study_code" />
                    <asp:BoundField DataField="date_of_visit" HeaderText="Date of Visit" />
                    <asp:BoundField DataField="woman_nm" HeaderText="Woman Name" />
                    <asp:BoundField DataField="husband_nm" HeaderText="Husband Name" />
                    <asp:BoundField DataField="dssid" HeaderText="dssid" />
                    <asp:BoundField DataField="type_of_stillbirth" HeaderText="Type of Stillbirth" />
                    <asp:BoundField DataField="description" HeaderText="Description" />
                </Columns>
            </asp:GridView>
        </div>


    </asp:Panel>













    <asp:Panel ID="panel_EDIT_type_of_stillbirth" runat="server" DefaultButton="btnSubmit" Visible="false">
        <br />
        <div class="Mobile">
            <br/>
            <div style="color: #ff6b6b; font-size: 26px; width: 100%">
                <b>Type of Stillbirth</b>
            </div>
            <br/>
            <br/>

            <hr style="border-top: 1px solid #ccc; background: transparent; margin-top: -3px" />

            <table style="width: 100%; font-size: 1em; color: #4f5963; text-align: left;">


                <tr class="trCSS">
                    <td class="TableColumn tdCSS">Study ID</td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txt_StudyID" ReadOnly="true" ClientIDMode="Static" Style="text-transform: uppercase" type="text" Font-Size="Medium" Height="2.1em" placeholder="study id" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="trCSS">
                    <td class="TableColumn tdCSS">DSSID</td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txt_dss" ReadOnly="true" Style="text-transform: uppercase" ClientIDMode="Static" type="text" Font-Size="Medium" Height="2.1em" placeholder="dssid" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="trCSS">
                    <td class="TableColumn tdCSS">Woman Name</td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txt_woman_nm" ReadOnly="true" Style="text-transform: uppercase" ClientIDMode="Static" type="text" Font-Size="Medium" Height="2.1em" placeholder="woman name" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="trCSS">
                    <td class="TableColumn tdCSS">Husband Name</td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txt_husband_nm" ReadOnly="true" Style="text-transform: uppercase" ClientIDMode="Static" type="text" Font-Size="Medium" Height="2.1em" placeholder="husband name" runat="server"></asp:TextBox></td>
                </tr>

                <tr class="trCSS">
                    <td class="TableColumn tdCSS">Type of Stillbirth</td>
                    <td class="Space tdCSS">

                        <asp:DropDownList ID="DropDownList_TypeOfPregnancy" CssClass="form-control textDropDownCSS" data-style="btn-primary" runat="server">
                            <asp:ListItem Value="0">Select Types</asp:ListItem>
                            <asp:ListItem Value="Antepartum">Antepartum</asp:ListItem>
                            <asp:ListItem Value="Intrapartum">Intrapartum</asp:ListItem>
                        </asp:DropDownList>

                    </td>
                </tr>

                <tr class="trCSS">
                    <td class="TableColumn tdCSS">Remarks</td>
                    <td class="Space tdCSS">
                        <textarea id="txtremarks" runat="server"></textarea>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <div class="buttonWeb">
                <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" class="btn btn-theme btn-lg btn-block" OnClick="submit_Click" />
            </div>

            <br />
            <br />
        </div>
    </asp:Panel>







</asp:Content>
