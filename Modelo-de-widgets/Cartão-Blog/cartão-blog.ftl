<div class="row widget-mode-card">
    <ul class="card-page">
        <#if entries?has_content>
            <#list entries as curBlogEntry>
                <#if curBlogEntry.getCoverImageURL(themeDisplay)??>
                    <#assign cardImage=true />
                    <#else>
                        <#assign cardImage=false />
                </#if>
                <li class="card-page-item card-page-item-asset">
                    <div class="card">
                        <div class="aspect-ratio aspect-ratio-8-to-3 card-item-first">
                            <img alt="thumbnail" class="aspect-ratio-item-center-middle aspect-ratio-item-fluid" src="${cardImage?then(curBlogEntry.getCoverImageURL(themeDisplay), portalUtil.getPathContext(renderRequest) + "/images/cover_image_placeholder.jpg")}">
                        </div>
                        <div class="card-body widget-topbar">
                            <div class="autofit-row card-title">
                                <div class="autofit-col autofit-col-expand conteudo">
                                    <#assign viewEntryPortletURL=renderResponse.createRenderURL() />
                                    ${viewEntryPortletURL.setParameter("mvcRenderCommandName", "/blogs/view_entry")}
                                    ${viewEntryPortletURL.setParameter("redirect", currentURL)}
                                    <#if validator.isNotNull(curBlogEntry.getUrlTitle())>
                                        ${viewEntryPortletURL.setParameter("urlTitle", curBlogEntry.getUrlTitle())}
                                        <#else>
                                            ${viewEntryPortletURL.setParameter("entryId", curBlogEntry.getEntryId()?string)}
                                    </#if>
                                    <h3 class="title">
                                        <a class="title-link" href="${viewEntryPortletURL.toString()}">
                                            ${htmlUtil.escape(blogsEntryUtil.getDisplayTitle(resourceBundle, curBlogEntry))}
                                        </a>
                                    </h3>
                                </div>
                                <div class="autofit-col">
                                    <@clay["dropdown-actions"]
                                        additionalProps=blogsEntryActionDropdownAdditionalProps
                                        dropdownItems=blogsEntryActionDropdownItemsProvider.getActionDropdownItems(curBlogEntry)
                                        propsTransformer="blogs_admin/js/ElementsPropsTransformer"
                                        propsTransformerServletContext=blogsEntryActionDropdownPropsTransformerServletContext />
                                </div>
                            </div>
                            <#if validator.isNotNull(curBlogEntry.getDescription())>
                                <#assign content=curBlogEntry.getDescription() />
                                <#else>
                                    <#assign content=curBlogEntry.getContent() />
                            </#if>
                            <#if cardImage>
                                <p class="widget-resume">
                                    ${stringUtil.shorten(htmlUtil.stripHtml(content), 150)}
                                </p>
                                <#else>
                                    <p class="widget-resume">
                                        ${stringUtil.shorten(htmlUtil.stripHtml(content), 400)}
                                    </p>
                            </#if>
                        </div>
                        <div class="card-footer">
                            <div class="autofit-float autofit-row autofit-row-center widget-toolbar">
                                <#if blogsPortletInstanceConfiguration.enableComments()>
                                    <div class="autofit-col">
                                        <#assign viewCommentsPortletURL=renderResponse.createRenderURL() />
                                        ${viewCommentsPortletURL.setParameter("mvcRenderCommandName", "/blogs/view_entry")}
                                        ${viewCommentsPortletURL.setParameter("scroll", renderResponse.getNamespace() + "discussionContainer")}
                                        <#if validator.isNotNull(curBlogEntry.getUrlTitle())>
                                            ${viewCommentsPortletURL.setParameter("urlTitle", curBlogEntry.getUrlTitle())}
                                            <#else>
                                                ${viewCommentsPortletURL.setParameter("entryId", curBlogEntry.getEntryId()?string)}
                                        </#if>
                                        <a class="btn btn-outline-borderless btn-outline-secondary btn-sm" href="${viewCommentsPortletURL.toString()}" title="${language.get(locale, "comments")}">
                                            <span class="inline-item inline-item-before">
                                                <@clay["icon"]
                                                    symbol="comments" />
                                            </span>
                                            ${commentManager.getCommentsCount("com.liferay.blogs.model.BlogsEntry", curBlogEntry.getEntryId())}
                                        </a>
                                    </div>
                                </#if>
                                <#if blogsPortletInstanceConfiguration.enableRatings()>
                                    <div class="autofit-col">
                                        <@liferay_ratings["ratings"]
                                            className="com.liferay.blogs.model.BlogsEntry"
                                            classPK=curBlogEntry.getEntryId() />
                                    </div>
                                </#if>
                                <div class="autofit-col autofit-col-end">
                                    <#assign bookmarkURL=renderResponse.createRenderURL() />
                                    ${bookmarkURL.setWindowState(windowStateFactory.getWindowState("NORMAL"))}
                                    ${bookmarkURL.setParameter("mvcRenderCommandName", "/blogs/view_entry")}
                                    <#if validator.isNotNull(curBlogEntry.getUrlTitle())>
                                        ${bookmarkURL.setParameter("urlTitle", curBlogEntry.getUrlTitle())}
                                        <#else>
                                            ${bookmarkURL.setParameter("entryId", curBlogEntry.getEntryId()?string)}
                                    </#if>
                                    <@liferay_social_bookmarks["bookmarks"]
                                        className="com.liferay.blogs.model.BlogsEntry"
                                        classPK=curBlogEntry.getEntryId()
                                        maxInlineItems=0
                                        target="_blank"
                                        title=blogsEntryUtil.getDisplayTitle(resourceBundle, curBlogEntry)
                                        types=blogsPortletInstanceConfiguration.socialBookmarksTypes()
                                        url=portalUtil.getCanonicalURL(bookmarkURL.toString(), themeDisplay, themeDisplay.getLayout()) />
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </#list>
        </#if>
    </ul>
</div>
<style>
.row {
    display: block;
}

.widget-mode-card .widget-topbar .title {
    text-align: left;
    font-size: 18px;
}

.card {
    background-color: #f1f1f1;
    transition: background-color 0.5s ease;
}

.card:hover {
    background-color: rgba(164, 90, 90, 0.365);
    transform: scale(1.1);
}

.card p {
    color: rgb(34, 34, 34);
    text-align: left;
    font-size: 12px;
}

.card a {
    color: rgb(34, 34, 34);
}

.conteudo .title .title-link {
    color: rgb(34, 34, 34);
    text-decoration: none;
}

.conteudo .title .title-link:hover {
    color: rgb(34, 34, 34);
}
</style>