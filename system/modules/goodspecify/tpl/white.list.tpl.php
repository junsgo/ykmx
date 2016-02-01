<?php defined('G_IN_ADMIN')or exit('No permission resources.'); ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台首页</title>
<link rel="stylesheet" href="<?php echo G_GLOBAL_STYLE; ?>/global/css/global.css" type="text/css">
<link rel="stylesheet" href="<?php echo G_GLOBAL_STYLE; ?>/global/css/style.css" type="text/css">
 <style>
 	th{ border:0px solid #000;}
	tr{ line-height:30px;}
 </style>

</head>
<body>
<div class="header lr10">
	<?php echo $this->headerment();?>
</div>
<div class="bk10"></div>
<div class="table-list lr10">
 <table width="100%" cellspacing="0">
    <thead>
            <tr>
            <th width="100">id</th>
            <th align='left'>用户id</th>
            <th align='left'>用户名</th>
            <th align='left'>备注</th>
            <th align='left'>添加人</th>          
            <th align='left'>添加时间</th>
            <th align='left'>修改人</th>
            <th align='left'>修改时间</th>
            <th align='left'>状态</th>
			<th align='center'>管理操作</th>
            </tr>
    </thead>
    <form action="#" method="post" name="myform">
   <tbody>
   	<?php foreach($brands as $brand){ ?>
       <tr>                 
         <td align='left'><?php echo $brand['id']; ?></td>
         <td align='left'><?php echo $brand['uid']; ?></td>
         <td align='left'><?php echo $brand['username']; ?></td>
         <td align='left'><?php echo $brand['remark']; ?></td>
         <td align='left'><?php echo $brand['add_user']; ?></td>
         <td align='left'><?php echo $brand['dateline'] ? date("Y-m-d H:i:s",$brand['dateline']) : ''; ?></td>
         <td align='left'><?php echo $brand['update_user']; ?></td>
         <td align='left'><?php echo $brand['update_time'] ? date("Y-m-d H:i:s",$brand['update_time']) : ''; ?></td>
         <th align='center'><?php echo $brand['status'] == 0 ? '正常' : '已删除' ?></th>
		 <td align='center'>
         	[<a href="<?php echo G_ADMIN_PATH; ?>/white/edit/<?php echo $brand['id']; ?>">修改</a>]		
            [<a href="<?php echo G_ADMIN_PATH; ?>/white/del/<?php echo $brand['id']; ?>">删除</a>]
         </td>
      </tr>
     <?php } ?>
   </table>
   </form>
 <div id="pages"><ul><li>共 <?php echo $total; ?> 条</li><?php echo $page->show('one','li'); ?></ul></div>

</div><!--table-list end-->

</body>
</html> 
