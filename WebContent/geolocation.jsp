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
<script src="http://maps.google.com/maps/api/js?sensor=false" 
          type="text/javascript"></script>
</head>
<body>
<%! 
Connection con = null; 
ResultSet rs = null; 
Statement stmt = null;
GeoLocation $gl;
String ipaddress = null;
Double lat;
Double lon;
Double a[][]= new Double[3][2];
int i=0;
%>
<%
String query="select * from iptable";
con = ConnectionManager.getConnection();
try {
	stmt=con.createStatement();
} catch (SQLException e1) {
	// TODO Auto-generated catch block
	request.getSession().invalidate();
	e1.printStackTrace();
}
try {
	rs = stmt.executeQuery(query);
} catch (SQLException e) {
	// TODO Auto-generated catch block
	request.getSession().invalidate();
	e.printStackTrace();
}
%>
<%
while(rs.next() && i<3)
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
<div id="map" style="width: 500px; height: 400px;"></div>

  <script type="text/javascript">
    var locations = [
      ['<%=$gl.City%> ', <%=lat%>, <%=lon%>]
    ];

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 11,
      center: new google.maps.LatLng(<%=lat%>, <%=lon%>),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infowindow = new google.maps.InfoWindow();

    var marker;
    var i;

    for (i = 0; i < locations.length; i++) {  
    	<%for(int i=0;i<3;i++){%>
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