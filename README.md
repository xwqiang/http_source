# http_source
用于复制文本然后在服务器上curl copy过来


使用方式：

1. 编辑文本： 

`https://github.com/xwqiang/http_source/edit/main/a.txt`

2. 使用文本：

`curl https://raw.githubusercontent.com/xwqiang/http_source/main/a.txt`

3. 上传文件：

` sh ./github.sh `cat hl.png|base64` a.png `

```
#!/bin/sh
content="$1"
filename="$2"
if [[  "_$filename" = "_" ]];
        then filename=`date +%s`;
else
    echo "filename is $2"
fi

 curl -L -X PUT \
  -H "Authorization: Bearer <Your token>" \
  -H "Content-Type: application/octet-stream" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  -H "Accept: application/vnd.github+json" \
  "https://api.github.com/repos/xwqiang/http_source/contents/${filename}" \
  -d "{
	\"message\": \"my curl upload\",
	\"committer\": {
		\"name\": \"wuqiang.xu\",
		\"email\": \"wuqiang.xu@github.com\"
	},
	\"content\": \"${content}\",
	\"sha\": \"95wwwb966ae1c166bd92f8ae7d1c313e738c731dfc3\"
}"
```
