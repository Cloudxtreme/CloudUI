<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page
    import="javaQuery.j2ee.*" 
    import="javaQuery.importClass.javaQueryBundle"
    import="com.ayu.UI.ConnectionManager"
    import="java.sql.*"
    import="com.ayu.UI.UserBean"
	%>
<% UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
 if(currentUser==null){
	 
	 response.sendRedirect(request.getContextPath() + "/index.jsp");
	 
	 
 }
 else{%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GeoLocation</title>
<script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDdg4QGL4bIavcQAg5chLQ3uM9xd7BQhkA&sensor=false">
</script>

</head>
<body>
<%! 
Connection con = null; 
ResultSet rs = null; 
ResultSet rs1 = null; 
Statement stmt = null;
Statement stmt1 = null;
GeoLocation $gl;
String ipaddress = null;
Double lat;
Double lon;
int count;
Double a[][];
%>
<%
String query="select * from iptable";
String coun = "select count(*) from iptable";
con = ConnectionManager.getConnection();
try {
	stmt=con.createStatement();
	stmt1=con.createStatement();
} catch (SQLException e1) {
	// TODO Auto-generated catch block
	request.getSession().invalidate();
	e1.printStackTrace();
}
try {
	rs = stmt.executeQuery(query);
	rs1 = stmt1.executeQuery(coun);
} catch (SQLException e) {
	// TODO Auto-generated catch block
	request.getSession().invalidate();
	e.printStackTrace();
}
%>
<%
if(rs1.next())
{
	count = rs1.getInt(1);
	a= new Double[count][2];
}
int i=0;
while(rs.next() && i<count)
{
	
	try {

		
		ipaddress = rs.getString("ipaddress");
		request.getHeader("VIA");
		$gl = javaQueryBundle.createGeoLocation();
		$gl.MAPTargetByIP(ipaddress, "");
		lat = Double.parseDouble($gl.Latitude);
		lon = Double.parseDouble($gl.Longitude);
		a[i][0]=lat;
		a[i][1]=lon;
		i++;
	} catch (SQLException e) {
		request.getSession().invalidate();
		e.printStackTrace();
	}
}

%>
<div id="map" style="width: 1185px; height: 660px;"></div>

  <script type="text/javascript">
    var locations = [
      ['<%=$gl.City%> ', <%=lat%>, <%=lon%>]
    ];

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 6,
      center: new google.maps.LatLng(<%=lat%>, <%=lon%>),
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      mapTypeControl: false
    });

    var infowindow = new google.maps.InfoWindow();

    var marker;
    var i;

    for (i = 0; i < locations.length; i++) {  
    	<%for(i=0;i<count;i++){%>
      	marker = new google.maps.Marker({
        position: new google.maps.LatLng(<%=a[i][0]%>, <%=a[i][1]%>),
        map: map
      });<%}%>

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(locations[i][0]);
          infowindow.open(map, marker);
        }
      })(marker, i));
    }
  </script>
</body>
</html>
<%}%>