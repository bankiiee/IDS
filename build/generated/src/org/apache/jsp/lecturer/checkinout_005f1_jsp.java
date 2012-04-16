package org.apache.jsp.lecturer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class checkinout_005f1_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_sql_query_var_dataSource;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_forEach_var_items;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_sql_query_var_dataSource = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_forEach_var_items = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_sql_query_var_dataSource.release();
    _jspx_tagPool_c_forEach_var_items.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
String ct = this.getServletContext().getContextPath();
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      if (_jspx_meth_sql_query_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<div>\n");
      out.write("    <div class=\"wrapper\">\n");
      out.write("        ");
      //  c:forEach
      org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
      _jspx_th_c_forEach_0.setPageContext(_jspx_page_context);
      _jspx_th_c_forEach_0.setParent(null);
      _jspx_th_c_forEach_0.setVar("item");
      _jspx_th_c_forEach_0.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${result.rows}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
      int[] _jspx_push_body_count_c_forEach_0 = new int[] { 0 };
      try {
        int _jspx_eval_c_forEach_0 = _jspx_th_c_forEach_0.doStartTag();
        if (_jspx_eval_c_forEach_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
          do {
            out.write("\n");
            out.write("\n");
            out.write("            <div class=\"content\">\n");
            out.write("                <div id=\"form_wrapper\" class=\"form_wrapper\">\t\t\t\t\t\n");
            out.write("                    <form class=\"login active\" name =\"updateForm\" action=\"");
            out.print(ct);
            out.write("/DoCheckInServlet\" method=\"GET\">\n");
            out.write("                        <center><h3>Check-in / Check-out <br>\n");
            out.write("\n");
            out.write("                            </h3></center>\n");
            out.write("                        <div>\n");
            out.write("                            <table border=\"0\">\n");
            out.write("                                <font style=\"color: RED;\">(*)</font> เป็นข้อมูลที่จำเป็นที่ต้องกรอก\n");
            out.write("                                <tbody>\n");
            out.write("                                    <tr>\n");
            out.write("                                        <td><label>ชื่อ: <font style=\"color: RED\">(*)</font></label>\n");
            out.write("                                            <input type=\"text\" name=\"fname\" id=\"fname\" placeholder=\"\" value=\"");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${firstname}", java.lang.String.class, (PageContext)_jspx_page_context, null));
            out.write("\" disabled=\"true\" autofocus=\"autofocus\"/></td>\n");
            out.write("                                        <td><label>นามสกุล: <font style=\"color: RED\">(*)</font></label>\n");
            out.write("                                            <input type=\"text\" name=\"lname\" placeholder=\"\" value=\"");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${lastname}", java.lang.String.class, (PageContext)_jspx_page_context, null));
            out.write("\" disabled=\"true\"/></td>\n");
            out.write("                                    </tr>\n");
            out.write("                                    <tr>\n");
            out.write("                                        <td><label>หมายเลขห้องพักอาจารย์: <font style=\"color: RED\">(*)</font></label>\n");
            out.write("                                            <input type=\"text\" name=\"room\" placeholder=\"\" disabled=\"true\" value=\"");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${item.room}", java.lang.String.class, (PageContext)_jspx_page_context, null));
            out.write("\"/>\n");
            out.write("                                        </td>\n");
            out.write("                                        <td>\n");
            out.write("                                            <label>สถานะของท่าน: </label> \n");
            out.write("                                            <select name=\"status\">\n");
            out.write("                                                <option value =\"ไม่ระบุ\">ไม่ระบุ</option>\n");
            out.write("                                                <option value =\"In-Office\">In-Office</option>\n");
            out.write("                                                <option value =\"Out-of-Office\">Out-of-Office</option>\n");
            out.write("                                                <option value =\"Out to Lunch\">Out to Lunch</option>\n");
            out.write("                                                <option value =\"Be Back Soon\">Be Back Soon</option>\n");
            out.write("                                                <option value =\"Do Not Disturb\">Do Not Disturb</option>\n");
            out.write("                                                <option value =\"On Leave\">On Leave</option>\n");
            out.write("                                                <option value =\"Meeting\">Meeting</option>\n");
            out.write("                                                <option value =\"In Class\">In Class</option>\n");
            out.write("                                            </select>\n");
            out.write("                                            \n");
            out.write("\n");
            out.write("                                        </td>\n");
            out.write("                                    </tr>\n");
            out.write("                                    <tr><td>\n");
            out.write("\n");
            out.write("                                        </td><td></td></tr>\n");
            out.write("                                </tbody>\n");
            out.write("                            </table>\n");
            out.write("\n");
            out.write("\n");
            out.write("                        </div>\n");
            out.write("                        <div class=\"bottom\">\n");
            out.write("                            \n");
            out.write("                                    <input type=\"button\" value=\"Check-In Now!\"  name=\"checkin\" onclick=\"doSubmit()\" ></input>\n");
            out.write("                               \n");
            out.write("<!--                            <div class=\"remember\"><input type=\"checkbox\" /><span>ข้อมูลถูกต้อง</span></div>-->\n");
            out.write("                            <div class=\"clear\"></div>\n");
            out.write("                        </div>\n");
            out.write("                    </form>\n");
            out.write("\n");
            out.write("                </div>\n");
            out.write("                <div class=\"clear\"></div>\n");
            out.write("            </div>\n");
            out.write("        </div>\n");
            out.write("    </div>\n");
            int evalDoAfterBody = _jspx_th_c_forEach_0.doAfterBody();
            if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
              break;
          } while (true);
        }
        if (_jspx_th_c_forEach_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
          return;
        }
      } catch (Throwable _jspx_exception) {
        while (_jspx_push_body_count_c_forEach_0[0]-- > 0)
          out = _jspx_page_context.popBody();
        _jspx_th_c_forEach_0.doCatch(_jspx_exception);
      } finally {
        _jspx_th_c_forEach_0.doFinally();
        _jspx_tagPool_c_forEach_var_items.reuse(_jspx_th_c_forEach_0);
      }
      out.write("\n");
      out.write("\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("   \n");
      out.write("    function doSubmit(){\n");
      out.write("        var ans = confirm('ผู้อื่นสามารถเห็นสถานะปัจจุบันของท่านได้ ยินยอม?');\n");
      out.write("        if(ans == true){\n");
      out.write("            document.forms[\"updateForm\"].submit();\n");
      out.write("        }\n");
      out.write("    }\n");
      out.write("</script>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_sql_query_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  sql:query
    org.apache.taglibs.standard.tag.rt.sql.QueryTag _jspx_th_sql_query_0 = (org.apache.taglibs.standard.tag.rt.sql.QueryTag) _jspx_tagPool_sql_query_var_dataSource.get(org.apache.taglibs.standard.tag.rt.sql.QueryTag.class);
    _jspx_th_sql_query_0.setPageContext(_jspx_page_context);
    _jspx_th_sql_query_0.setParent(null);
    _jspx_th_sql_query_0.setVar("result");
    _jspx_th_sql_query_0.setDataSource(new String("db"));
    int[] _jspx_push_body_count_sql_query_0 = new int[] { 0 };
    try {
      int _jspx_eval_sql_query_0 = _jspx_th_sql_query_0.doStartTag();
      if (_jspx_eval_sql_query_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        if (_jspx_eval_sql_query_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
          out = _jspx_page_context.pushBody();
          _jspx_push_body_count_sql_query_0[0]++;
          _jspx_th_sql_query_0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
          _jspx_th_sql_query_0.doInitBody();
        }
        do {
          out.write("\n");
          out.write("    SELECT DISTINCT * FROM user u, lecturer l where u.id = l.id and u.username = '");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${userid}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write('\'');
          out.write('\n');
          int evalDoAfterBody = _jspx_th_sql_query_0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
        if (_jspx_eval_sql_query_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
          out = _jspx_page_context.popBody();
          _jspx_push_body_count_sql_query_0[0]--;
      }
      if (_jspx_th_sql_query_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_sql_query_0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_sql_query_0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_sql_query_0.doFinally();
      _jspx_tagPool_sql_query_var_dataSource.reuse(_jspx_th_sql_query_0);
    }
    return false;
  }
}
