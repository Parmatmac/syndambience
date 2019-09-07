<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmpReports.aspx.cs" MasterPageFile="~/Branchadmin.Master" Inherits="SyndAmbiance.EmpReports" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="MainContent">

<form id="Form2" runat="server">

<div class="form-element-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="form-element-list">

                     <div class="cmp-tb-hd bcs-hd">

                            <div style="float:left;">
                            <h3>Branch: <asp:Label ID="admBranch" runat="server" Text=""></asp:Label></h3>
                            <p>Ambiance List of raised by employees </p>
                            <br />
                            </div>

                            <div style="float:right;">
                            <!--  <button class="btn  btn-default" data-toggle="tooltip" data-placement="left" title="Bulk Branch Upload"><i class="notika-icon notika-up-arrow"></i> Upload</button>
                            --></div>

                        </div>

                        <div style="clear:both;"></div>
                        
           <asp:GridView ID="empambiancelist" runat="server" 
        AutoGenerateColumns="False" ShowHeaderWhenEmpty="True"
                        EmptyDataText="Branch Ambiance not reported" GridLines="Both"
         class="table table-bordered" EmptyDataRowStyle-ForeColor="Red" CellPadding="1" HeaderStyle-BackColor="White" HeaderStyle-ForeColor="Black" HeaderStyle-BorderColor="#CCCCCC" BackColor="White" BorderColor="#CCCCCC" RowStyle-BackColor="White" RowStyle-BorderStyle="NotSet">
                            <AlternatingRowStyle />
                        <Columns>
                            <asp:TemplateField HeaderText="Ambiance Id"  HeaderStyle-BackColor="White">
                                <ItemTemplate>
                                    <asp:Label ID="id" runat="server" Text='<%#Eval("id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                             <asp:TemplateField HeaderText="Image" HeaderStyle-BackColor="White">
                                <ItemTemplate>
                              <asp:image ID="ambimage" runat="server" ImageUrl='<%#Eval("ambimg") %>' Width="70px" Height="70px"></asp:image>
                                </ItemTemplate>
                               </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Raised By" HeaderStyle-BackColor="White">
                                <ItemTemplate>
                                    <asp:Label ID="empid" runat="server" Text='<%#Eval("empid") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                           
                            <asp:TemplateField HeaderText="Message / Report" HeaderStyle-BackColor="White">
                                <ItemTemplate>
                                    <asp:Label ID="msg" runat="server" Text='<%#Eval("message") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status" HeaderStyle-BackColor="White">
                                <ItemTemplate>
                                    <asp:Label ID="sts" runat="server" Text='<%#Eval("status") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                           
                           
                        </Columns>

                            <EditRowStyle BackColor="#999999" />

<EmptyDataRowStyle ForeColor="Red"></EmptyDataRowStyle>
                            <FooterStyle BackColor="#5D7B9D" ForeColor="White" height="100px" 
                                Font-Bold="True"/>
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"  
                                height="100px"/>
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center"  
                                height="100px"/>
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333"  height="100px"/>
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"  
                                height="100px"/>
                            <SortedAscendingCellStyle BackColor="#E9E7E2"  height="100px"/>
                            <SortedAscendingHeaderStyle BackColor="#506C8C"  height="100px"/>
                            <SortedDescendingCellStyle BackColor="#FFFDF8"  height="100px"/>
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE"  height="100px"/>
                    </asp:GridView>

                    </div>
                    </div>
                    
                    </div>


                    </div>

                    </div>

</form>

</asp:Content>



