$dir = Read-Host "文件夹（不支持嵌套）"
$filter = Read-Host "文件筛选条件（*.v）"
if ($filter.Equals("")) {
	$filter = "*.v"
}
$dir = $dir.Trim("`"")
$files = Get-ChildItem $dir -Filter $filter
"`n`n要处理的文件列表："
$files
$confirm = Read-Host "确认？（Y/n）"
if ($confirm.Equals("") -or $confirm.Equals("Y") -or $confirm.Equals("y")) {
	foreach ($file in $files) {
		$content = Get-Content $file.FullName
		$file_bak = $file.FullName + ".bak"
		Rename-Item $file.FullName $file_bak
		$content = $content -Replace "\t","    "
		Set-Content $file.FullName -Value $content
		"处理文件：" + $file
	}
}