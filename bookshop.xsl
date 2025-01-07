<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- Template that matches the root element "bookshop" -->
  <xsl:template match="/bookshop">
    <html>
      <head>
        <title>Bookshop - Sales and Stocks</title>
        <!-- CSS styles -->
        <style>
          <!-- General styling for the body -->  
          body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            color: #444;
          }
          <!-- Navigation bar styles -->
          nav {
            background-color: #d1dee8;
            padding: 10px;
            text-align: center;
          }
          nav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
          }
          nav li {
            display: inline;
            margin-right: 20px;
          }
          nav li a {
            text-decoration: none;
            color: #444;
            font-size: 20px; /* Larger font size */
          }
          nav li a:hover {
            color: #66c2cc;
          }
          <!-- Headings Styles-->
          h1, h2, h3 {
            text-align: center;
            color: #444;
            margin-top: 30px;
          }
          <!-- Table Styles -->
          table {
            border-collapse: collapse;
            width: 100%;
          }
          th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
          }
          th {
            background-color: #d1dee8;
            color: #444;
          }
          tr:nth-child(even) {
            background-color: #e8f0f7;
          }
          tr:hover {
            background-color: #f0e0eb;
          }
          <!-- Styles for book cover images -->
          img {
            display: block;
            margin: auto;
            max-width: 100px;
            max-height: 150px;
          }
          <!-- Styles for discounted books -->
          .discounted {
            background-color: #b3d9c1;
            color: #fff;
          }
          <!-- Style for out-of-stock books -->
          .out-of-stock {
            color: #ff4d4d;
          }
        </style>
      </head>
      <body>
        <!-- Navigation bar -->
        <nav>
          <!-- List of navigation links -->
          <ul>
            <li><a href="file:///C:/Users/User/Documents/1BOOK[1]/1BOOK/bookshop.html">Home</a></li>
            <li><a href="#sales">Sales</a></li>
            <li><a href="#out-stocks">Stocks</a></li>
          </ul>
        </nav>

        <!-- Big Sales section -->
        <h2 id="sales">SALES!</h2>
        <h3>Discount On Books Highlighted In Green And Book Title Sorted In Ascending Order</h3>
         <!-- Table for displaying book sales -->
        <table>
          <tr>
          <!-- Table header cells -->
            <th>Cover</th>
            <th>Book ID</th>
            <th>Title</th>
            <th>Genre</th>
            <th>Author</th>
            <th>Description</th>
            <th>Price</th>
            <th>Publisher</th>
            <th>Edition</th>
          </tr>
           <!-- Loop through each "book" element and sort them by "title" in ascending order -->
          <xsl:for-each select="book">
            <xsl:sort select="title"/> <!-- Sort books by title in ascending order -->
            <tr>
              <td>
                <!-- Display the cover image -->
                <img src="{cover_url}" alt="{title}" />
              </td>
              <!-- Display book information in respective cells -->
              <td><xsl:value-of select="ID"/></td>
              <!-- Display book information in respective cells -->
              <xsl:choose>
                <xsl:when test="price &lt; 400"> <!-- Check if price is less than 400 -->
                  <td class="discounted"><xsl:value-of select="title"/></td> <!-- Set background color to green -->
                </xsl:when>
                <xsl:otherwise>
                  <td><xsl:value-of select="title"/></td>
                </xsl:otherwise>
              </xsl:choose>
              <!-- Display other book information in respective cells -->
              <td><xsl:value-of select="genre"/></td>
              <td><xsl:value-of select="author"/></td>
              <td><xsl:value-of select="description"/></td>
              <td>RS<xsl:value-of select="price"/></td>
              <td><xsl:value-of select="publisher"/></td>
              <td><xsl:value-of select="edition"/></td>
            </tr>
          </xsl:for-each>
        </table>

        <!-- Manage Stocks section -->
        <h2 id="out-stocks">STOCKS</h2>
        <h3>Filter All Books: Out Of Stock</h3>
        <!-- Table for displaying out-of-stock books -->
        <table>
          <tr>
            <!-- Table header cells -->
            <th>Cover</th>
            <th>Book ID</th>
            <th>Title</th>
            <th>Genre</th>
            <th>Author</th>
            <th>Description</th>
            <th>Price</th>
            <th>Publisher</th>
            <th>Edition</th>
            <th>Stock</th>
          </tr>
          <!-- Loop through each "book" element and display books with "availability" value of 0 -->
          <xsl:for-each select="book">
            <xsl:if test="availability = 0">
              <!-- Table row for each out-of-stock book -->
              <tr>
                <td>
                  <!-- Display the cover image -->
                  <img src="{cover_url}" alt="{title}" />
                </td>
                <!-- Display book information in respective cells -->
                <td><xsl:value-of select="ID"/></td>
                <!-- Highlight the title if the book is out of stock -->
                <xsl:choose>
                  <xsl:when test="availability = 0">
                    <td class="out-of-stock"><xsl:value-of select="title"/></td>
                  </xsl:when>
                  <xsl:otherwise>
                    <td><xsl:value-of select="title"/></td>
                  </xsl:otherwise>
                </xsl:choose>
                <!-- Display other book information in respective cells -->
                <td><xsl:value-of select="genre"/></td>
                <td><xsl:value-of select="author"/></td>
                <td><xsl:value-of select="description"/></td>
                <td>RS<xsl:value-of select="price"/></td>
                <td><xsl:value-of select="publisher"/></td>
                <td><xsl:value-of select="edition"/></td>
                <td><xsl:value-of select="availability"/></td>
              </tr>
            </xsl:if>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
