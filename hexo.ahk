; ------------------------------------------------
; 函数，利用Hexo创建新文章
SendHexo() {
    WinActive( gitbash )
	global postname
    Send, cd /E/hexo_github/{enter}hexo new '%postname%' {enter}
	sleep 10000
    return 1
}

; ------------------------------------------------
; 函数，在hexo所在目录创建新文章
SendHexoWithNoCd(){
    global postname
	InputBox, postname, Hexo new post:, please input the post name:.
    Send, hexo new '%postname%' {enter}
	sleep 10000
	Runwait, D:\soft\markdownpad\MarkdownPad2.exe "E:\hexo_github\source\_posts\%postname%.md"
    WinActive( %postname% - MarkdownPad 2 )
}
CdHexo()
{
}

; ------------------------------------------------
; 利用Hexo创建新的文章
#n::
if WinExist( "MINGW32:/E/hexo_github" )
{
	WinActivate
	SendHexoWithNoCd()
}
else {
    global postname
	InputBox, postname, Hexo new post:, please input the post name:.

	if ErrorLevel
		return
	else {
        Run D:\soft\git\Git\bin\sh.exe --login -i
		sleep 3000
        hexoinput := SendHexo()
		if hexoinput=1
		{
		   Runwait, D:\soft\markdownpad\MarkdownPad2.exe "E:\hexo_github\source\_posts\%postname%.md"
		   WinActive( %postname% - MarkdownPad 2 )
		}
	}

}   
Return

; ------------------------------------------------
; 进入Hexo所在根目录
#c::
if WinExist( "MINGW32:/E/hexo_github" )
{  
  WinActivate
  Send, cd /E/hexo_github/{enter}
} 
else
{
    Run D:\soft\git\Git\bin\sh.exe --login -i
	sleep 3000
	WinActive( gitbash )
	Send, cd /E/hexo_github/{enter}
} 
	
Return

; ------------------------------------------------
; 上传新文章
#d::
if WinExist( "MINGW32:/E/hexo_github" )
{  
  WinActivate
  Send, hexo d -g{enter}exit{enter}
} 
else
{
    Run D:\soft\git\Git\bin\sh.exe --login -i
	sleep 3000
	WinActive( gitbash )
	Send, cd /E/hexo_github/{enter}hexo d -g{enter}exit{enter}
} 
Return
