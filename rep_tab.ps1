$dir = Read-Host "�ļ��У���֧��Ƕ�ף�"
$filter = Read-Host "�ļ�ɸѡ������*.v��"
if ($filter.Equals("")) {
	$filter = "*.v"
}
$dir = $dir.Trim("`"")
$files = Get-ChildItem $dir -Filter $filter
"`n`nҪ������ļ��б�"
$files
$confirm = Read-Host "ȷ�ϣ���Y/n��"
if ($confirm.Equals("") -or $confirm.Equals("Y") -or $confirm.Equals("y")) {
	foreach ($file in $files) {
		$content = Get-Content $file.FullName
		$file_bak = $file.FullName + ".bak"
		Rename-Item $file.FullName $file_bak
		$content = $content -Replace "\t","    "
		Set-Content $file.FullName -Value $content
		"�����ļ���" + $file
	}
}