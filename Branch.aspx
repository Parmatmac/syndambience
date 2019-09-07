<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Branch.aspx.cs" MasterPageFile="~/BranchFeedback.Master" Inherits="SyndAmbiance.Branch" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="MainContent">

<form runat="server">


  <!-- Start Branch Details area -->

    <div class="normal-table-area">
        <div class="container">
     <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="normal-table-list mg-t-30">
                       <div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="breadcomb-list">
						<div class="row">
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
								<div class="breadcomb-wp">
									
									<div class="breadcomb-ctn">
										<h2>Branch: 
                                            <asp:Label ID="lblbranch" runat="server" Text=""></asp:Label></h2>
									
									</div>
								</div>
							</div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
								
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                           
							</div>
						</div>
					</div>
				</div>
			</div>

            <HR />
                        <div class="bsc-tbl-hvr">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Photo</th>
                                        <th>Zonal Office</th>
                                        <th>Reginal Office</th>
                                        <th>Rating</th>
                                        <th>Employee Review</th>
                                       
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <asp:Image ID="branchImage" runat="server" />
                                        </td>
                                        <td>
                                            <asp:Label ID="lblzone" runat="server" Text=""></asp:Label>
                                        </td>
                                        <td>
                                        <asp:Label ID="lblro" runat="server" Text=""></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" STYLE="color:Green; font-size:25PX;" Text="&#9733; &#9733; &#9733; &#9733; &#9734;"></asp:Label></td>
                                         <td>153</td>
                                    </tr>
                                    
                                </tbody>
                            </table>


                             <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th><h3>Admin Info</h3>
                                        <hr />
                                        </th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                         <td>
                                         
                                         <asp:GridView ID="grdAdminData" runat="server" 
        AutoGenerateColumns="False" ShowHeaderWhenEmpty="True"
                        EmptyDataText="Branch Ambiance data not added" GridLines="Both"
         class="table table-bordered" EmptyDataRowStyle-ForeColor="Red" CellPadding="1" HeaderStyle-BackColor="White" HeaderStyle-ForeColor="Black" HeaderStyle-BorderColor="#CCCCCC" BackColor="White" BorderColor="#CCCCCC" RowStyle-BackColor="White" RowStyle-BorderStyle="NotSet">
                            <AlternatingRowStyle />
                        <Columns>
                            <asp:TemplateField HeaderText="Id"  HeaderStyle-BackColor="White">
                                <ItemTemplate>
                                    <asp:Label ID="id" runat="server" Text='<%#Eval("usrid") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                             <asp:TemplateField HeaderText="Photo" HeaderStyle-BackColor="White">
                                <ItemTemplate>
                              <asp:image ID="admphoto" runat="server" ImageUrl='<%#Eval("photo") %>' Width="50px" Height="50px"></asp:image>
                                </ItemTemplate>
                               </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Name" HeaderStyle-BackColor="White">
                                <ItemTemplate>
                                    <asp:Label ID="admName" runat="server" Text='<%#Eval("usrname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                           
                            <asp:TemplateField HeaderText="Contact No." HeaderStyle-BackColor="White">
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



                                         </td>
                                    </tr>
                                    
                                </tbody>
                            </table>


                              <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th><h3>Staff Info</h3>
                                        <hr />
                                        </th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                         <td>
                                         
                                       
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
                              <asp:image ID="staffImg" runat="server" ImageUrl='<%#Eval("photo") %>' Width="50px" Height="50px"></asp:image>
                                </ItemTemplate>
                               </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Name" HeaderStyle-BackColor="White">
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




                                         </td>
                                    </tr>
                                    
                                </tbody>
                            </table>


                        </div>


                    </div>
                </div>
            </div>
            </div>
            </div>
    <!-- End Branch Details area-->



</form>


</asp:Content>



