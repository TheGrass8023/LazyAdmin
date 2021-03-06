<#import "/spring.ftl" as spring />
<!DOCTYPE html>
<html class="ie9">
<#include "../common/style.ftl">
<body id="skin-blur-violate">
<#include  "../common/header.ftl">
<div class="clearfix"></div>
<section id="main" class="p-relative" role="main">
    <!-- Sidebar -->
<#include "../common/sidebar.ftl">
    <!-- Content -->
    <section id="content" class="container">
        <!-- Messages Drawer -->
    <#include "../common/messages.ftl">
        <h2 class="page-title">视频管理</h2>
        <hr class="whiter">
        <!-- Media Player -->
        <div class="block-area">
        <#if msg??>
            <div class="alert alert-success" id="msg">
            ${msg}
            </div>
        </#if>
        <@shiro.hasPermission name="video:create"><h2 class="block-title"><a href="create">+新增视频内容</a></h2>
            <hr class="whiter">
            <br/><br/>
        </@shiro.hasPermission>
            <!-- Video -->
            <div class="row">
            <#if videos?exists>

                <#list videos as video >
                    <div class="col-md-3 m-b-20">

                        <video controls width="100%" height="100%" id="multiCodec"
                               id="media" src="${video.url}"/>
                        </video>
                        <br/>
                        <p><a href="./video/${video.id}.html">${video.title}</a></p>

                        <div class="row">
                            <div class="col-md-6 m-b-20">
                            </div>

                            <@shiro.hasPermission name="video:modify">
                                <div class="col-md-3 m-b-20">
                                    <button class="btn btn-block btn-alt"
                                            onclick="javascript:window.location.href='${video.id}'">编辑
                                    </button>
                                </div>
                            </@shiro.hasPermission>

                            <@shiro.hasPermission name="video:delete">
                                <div class="col-md-3 m-b-20">
                                    <button class="btn btn-block btn-info"
                                            onclick="javascript:window.location.href='delete?id=${video.id}'">删除
                                    </button>
                                </div>
                            </@shiro.hasPermission>
                        </div>
                    </div>
                </#list>
            </#if>
            </div>
        </div>
    </section>
</section>
<#include "../common/js.ftl">
<script>
    window.onload = function () {
        window.setInterval(function () {
            $("#msg").hide()
        }, 2000);
    }
</script>
</body>
</html>