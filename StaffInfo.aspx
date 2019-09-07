<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffInfo.aspx.cs" MasterPageFile="~/Branchadmin.Master" Inherits="SyndAmbiance.StaffInfo" %>


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
                            <p>Staff List of this branch </p>
                            <br />
                            </div>

                            <div style="float:right;">
                            <!--  <button class="btn  btn-default" data-toggle="tooltip" data-placement="left" title="Bulk Branch Upload"><i class="notika-icon notika-up-arrow"></i> Upload</button>
                            --></div>

                        </div>

                        <div style="clear:both;"></div>
                        
           <asp:GridView ID="BranchstaffInfo" runat="server" 
        AutoGenerateColumns="False" ShowHeaderWhenEmpty="True"
                        EmptyDataText="Branch Ambiance data not added" GridLines="Both"
         class="table table-bordered" EmptyDataRowStyle-ForeColor="Red" CellPadding="1" HeaderStyle-BackColor="White" HeaderStyle-ForeColor="Black" HeaderStyle-BorderColor="#CCCCCC" BackColor="White" BorderColor="#CCCCCC" RowStyle-BackColor="White" RowStyle-BorderStyle="NotSet">
                            <AlternatingRowStyle />
                        <Columns>
                            <asp:TemplateField HeaderText="Staff Id"  HeaderStyle-BackColor="White">
                                <ItemTemplate>
                                    <asp:Label ID="stfId" runat="server" Text='<%#Eval("staffid") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                             <asp:TemplateField HeaderText="Photo" HeaderStyle-BackColor="White">
                                <ItemTemplate>
                              <asp:image ID="staffImg" runat="server" ImageUrl='<%#Eval("photo") %>' Width="70px" Height="70px"></asp:image>
                                </ItemTemplate>
                               </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Staff Name" HeaderStyle-BackColor="White">
                                <ItemTemplate>
                                    <asp:Label ID="staffname" runat="server" Text='<%#Eval("staffname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                           
                            <asp:TemplateField HeaderText="Shift Time" HeaderStyle-BackColor="White">
                                <ItemTemplate>
                                    <asp:Label ID="shift" runat="server" Text='<%#Eval("shift") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mobile" HeaderStyle-BackColor="White">
                                <ItemTemplate>
                                    <asp:Label ID="mobno" runat="server" Text='<%#Eval("mobile") %>'></asp:Label>
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



