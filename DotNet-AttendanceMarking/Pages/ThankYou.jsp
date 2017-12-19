<html>
    <head>
		<script src="BKI/jquery.min.js"></script>
        <script src="BKI/bootstrap.min.js"></script>      
        
        <link rel="stylesheet" href="BKI/bootstrap.min.css">	
	</head>
    <body>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.servlet.*" %>
<%@ page import="java.servlet.http.*" %>
<%


String clientOrigin = request.getHeader("origin");
response.setHeader("Access-Control-Allow-Origin", clientOrigin);
response.setHeader("Access-Control-Allow-Methods", "POST");
response.setHeader("Access-Control-Allow-Headers", "Content-Type");
response.setHeader("Access-Control-Max-Age", "86400");


String teacherCard = request.getParameter("teacherCard");
String crnNumber = request.getParameter("crnNumber");
String termCode = request.getParameter("termCode");
//String todayDate = request.getParameter("todayDate");
//String heatId = request.getParameter("heatId");

String[] csv_string = request.getParameterValues("test[]");

//String file = "E:\\app\\Interface\\SAS\\" + teacherCard +"_"+ crnNumber + "_"+ termCode + ".csv";
String file = "E:\\app\\Interface\\SAS\\Import\\" + teacherCard +"_"+ crnNumber + "_"+ termCode + ".csv";

		Connection conn = null; 
		 
     Statement stmt = null; 
     ResultSet rset = null; 
        DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        conn = DriverManager.getConnection("jdbc:oracle:thin:@kismsdb-dev:1521:TEST","baninst1", "u_pick_it");
        stmt = conn.createStatement();
		
		String myVariable2 = "";
		
			rset = stmt.executeQuery ("select reference_number.nextval from dual");
			rset.next();
			myVariable2 = rset.getString(1);
			pageContext.setAttribute("myVariable2", myVariable2);
		
		
try {

           //FileWriter filewriter = new FileWriter(file, true);
		   
		   if(csv_string != null && csv_string.length > 0){
			   


		
			   FileWriter filewriter = new FileWriter(file, true);
			   for (String csv : csv_string){
					csv = csv + "," + myVariable2;				   
					filewriter.write(csv );	
					filewriter.write("\n" );				   
			   }
			   filewriter.close();
		   }
		   

					
           //filewriter.close();
		   
	
			
			
     try {
			 


	
		//select reference_number.netval from dual

        // dynamic query

		

		%>
		<!--<div> <%= rset.getString(1) %> </div>-->
		<c:out value="myVariable2"/> 
		<div class="conatiner-fluid">
			<div class="row" style="margin-top: 10em; text-align: center;">			
				<!--<div class="jumbotron">-->
					<div>
						<img src="images/tickicon.png" />
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="font-size: 4em;">
						<h1>Thank You!</h1>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<h1>You have successfully submitted Student Attendance File # ${myVariable2-1}</h1>
					</div>					
				<!--</div> -->
			</div>
		</div>
		
		
		
		<%
       
     } catch (SQLException e) { 
		System.out.println(e);
         //return ("<P> SQL error: <PRE> " + e + " </PRE> </P>\n");
     } finally {
         if (rset!= null) rset.close(); 
         if (stmt!= null) stmt.close();
         if (conn!= null) conn.close();
     }

	 
	 } catch (Exception e) { 
		System.out.println(e);
         //return ("<P> SQL error: <PRE> " + e + " </PRE> </P>\n");
     }

    String myVariable = "Test";
    pageContext.setAttribute("myVariable", myVariable);

%>
<c:out value="myVariable"/>
<!--<h1>${myVariable}</h1>-->


    </body>
</html>