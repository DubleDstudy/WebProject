
import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import java.sql.*;
import java.util.*;
import java.text.*;
public class Buyframe extends JFrame implements ActionListener
{
 String select[] = {"��  ��","��  ��","��  ��","��  ��","��  ȭ","��  ��","��  ��","��  Ÿ"};
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
  super("�ڹ� ����� ���α׷�");
  setSize(300,250);
  setLayout(new GridLayout(6,1));
 
  //�� �⺻����
  JPanel p0 = new JPanel();
  JPanel p1 = new JPanel();
  JPanel p2 = new JPanel();
  JPanel p3 = new JPanel();
  JPanel p4 = new JPanel();
  //�гμ���
  t = new Todays();
  
  //��¥ Ŭ���� ����
  JMenuBar menuBar = new JMenuBar();
  JMenu datas = new JMenu("��������");
  JMenu deld = new JMenu("���ڵ����");
  menuItem1 = new JMenuItem("��������");
  menuItem2 = new JMenuItem("�ڵ�˻�����");
  alldel = new JMenuItem("��緹�ڵ����");
  datas.add(menuItem1);
  deld.add(menuItem2);
  deld.add(alldel);
  menuBar.add(datas);menuBar.add(deld);
  add(menuBar);
  //�޴��� ����
  todayy = new JLabel("8");
  todayy.setText("�� ¥ : "+t.gety());
  todaym = new JLabel("8");
  todaym.setText(" "+t.getm());
  todayd = new JLabel("8");
  todayd.setText(" "+t.getd());
  
  buyLabel1 = new JLabel("���⳻�� :");
  buySelect = new JComboBox(select); 
  buyLabel2 = new JLabel("    ��  �� :");
  buyTextField = new JTextField(8);
  buyLabel3 = new JLabel("��        �� :");
     buyMemo =  new JTextField(19);
  save = new JButton("��  ��");
  cancel = new JButton("�����");
  //���̺귯��
  menuItem2.addActionListener(this);
  menuItem1.addActionListener(this);
  alldel.addActionListener(this);
  save.addActionListener(this);
  cancel.addActionListener(this);
  //��ư�̺�Ʈ
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
  //�гο� ���̺귯�� ��ġ
  add(p0);add(p1);add(p2);add(p3);add(p4);
  //�����ӿ� �г� ��ġ
  setLocation(100,100);
  setVisible(true);
 }
 public void actionPerformed(ActionEvent e)
 {
  if (e.getSource()==menuItem1)
  {
   JOptionPane.showMessageDialog(null, "������������");
   Dataframe df = new Dataframe(this);
   df.Run();
  }
  else if (e.getSource()==menuItem2)
  {
   JOptionPane.showMessageDialog(null, "���ڵ����");
   Delectframe delf = new Delectframe(this);
   delf.Run();
  }
  else if (e.getSource()==cancel)//�̺�Ʈ�� �߻��� ������Ʈ�� cancel�̸� ����
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
  else if(e.getSource()==save)//�̺�Ʈ�� �߻��� ������Ʈ�� save�̸� ����
  {
   boolean number = false; //���ڸ� �϶� �Ǻ� bool
   boolean character = false; //���ڸ� �϶� �Ǻ� bool
   String src = buyTextField.getText();
   for(int i=0 ; i< src.length() ; i++){ //�Է¹��� ���� �ѱ��ھ� �˻�
   char result = src.substring(i,i+1).charAt(0);
   if((int)result<48 || (int)result>57){ //���� ���ڿ��� ���ڶ��...
   character = true;
   }else{ //���� ���ڶ��...
   number = true;
   }
   }
   if(character == true && number == true){
   JOptionPane.showMessageDialog(null, "���ڿ� ���ڰ� ȥ��Ǿ��ֽ��ϴ� ���ڸ��Է��ϼ���");
   }else if(character == true && number == false){
   JOptionPane.showMessageDialog(null, "���ڿ��Դϴ� ���ڸ� �Է��ϼ���");
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
  bf.setDefaultCloseOperation(EXIT_ON_CLOSE); //X������ ����
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
  search = new JButton("���ã��");
  search.addActionListener(this);
  //��ư�̺�Ʈ
  
  p1.add(new JLabel("�⵵ : "));p1.add(y);p1.add(new JLabel("�� : "));p1.add(m);p1.add(search);
  add(p1,BorderLayout.CENTER);
  setLocation(400,100);  
  setSize(400,100);
  setVisible(true);
  setTitle("���� ��������");
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
String title[] = {"��Ϲ�ȣ","��","��","��","���⳻��","����ݾ�","�޸�"};
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
 dialogP1 = new Panel();  // Panel 3�� ���� "���� ���"�� ��ġ
 dialogP2 = new Panel();  //     TextArea�� ��ġ
 dialogP3 = new Panel();  //     close ��ư�� ��ġ
 TextArea textArea = new TextArea(50,50); // TextArea 10�� �� 38�� �ʺ�
 textArea.setEditable(false);    // TextArea ���� �Ұ�(Read Only)
  
 try
 {
	 Class.forName("com.mysql.jdbc.Driver");
 }catch(ClassNotFoundException e){System.out.println("JDBC driver loading error:");}
  try{
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost/webdb","root","jang201311240");
   Statement st=con.createStatement();
   
   String strSql = "select * from allow WHERE  year ='"+year+"' AND month = '"+month+"';";
   JOptionPane.showMessageDialog(null, strSql);
   ResultSet result=st.executeQuery(strSql); //st.executeQuery SQL â�� �Է��ϴ� ��ɾ ����������ִ�. 
   ResultSetMetaData rmdata = result.getMetaData();
   int cols = rmdata.getColumnCount();
   while(result.next())
   {
   textArea.append("\n��Ϲ�ȣ : " + result.getString(1));
   textArea.append("\n��      ¥ : " + result.getString(2)+"��"+result.getString(3)+"��"+result.getString(4)+"��");
   textArea.append("\n���⳻�� : " + result.getString(5));
   textArea.append("\n����ݾ� : " + result.getString(6));
   textArea.append("\n��      �� : " + result.getString(7));
   textArea.append("\n----------------------------------");
   textArea.append("\n                                                   ");
   }

   st.close();
   con.close();
   }catch(SQLException e){System.out.println("SQLException: "+e.getMessage());}
 
  close.addActionListener(this);// ���̾�α� �ݱ�
  dialog.setLocation(400,200);  // ���̾�α� ��ġ�� ���α׷���(Frame)�� ������ ��ġ���� ����
  dialog.setSize(400,600);     // ���̾�α� ������
  dialog.setTitle(year+"��"+month+"�� ���⳻��");    // ���̾�α� ����
  dialog.setLayout(new BorderLayout());  // ���̾�α� Layout
  
  dialogP1.add(new Label("���� ����"));  // Panel1�� ���û����̶�� ���̺� ��ġ
  dialogP2.add(textArea);      // Panel2�� textArea ��ġ
  dialogP3.add(close);      // Panel3�� close��ư ��ġ
  dialog.add(dialogP1,BorderLayout.NORTH); // Panel1�� ���̾�α��� ��ܿ� ��ġ
  dialog.add(dialogP2,BorderLayout.CENTER); // Panel2�� ���̾�α��� ����� ��ġ
  dialog.add(dialogP3,BorderLayout.SOUTH); // Panel3�� ���̾�α��� �ϴܿ� ��ġ
  dialog.show();        // ���̾�α� ������!!
  
  }
   public void actionPerformed (ActionEvent  e) 
 {
  dialog.hide();  // dialog�� ���� ���ش�.
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
  del = new JButton("���ڵ����");
  codeField = new JTextField(8);
  del.addActionListener(this);
  
  //��ư�̺�Ʈ
  
  p1.add(new JLabel("�����ҵ���ڵ��Է� : "));p1.add(codeField);p1.add(del);
  
  add(p1,BorderLayout.CENTER);
  setLocation(400,100);   
  setSize(400,100);
  setVisible(true);
  setTitle("���ڵ� ����");
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