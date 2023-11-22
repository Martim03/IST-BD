#!/usr/bin/python3

import cgi
import psycopg2
import sys
sys.path.insert(0, '/afs/.ist.utl.pt/users/3/2/ist1103432/web/impossible/to/find/this')
import not_login


def format_action_string(action):
    words = action.split('_')
    formatted_words = [word.capitalize() for word in words]
    formatted_string = ' '.join(formatted_words)
    return formatted_string


def generate_response(action, fields, table_name=None):
    print("Content-type: text/html\n")
    print("<html>")
    print("<head>")
    print('<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">')
    print("<style>")
    print("body {background-color: #191C1D; color: white;}")
    print(".table {color: white; max-width: 100%; table-layout: auto;}")
    print(".fixed-header {position: sticky; top: 0;  background-color: #191C1D; color: white;}")
    print("#pagination {justify-content: center;}")
    print("</style>")
    print("<title>Successful</title>")
    print("</head>")
    print("<body>")
    print('<div class="container">')
    print('<div class="row justify-content-center">')

    print('<div class="col-6">')
    print("<h1 class='text-center mt-4'style='background-color: #191C1D; color: white;' >Successful</h1>")
    print("<h3 class='text-center' style='background-color: #191C1D; color: white;'>Action: {}</h3>".format(
        format_action_string(action)))
    print("<table class='table mt-4'>")
    print("<thead>")
    print("<tr>")
    print("<th>Field</th>")
    print("<th>Value</th>")
    print("</tr>")
    print("</thead>")
    print("<tbody>")

    for field in fields:
        field_name = field.capitalize()
        field_value = form.getvalue(field)
        print("<tr>")
        print("<td>{}</td>".format(field_name))
        print("<td>{}</td>".format(field_value))
        print("</tr>")
    print("</tbody>")
    print("</table>")
    print('</div>')

    print('<div class="col-6">')

    cursor.execute('SELECT * FROM {} ORDER BY 1'.format(table_name))
    rows = cursor.fetchall()

    print("<h2 class='text-center mt-4'>Table: {}</h2>".format(table_name.capitalize()))
    print("<table id='myTable' class='table'>")
    print("<thead class='fixed-header'>")
    print("<tr>")

    for desc in cursor.description:
        print("<th>{}</th>".format(desc[0].capitalize()))
    print("</tr>")
    print("</thead>")
    print("<tbody>")

    for row in rows:
        print("<tr>")
        for item in row:
            print("<td>{}</td>".format(item))
        print("</tr>")
    print("</tbody>")
    print("</table>")
    print('<div id="pagination" class="d-flex justify-content-center"></div>')
    print('</div>')

    print('<div class="text-center mt-4 col-12">')
    print('<a href="/ist1103432/admin_dashboard.html" class="btn btn-primary">Go to Admin Dashboard</a>')
    print('</div>')

    print("</div>")
    print("</div>")
    print("</body>")
    print('<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>')  # jQuery for easier DOM manipulation
    print('<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>')  # Bootstrap JS for pagination

    # JavaScript to handle the pagination
    rowsToShow = 5 if table_name.lower() in ['customer', 'supplier'] else 10
    print(f"""
        <script>
            $(document).ready(function () {{
                var table = '#myTable';
                var rowsToShow = {rowsToShow};
                var totalRows = $(table + ' tbody tr').length;
                var totalPages = Math.ceil(totalRows / rowsToShow);
                var currentPage = 1;

                // Create the pagination element
                $('#pagination').append('<a href="javascript:void(0);" class="pagination-link mx-2" id="first"> << </a>');
                $('#pagination').append('<a href="javascript:void(0);" class="pagination-link mx-2" id="prev"> < </a>');
                for (var i = 1; i <= totalPages; i++) {{
                    $('#pagination').append('<a href="javascript:void(0);" class="pagination-link mx-1 page-number" id="' + i + '">' + i + '</a> ');
                }}
                $('#pagination').append('<a href="javascript:void(0);" class="pagination-link mx-2" id="next"> > </a>');
                $('#pagination').append('<a href="javascript:void(0);" class="pagination-link mx-2" id="last"> >> </a>');

                // Hide all the rows at first
                $(table + ' tbody tr').hide();

                // Show the first n rows
                $(table + ' tbody tr').slice(0, rowsToShow).show();

                // Hide pagination links
                $('.page-number').hide();
                $('#1').show();
                for (var i = 2; i <= 5; i++) {{
                    $('#' + i).show();
                }}

                // Handle the click event on the pagination links
                $(document).on('click', '.pagination-link', function () {{
                    // Determine the page number
                    var pageNum = $(this).attr('id');
                    if (pageNum == "first") {{
                        currentPage = 1;
                    }} else if (pageNum == "last") {{
                        currentPage = totalPages;
                    }} else if (pageNum == "prev") {{
                        if (currentPage == 1) return;
                        currentPage--;
                    }} else if (pageNum == "next") {{
                        if (currentPage == totalPages) return;
                        currentPage++;
                    }} else {{
                        currentPage = pageNum;
                    }}

                    pageNum = currentPage;

                    // Hide all the rows
                    $(table + ' tbody tr').hide();

                    // Determine the start point
                    var start = (pageNum - 1) * rowsToShow;

                    // Show the appropriate rows
                    $(table + ' tbody tr').slice(start, start + rowsToShow).show();

                    // Determine the range of visible pagination links
                    var minPage = Math.max(1, pageNum - 4);
                    var maxPage = Math.min(totalPages, pageNum + 4);

                    // Hide pagination links
                    $('.page-number').hide();
                    for (var i = minPage; i <= maxPage; i++) {{
                        $('#' + i).show();
                    }}
                }});
            }});
        </script>
    """)

    # checkpoint

    print("</html>")


def generate_error_page(error_message):
    print("Content-type: text/html\n")
    print("<html>")
    print("<head>")
    print("<title>Error - Something Went Wrong</title>")
    print('<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">')
    print("<style>")
    print("body {")
    print("  display: flex;")
    print("  justify-content: center;")
    print("  align-items: center;")
    print("  height: 100vh;")
    print("  margin: 0;")
    print("  background-color: #191C1D;")
    print("  color: white;")
    print("}")
    print("</style>")
    print("</head>")
    print("<body>")
    print("<div class='container'>")
    print("<div class='row justify-content-center'>")
    print("<div class='col-6 text-center'>")
    print("<h2>Error - Something Went Wrong</h2>")
    print("<p>We're sorry, but something went wrong.</p>")
    print("<p>")
    print(error_message)
    print("</p>")
    print('<button type="button" class="btn btn-primary mt-4" onclick="redirectToAdminDashboard()">Go to Admin Dashboard</button>')
    print("</div>")
    print("</div>")
    print("</div>")
    print("<script>")
    print("function redirectToAdminDashboard() {")
    print('  window.location.href = "/ist1103432/admin_dashboard.html";')
    print("}")
    print("</script>")
    print("</body>")
    print("</html>")


try:

    conn = psycopg2.connect(not_login.credentials)

    actions = ['register_product', 'remove product', 'change_product_price', 'change_product_description',
               'register_supplier', 'remove_supplier', 'register_client', 'remove_client']

    if __name__ == '__main__':

        conn.autocommit = False

        cursor = conn.cursor()

        form = cgi.FieldStorage()

        action = form.getvalue('action')

        if action == 'register_product':
            sku = form.getvalue('sku')
            name = form.getvalue('name')
            description = form.getvalue('description')
            price = form.getvalue('price')
            ean = form.getvalue('ean')

            sql = "INSERT INTO product VALUES (%(sku)s, %(name)s, %(description)s, %(price)s, %(ean)s)"

            cursor.execute(sql, {'sku': sku, 'name': name, 'description': description, 'price': price, 'ean': ean})

            conn.commit()

            fields = ['sku', 'name', 'description', 'price', 'ean']

            generate_response(action, fields, 'product')

        elif action == "remove_product":
            sku_remove = form.getvalue('sku')


            # theoretically not needed
            cursor.execute("START TRANSACTION; SET CONSTRAINTS ALL DEFERRED;")

            try:
                sql = """
                    DELETE FROM contains
                    WHERE SKU = %(sku)s;
                    
                    -- Identify orders that no longer contain any products and delete them from the process table
                    WITH orphan_orders AS (
                        SELECT order_no
                        FROM "order"
                        WHERE order_no NOT IN (SELECT DISTINCT order_no FROM contains)
                    )
                    DELETE FROM process
                    WHERE order_no IN (SELECT order_no FROM orphan_orders);
                    
                    -- Identify orders that no longer contain any products and delete them from the pay table
                    WITH orphan_orders AS (
                        SELECT order_no
                        FROM "order"
                        WHERE order_no NOT IN (SELECT DISTINCT order_no FROM contains)
                    )
                    DELETE FROM pay
                    WHERE order_no IN (SELECT order_no FROM orphan_orders);
                    
                    -- Identify orders that no longer contain any products and delete them from the order table
                    WITH orphan_orders AS (
                        SELECT order_no
                        FROM "order"
                        WHERE order_no NOT IN (SELECT DISTINCT order_no FROM contains)
                    )
                    DELETE FROM "order"
                    WHERE order_no IN (SELECT order_no FROM orphan_orders);
                    
                    -- Delete rows from the delivery table using the TINs that are no longer in the supplier table
                    DELETE FROM delivery
                    WHERE tin IN (SELECT tin FROM supplier WHERE sku = %(sku)s);
                    
                    DELETE FROM supplier
                    WHERE sku = %(sku)s;
                    
                    DELETE FROM product
                    WHERE sku = %(sku)s;
                    """

                cursor.execute(sql, {'sku': sku_remove})

                conn.commit()

                fields = ['sku']

                generate_response(action, fields, "product")

            except Exception as e:

                conn.rollback()
                generate_error_page(e)

        elif action == "change_product_price":
            sku_price = form.getvalue('skuPrice')
            new_price = form.getvalue('newPrice')

            sql_check = "SELECT * FROM product WHERE sku = %(sku)s"

            cursor.execute(sql_check, {'sku': sku_price})

            if cursor.fetchone() is None:
                generate_error_page("Product does not exist")
            else:
                sql = "UPDATE product SET price = %(price)s WHERE sku = %(sku)s"

                cursor.execute(sql, {'price': new_price, 'sku': sku_price})

                conn.commit()

                fields = ['skuPrice', 'newPrice']

                generate_response(action, fields, 'product')

        elif action == "change_product_description":
            sku_description = form.getvalue('skuDescription')
            new_description = form.getvalue('newDescription')

            sql_check = "SELECT * FROM product WHERE sku = %(sku)s"

            cursor.execute(sql_check, {'sku': sku_description})

            if cursor.fetchone() is None:
                generate_error_page("Product does not exist")
            else:

                sql = "UPDATE product SET description = %(description)s WHERE sku = %(sku)s"

                cursor.execute(sql, {'description': new_description, 'sku': sku_description})

                conn.commit()

                fields = ['skuDescription', 'newDescription']

                generate_response(action, fields, 'product')

        elif action == "register_supplier":
            tin = form.getvalue('tin')
            supplier_name = form.getvalue('supplierName')
            address = form.getvalue('address')
            supplier_sku = form.getvalue('supplierSKU')
            date = form.getvalue('date')

            sql = "INSERT INTO supplier (tin, name, address, sku, date) " \
                  "VALUES (%(tin)s, %(name)s, %(address)s, %(sku)s, %(date)s)"

            cursor.execute(sql, {'tin': tin, 'name': supplier_name, 'address': address, 'sku': supplier_sku,
                                 'date': date})

            conn.commit()

            fields = ['tin', 'supplierName', 'address', 'supplierSKU', 'date']

            generate_response(action, fields, 'supplier')

        elif action == "remove_supplier":
            tin_remove = form.getvalue('supplier_tin')

            try:
                sql = """
                -- Delete rows from the delivery table
                DELETE FROM delivery
                WHERE TIN IN (
                    SELECT TIN
                    FROM supplier
                    WHERE TIN = %(tin)s
                );
                
                -- Delete rows from the supplier table
                DELETE FROM supplier
                WHERE TIN = %(tin)s;
                """

                cursor.execute(sql, {'tin': tin_remove})

                conn.commit()

                fields = ['supplier_tin']

                generate_response(action, fields, 'supplier')

            except Exception as e:
                conn.rollback()
                generate_error_page(e)

        elif action == "register_client":
            client_id = form.getvalue('clientID')
            client_name = form.getvalue('clientName')
            email = form.getvalue('email')
            phone_number = form.getvalue('phoneNumber')
            client_address = form.getvalue('clientAddress')

            sql = "INSERT INTO customer (cust_no, name, email, phone, address) " \
                  "VALUES (%(cust_no)s, %(name)s, %(email)s, %(phone)s, %(address)s)"

            cursor.execute(sql, {'cust_no': client_id, 'name': client_name, 'email': email,
                                 'phone': phone_number, 'address': client_address})

            conn.commit()

            fields = ['clientID', 'clientName', 'email', 'phoneNumber', 'clientAddress']

            generate_response(action, fields, 'customer')

        elif action == "remove_client":
            client_id_remove = form.getvalue('customer_no')

            try:
                sql = """
                    DELETE FROM pay
                    WHERE cust_no = %(cust_no)s OR order_no IN (SELECT order_no FROM "order" WHERE cust_no = %(cust_no)s);
                    
                    DELETE FROM process
                    WHERE order_no IN (SELECT order_no FROM "order" WHERE cust_no = %(cust_no)s);
                    
                    DELETE FROM contains
                    WHERE order_no IN (SELECT order_no FROM "order" WHERE cust_no = %(cust_no)s);
                    
                    DELETE FROM "order"
                    WHERE cust_no = %(cust_no)s;
                    
                    DELETE FROM customer
                    WHERE cust_no = %(cust_no)s;
                    """

                cursor.execute(sql, {'cust_no': client_id_remove})

                conn.commit()

                fields = ['customer_no']

                generate_response(action, fields, 'customer')

            except Exception as e:
                conn.rollback()
                generate_error_page(e)

        elif action == "pay_order":
            cust_no = form.getvalue('pay_cust_no')
            order_no = form.getvalue('pay_order_no')

            sql = "INSERT INTO pay (order_no, cust_no) VALUES (%(order_no)s, %(cust_no)s)"

            cursor.execute(sql, {"order_no": order_no, "cust_no": cust_no})

            conn.commit()

            fields = ['pay_order_no', 'pay_cust_no']

            generate_response(action, fields, 'pay')

        elif action == "place_order":
            cust_no = form.getvalue('place_order_cust_no')
            order_no = form.getvalue('place_order_no')
            date = form.getvalue('place_order_date')
            sku = form.getlist('place_order_sku')
            quantity = form.getlist('place_order_quantity')
            if any(int(x) < 1 for x in quantity):
                generate_error_page("Invalid Product Quantity")
            else:
                try:
                    sql = "START TRANSACTION; SET CONSTRAINTS ALL DEFERRED;"
                    cursor.execute(sql)

                    sql = "INSERT INTO \"order\" (order_no, cust_no, date) VALUES (%(order_no)s, %(cust_no)s, %(date)s)"

                    cursor.execute(sql, {"order_no": order_no, "cust_no": cust_no, "date": date})

                    for sku, quantity in zip(sku, quantity):
                        sql = "INSERT INTO contains (order_no, sku, qty) VALUES (%(order_no)s, %(sku)s, %(qty)s)"

                        cursor.execute(sql, {"order_no": order_no, "sku": sku, "qty": quantity})

                    conn.commit()

                    fields = ['place_order_cust_no', 'place_order_no', 'place_order_date', 'place_order_sku',
                              'place_order_quantity']

                    generate_response(action, fields, '"order"')

                except Exception as e:

                    conn.rollback()
                    generate_error_page(e)

        else:

            generate_error_page("Invalid action")

        conn.close()

except Exception as error:
    generate_error_page(error)
