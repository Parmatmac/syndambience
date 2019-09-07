<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmpReportAmbiance.aspx.cs" MasterPageFile="~/BranchFeedback.Master" Inherits="SyndAmbiance.EmpReportAmbiance" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="MainContent">

<form id="Form1" runat="server">

<div class="form-element-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="form-element-list">

                     <div class="cmp-tb-hd bcs-hd">

                            <div style="float:left;">
                            <h3>Branch: <asp:Label ID="lblbranch" runat="server" Text=""></asp:Label></h3>
                            <p>Report an ambiance near to you for making system neat and clean </p>
                            </div>

                            <div style="float:right;">
                            <!--  <button class="btn  btn-default" data-toggle="tooltip" data-placement="left" title="Bulk Branch Upload"><i class="notika-icon notika-up-arrow"></i> Upload</button>
                            --></div>

                        </div>

                        <div style="clear:both;"></div>
                        <hr />

                         <div class="bsc-tbl-hvr">
                            <table class="table table-hover">
                              
                                <tbody>
                                    <tr>
                                        <td>Employee Id</td>
                                         <td>Message / Report</td>
                                        <td>Uploads Image</td>
                                        
                                    </tr>
                                     <tr>
                                        <td>
                                        <asp:TextBox ID="txtEmpId" class="form-control" placeholder="Id"   required="required" runat="server"></asp:TextBox>
                                        </td>
                                         <td>
                                         <asp:TextBox ID="txtcomment" required="required" class="form-control" rows="2" placeholder="Comments" runat="server" TextMode="MultiLine"></asp:TextBox>
                                         </td>
                                        <td>
                                        <asp:FileUpload ID="ambimg" runat="server"  required="required" />
                                        </td>
                                       
                                        
                                    </tr>
                                     <tr>
                                        <td>
                                         <asp:Button ID="btnSubmit" class="btn btn-success notika-btn-success" 
                                            runat="server" Text="Submit" onclick="btnSubmit_Click" />
                                        </td>
                                        <td></td>
                                         <td>
                                          <asp:Button ID="btnFeedback" class="btn btn-success notika-btn-success" 
                                            runat="server" Text="Give Your Feedback" onclick="btnFeedback_Click" 
                                                 CausesValidation="False" />
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

</form>

</asp:Content>



