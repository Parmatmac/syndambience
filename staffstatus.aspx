<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="staffstatus.aspx.cs"  MasterPageFile="~/Branchadmin.Master" Inherits="SyndAmbiance.staffstatus" %>

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
                            <p>Please update staff ambiance ratings to improve our Synd Ambiance. </p>
                            </div>

                            <div style="float:right;">
                            <!--  <button class="btn  btn-default" data-toggle="tooltip" data-placement="left" title="Bulk Branch Upload"><i class="notika-icon notika-up-arrow"></i> Upload</button>
                            --></div>

                        </div>

                        <div style="clear:both;"></div>
                        
           <asp:GridView ID="staffStatusRating" runat="server" 
        AutoGenerateColumns="False" ShowHeaderWhenEmpty="True"
                        EmptyDataText="Branch Ambiance data not added" GridLines="Both"
         class="table table-bordered" EmptyDataRowStyle-ForeColor="Red" CellPadding="1" HeaderStyle-BackColor="White" HeaderStyle-ForeColor="Black" HeaderStyle-BorderColor="#CCCCCC" BackColor="White" BorderColor="#CCCCCC" RowStyle-BackColor="White" RowStyle-BorderStyle="NotSet">
                            <AlternatingRowStyle />
                        <Columns>
                           
                             <asp:TemplateField HeaderText="Staff Id"  HeaderStyle-BackColor="White">
                                <ItemTemplate>
                                    <asp:Label ID="stffId" runat="server" Text='<%#Eval("staffid") %>'></asp:Label>
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


                            <asp:TemplateField HeaderText="Ratings"  HeaderStyle-BackColor="White">
                                <ItemTemplate>
                                                               
                                      <asp:DropDownList ID="drpRating" runat="server" BackColor="#f7f6f3" 
            Font-Bold="True" Font-Size="30px" Font-Strikeout="False" ForeColor="#FF3300" 
            Width="200px" style="border-color:#f7f6f3; color:Green; border:none;">
            
            <asp:ListItem  style="color:green; font-size:35; padding:5px;" Value="1">&#9733; &#9734; &#9734; &#9734; &#9734;</asp:ListItem>
             <asp:ListItem style="color:green; font-size:35; padding:5px;"  Value="2">&#9733; &#9733; &#9734; &#9734; &#9734;</asp:ListItem>
             <asp:ListItem  style="color:green; font-size:35; padding:5px;" Value="3"  Selected="True">&#9733; &#9733; &#9733; &#9734; &#9734;</asp:ListItem>
             <asp:ListItem style="color:green; font-size:35; padding:5px;" Value="4">&#9733; &#9733; &#9733; &#9733; &#9734;</asp:ListItem>
            <asp:ListItem style="color:green; font-size:35; padding:5px;" Value="5">&#9733; &#9733; &#9733; &#9733; &#9733;</asp:ListItem>
          
        </asp:DropDownList>        
       
                                </ItemTemplate>
                            </asp:TemplateField>


                             <asp:TemplateField HeaderText="Confirm Check" HeaderStyle-BackColor="White">
                                <ItemTemplate>
                                    <asp:CheckBox ID="confirmchk" required="required"  runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Comments"  HeaderStyle-BackColor="White">
                                <ItemTemplate>
                                    <asp:TextBox ID="comment" required="required" class="form-control" rows="2" placeholder="Comments" runat="server" TextMode="MultiLine"></asp:TextBox>
                                
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


                      <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                <div class="form-group ic-cmp-int">
                                    
                                    <div class="nk-int-st">
                                        <asp:Button ID="Button1" class="btn btn-success notika-btn-success" 
                                            runat="server" Text="Submit" onclick="btnSubmit_Click" />
                                       
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                <div class="form-group ic-cmp-int">
                                    
                                   
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                              
                            </div>
                        </div>

                    </div>

                    </div>

</form>

</asp:Content>


