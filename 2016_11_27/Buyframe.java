
import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import java.sql.*;
import java.util.*;
import java.text.*;
public class Buyframe extends JFrame implements ActionListener
{
 String select[] = {"식  비","교  통","통  신","쇼  핑","문  화","의  료","세  금","기  타"};
 JComboBox buySelect;
 JLabel buyLabel1;
 JLabel buyLabel2;
 JLabel buyLabel3;
 JLabel todayy;
 JLabel todaym;
 JLabel todayd;
 JTextField buyTextField;
 JTextField buyMemo;
 JButton save;
 JButton cancel;
 String nowdate;
 Todays t;
 JMenuItem menuItem1;
 JMenuItem menuItem2;
 JMenuItem alldel;
 String strSql;
 public Buyframe()
 {
  super("자바 가계부 프로그램");
  setSize(300,250);
  setLayout(new GridLayout(6,1));
 
  //폼 기본설정
  JPanel p0 = new JPanel();
  JPanel p1 = new JPanel();
  JPanel p2 = new JPanel();
  JPanel p3 = new JPanel();
  JPanel p4 = new JPanel();
  //패널설정
  t = new Todays();
  
  //날짜 클래스 선언
  JMenuBar menuBar = new JMenuBar();
  JMenu datas = new JMenu("내역보기");
  JMenu deld = new JMenu("레코드삭제");
  menuItem1 = new JMenuItem("월간내역");
  menuItem2 = new JMenuItem("코드검색삭제");
  alldel = new JMenuItem("모든레코드삭제");
  datas.add(menuItem1);
  deld.add(menuItem2);
  deld.add(alldel);
  menuBar.add(datas);menuBar.add(deld);
  add(menuBar);
  //메뉴바 설정
  todayy = new JLabel("8");
  todayy.setText("날 짜 : "+t.gety());
  todaym = new JLabel("8");
  todaym.setText(" "+t.getm());
  todayd = new JLabel("8");
  todayd.setText(" "+t.getd());
  
  buyLabel1 = new JLabel("지출내용 :");
  buySelect = new JComboBox(select); 
  buyLabel2 = new JLabel("    금  액 :");
  buyTextField = new JTextField(8);
  buyLabel3 = new JLabel("메        모 :");
     buyMemo =  new JTextField(19);
  save = new JButton("입  력");
  cancel = new JButton("지우기");
  //라이브러리
  menuItem2.addActionListener(this);
  menuItem1.addActionListener(this);
  alldel.addActionListener(this);
  save.addActionListener(this);
  cancel.addActionListener(this);
  //버튼이벤트
  p0.add(new JLabel(""));
  p1.add(todayy);
  p1.add(todaym);
  p1.add(todayd);
  p2.add(buyLabel1);
  p2.add(buySelect); 
  p2.add(buyLabel2);
  p2.add(buyTextField);  
  p3.add(buyLabel3);
  p3.add(buyMemo);
  p4.add(save);
  p4.add(cancel);
  //패널에 라이브러리 배치
  add(p0);add(p1);add(p2);add(p3);add(p4);
  //프레임에 패널 배치
  setLocation(100,100);
  setVisible(true);
 }
 public void actionPerformed(ActionEvent e)
 {
  if (e.getSource()==menuItem1)
  {
   JOptionPane.showMessageDialog(null, "월간내역보기");
   Dataframe df = new Dataframe(this);
   df.Run();
  }
  else if (e.getSource()==menuItem2)
  {
   JOptionPane.showMessageDialog(null, "레코드삭제");
   Delectframe delf = new Delectframe(this);
   delf.Run();
  }
  else if (e.getSource()==cancel)//이벤트가 발생한 컴포넌트가 cancel이면 실행
  {
   buyTextField.setText("");
   buyMemo.setText("");
  }
   else if(e.getSource()==alldel)
  {
   strSql = "Delete from allow;";
   Delectdata dd = new Delectdata(this,strSql);
   dd.delDatas();
  
  }
  else if(e.getSource()==save)//이벤트가 발생한 컴포넌트가 save이면 실행
  {
   boolean number = false; //숫자만 일때 판별 bool
   boolean character = false; //문자만 일때 판별 bool
   String src = buyTextField.getText();
   for(int i=0 ; i< src.length() ; i++){ //입력받은 값을 한글자씩 검색
   char result = src.substring(i,i+1).charAt(0);
   if((int)result<48 || (int)result>57){ //만약 숫자외의 문자라면...
   character = true;
   }else{ //만약 숫자라면...
   number = true;
   }
   }
   if(character == true && number == true){
   JOptionPane.showMessageDialog(null, "문자와 숫자가 혼용되어있습니다 숫자만입력하세요");
   }else if(character == true && number == false){
   JOptionPane.showMessageDialog(null, "문자열입니다 숫자만 입력하세요");
   }else if(character == false && number == true){
   
   int c = Integer.parseInt(buyTextField.getText());
   Save s = new Save(this,t.gety(),t.getm(),t.getd(),select[buySelect.getSelectedIndex()],c,buyMemo.getText());
   s.saveData();

   }
  }
  
 }
 public static void main(String[] args) 
 {
  Buyframe bf = new Buyframe();
  bf.setDefaultCloseOperation(EXIT_ON_CLOSE); //X눌르면 종료
 }
}
class Save
{
Frame f;
String year;
String month;
String week;
String item;
int cost;
String memo;
 public Save(Frame f,String year,String month,String week,String item,int cost,String memo)
 {
 this.f = f;
 this.year = year;
 this.month = month;
 this.week = week;
 this.item = item;
 this.cost = cost;
 this.memo = memo;
 }
 public void saveData()
 {
 try
 {
	 Class.forName("com.mysql.jdbc.Driver");
 }catch(ClassNotFoundException e){System.out.println("JDBC driver loading error:");}
  try{
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost/webdb", "root","jang201311240");
   Statement st=con.createStatement();
   
   String strSql = "insert into allow (year,month,week,item,cost,memo) values('"+year+"','"+month+"','"+week+"','"+item+"',"+cost+",'"+memo+"');";
   JOptionPane.showMessageDialog(null, strSql);
   st.executeUpdate(strSql);
   
   st.close();
   con.close();
   }catch(SQLException e){System.out.println("SQLException: "+e.getMessage());}
  }
}

class Todays 
{
 Calendar cal;
 SimpleDateFormat sdfy;
 SimpleDateFormat sdfm;
 SimpleDateFormat sdfd;
  public Todays()
 {
  cal = Calendar.getInstance();
  sdfy = new SimpleDateFormat();
  sdfm = new SimpleDateFormat();
  sdfd = new SimpleDateFormat();
  sdfy.applyPattern("yyyy");
  sdfm.applyPattern("MM");
  sdfd.applyPattern("dd");
 }
 public String gety(){
  String yyyy = sdfy.format(cal.getTime());
  return yyyy;
 }
 public String getm(){
  String mm = sdfm.format(cal.getTime());
  return  mm;
 }
 public String getd(){
  String dd = sdfd.format(cal.getTime());
  return dd;
 }
}

class Dataframe extends JFrame implements ActionListener
{
 Frame f;
 String years[] = {"2016","2017","2018","2019","2020","2021","2022","2023","2024"};
 String months[] = {"1","2","3","4","5","6","7","8","9","10","11","12"};
 
 JComboBox m;
 JComboBox y;
 JButton search;
 public Dataframe(Frame f)
 {
 this.f = f;
 }
 public void Run() 
 {
  JPanel p1 = new JPanel();
  y = new JComboBox(years);
  m = new JComboBox(months);
  search = new JButton("목록찾기");
  search.addActionListener(this);
  //버튼이벤트
  
  p1.add(new JLabel("년도 : "));p1.add(y);p1.add(new JLabel("월 : "));p1.add(m);p1.add(search);
  add(p1,BorderLayout.CENTER);
  setLocation(400,100);  
  setSize(400,100);
  setVisible(true);
  setTitle("월간 내역보기");
 }
 public void actionPerformed(ActionEvent e)
 {
 Loaddata ld = new Loaddata(this,years[y.getSelectedIndex()],months[m.getSelectedIndex()]);
 ld.loadDatas();
 }
}
 
class Loaddata extends JFrame  implements ActionListener 
{
Frame f;
String year;
String month;
String title[] = {"등록번호","년","월","일","지출내용","지출금액","메모"};
JTable table;
JScrollPane sp;
Dialog dialog;
Button close;
Panel dialogP1;
Panel dialogP2;
Panel dialogP3;
 public Loaddata(Frame f,String year,String month)
 {
 this.f = f;
 this.year = year;
 this.month = month;
 }
 public void loadDatas()
 {
 dialog = new Dialog(f);
 close = new Button("close");
 dialogP1 = new Panel();  // Panel 3개 생성 "선택 결과"가 배치
 dialogP2 = new Panel();  //     TextArea가 배치
 dialogP3 = new Panel();  //     close 버튼이 배치
 TextArea textArea = new TextArea(50,50); // TextArea 10은 줄 38은 너비
 textArea.setEditable(false);    // TextArea 수정 불가(Read Only)
  
 try
 {
	 Class.forName("com.mysql.jdbc.Driver");
 }catch(ClassNotFoundException e){System.out.println("JDBC driver loading error:");}
  try{
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost/webdb","root","jang201311240");
   Statement st=con.createStatement();
   
   String strSql = "select * from allow WHERE  year ='"+year+"' AND month = '"+month+"';";
   JOptionPane.showMessageDialog(null, strSql);
   ResultSet result=st.executeQuery(strSql); //st.executeQuery SQL 창에 입력하는 명령어를 적어넣을수있다. 
   ResultSetMetaData rmdata = result.getMetaData();
   int cols = rmdata.getColumnCount();
   while(result.next())
   {
   textArea.append("\n등록번호 : " + result.getString(1));
   textArea.append("\n날      짜 : " + result.getString(2)+"년"+result.getString(3)+"월"+result.getString(4)+"일");
   textArea.append("\n지출내용 : " + result.getString(5));
   textArea.append("\n지출금액 : " + result.getString(6));
   textArea.append("\n메      모 : " + result.getString(7));
   textArea.append("\n----------------------------------");
   textArea.append("\n                                                   ");
   }

   st.close();
   con.close();
   }catch(SQLException e){System.out.println("SQLException: "+e.getMessage());}
 
  close.addActionListener(this);// 다이얼로그 닫기
  dialog.setLocation(400,200);  // 다이얼로그 위치는 프로그램의(Frame)과 동일한 위치에서 시작
  dialog.setSize(400,600);     // 다이얼로그 사이즈
  dialog.setTitle(year+"년"+month+"월 지출내역");    // 다이얼로그 제목
  dialog.setLayout(new BorderLayout());  // 다이얼로그 Layout
  
  dialogP1.add(new Label("선택 사항"));  // Panel1에 선택사항이라는 레이블 배치
  dialogP2.add(textArea);      // Panel2에 textArea 배치
  dialogP3.add(close);      // Panel3에 close버튼 배치
  dialog.add(dialogP1,BorderLayout.NORTH); // Panel1을 다이얼로그의 상단에 배치
  dialog.add(dialogP2,BorderLayout.CENTER); // Panel2를 다이얼로그의 가운데에 배치
  dialog.add(dialogP3,BorderLayout.SOUTH); // Panel3을 다이얼로그의 하단에 배치
  dialog.show();        // 다이얼로그 보여줘!!
  
  }
   public void actionPerformed (ActionEvent  e) 
 {
  dialog.hide();  // dialog를 종료 해준다.
 }
}
class Delectframe extends JFrame implements ActionListener
{
 Frame f;
 JTextField codeField;
 String strSql;
 JButton del;
 
 public Delectframe(Frame f)
 {
 this.f = f;
 }
 public void Run() 
 {
  JPanel p1 = new JPanel();
  del = new JButton("레코드삭제");
  codeField = new JTextField(8);
  del.addActionListener(this);
  
  //버튼이벤트
  
  p1.add(new JLabel("삭제할등록코드입력 : "));p1.add(codeField);p1.add(del);
  
  add(p1,BorderLayout.CENTER);
  setLocation(400,100);   
  setSize(400,100);
  setVisible(true);
  setTitle("레코드 삭제");
 }
 public void actionPerformed(ActionEvent e)
 {
  strSql = "Delete from allow WHERE number ="+codeField.getText()+";";
  Delectdata dd = new Delectdata(this,strSql);
  dd.delDatas();
 }
}

class Delectdata extends JFrame
{
Frame f;
String strSql;
 public Delectdata(Frame f,String strSql)
 {
 this.f = f;
 this.strSql = strSql;
 }
 public void delDatas()
 {
 try
 {
	 Class.forName("com.mysql.jdbc.Driver");
 }catch(ClassNotFoundException e){System.out.println("JDBC driver loading error:");}
  try{
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost/webdb", "root","jang201311240");
   Statement st=con.createStatement();
   
   JOptionPane.showMessageDialog(null, strSql);
   st.executeUpdate(strSql);
  
   st.close();
   con.close();
   }catch(SQLException e){System.out.println("SQLException: "+e.getMessage());}
      
 }
}