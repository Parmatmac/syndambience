<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" MasterPageFile="~/RO.Master" Inherits="SyndAmbiance.index" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">


 <!-- Start Status area -->
    <div class="notika-status-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <div class="wb-traffic-inner notika-shadow sm-res-mg-t-30 tb-res-mg-t-30">
                        <div class="website-traffic-ctn">
                            <h2><span class="counter">
                                <asp:Label ID="lblTotalBranch" runat="server" Text=""></asp:Label></span></h2>
                            <p>Total Numbers of Branches</p>
                        </div>
                       
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <div class="wb-traffic-inner notika-shadow sm-res-mg-t-30 tb-res-mg-t-30">
                        <div class="website-traffic-ctn">
                            <h2><span class="counter"><asp:Label ID="lbltotalRO" runat="server" Text=""></asp:Label></span></h2>
                            <p>Total Number of Regional Office </p>
                        </div>
                       
                    </div>
                </div>
               
            </div>
        </div>
    </div>
    <!-- End Status area-->

     <div class="notika-email-post-area">
        <div class="container">
            <div class="row">
            </div>
            </div>
            </div>

  
    <!-- Start Branch Statistic area-->

     <div class="typography-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <div class="typography-list typography-mgn">
                       
                        <div class="typography-bd">
                           
                            <div id="chartContainer5" style="height: 370px; width: 100%;"></div>
                                    <script src="js/charts/canvasjs.min.js"></script> 

                            </div>
                    </div>
                    </div>

                     <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                   
                    <div class="typography-list typography-mgn">
                       
                        <div class="typography-bd">
                           
                            <div id="chartContainer6" style="height: 370px; width: 100%;"></div>
                                    <script src="js/charts/canvasjs.min.js"></script> 

                            </div>
                    </div>

                    </div>


                    </div>
                    </div>
                    </div>

    <!-- End Branch Statistic area-->

    <div style="clear:both;"></div>

    <hr style="background-color:#f6f8fa;" />

       <div class="notika-email-post-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <div class="email-statis-inner notika-shadow">
                        <div class="email-ctn-round">

                             <div id="chartContainer" style="height: 370px; width: 100%;"></div>
                                    <script src="js/charts/canvasjs.min.js"></script> 
                                          
                        </div>
                    </div>
                </div>
              
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <div class="recent-items-wp notika-shadow sm-res-mg-t-30">
                        <div class="rc-it-ltd">
                           
                            <div class="recent-items-inn">
                                 <div id="chartContainer2" style="height: 370px; width: 100%;"></div>
                                    <script src="js/charts/canvasjs.min.js"></script> 
                            </div>
							
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
   


</asp:Content>



