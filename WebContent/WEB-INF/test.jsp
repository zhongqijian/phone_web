<html> 
<script language="JavaScript"> 
function checkpost() 
{ 
   if(myform.keywords.value==""){alert("请输入内容"); 
    myform.keywords.focus(); 
    return false; 
    
   } 
   if(myform.title.value.length<5){alert("请输入标题"); 
    myform.title.focus(); 
    return false; 
    
   } 
} 
</script>
<form action=search.php name="myform" onsubmit="return checkpost();"> 
关键字：<input type="text" name="keywords"><br> 
标题：<input type="text" name="title"> 
<input type="submit" value="查询"> 
</form>  
</html>