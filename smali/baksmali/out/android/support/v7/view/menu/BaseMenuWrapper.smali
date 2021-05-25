.class abstract Landroid/support/v7/view/menu/BaseMenuWrapper;
.super Landroid/support/v7/view/menu/BaseWrapper;
.source "BaseMenuWrapper.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/support/v7/view/menu/BaseWrapper<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final mContext:Landroid/content/Context;

.field private mMenuItems:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/support/v4/internal/view/SupportMenuItem;",
            "Landroid/view/MenuItem;",
            ">;"
        }
    .end annotation
.end field

.field private mSubMenus:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/support/v4/internal/view/SupportSubMenu;",
            "Landroid/view/SubMenu;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "TT;)V"
        }
    .end annotation

    invoke-direct {p0, p2}, Landroid/support/v7/view/menu/BaseWrapper;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Landroid/support/v7/view/menu/BaseMenuWrapper;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method final getMenuItemWrapper(Landroid/view/MenuItem;)Landroid/view/MenuItem;
    .registers 4

    instance-of v0, p1, Landroid/support/v4/internal/view/SupportMenuItem;

    if-eqz v0, :cond_28

    move-object v0, p1

    check-cast v0, Landroid/support/v4/internal/view/SupportMenuItem;

    iget-object v1, p0, Landroid/support/v7/view/menu/BaseMenuWrapper;->mMenuItems:Ljava/util/Map;

    if-nez v1, :cond_12

    new-instance v1, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v1}, Landroid/support/v4/util/ArrayMap;-><init>()V

    iput-object v1, p0, Landroid/support/v7/view/menu/BaseMenuWrapper;->mMenuItems:Ljava/util/Map;

    :cond_12
    iget-object v1, p0, Landroid/support/v7/view/menu/BaseMenuWrapper;->mMenuItems:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/MenuItem;

    if-nez p1, :cond_27

    iget-object p1, p0, Landroid/support/v7/view/menu/BaseMenuWrapper;->mContext:Landroid/content/Context;

    invoke-static {p1, v0}, Landroid/support/v7/view/menu/MenuWrapperFactory;->wrapSupportMenuItem(Landroid/content/Context;Landroid/support/v4/internal/view/SupportMenuItem;)Landroid/view/MenuItem;

    move-result-object p1

    iget-object v1, p0, Landroid/support/v7/view/menu/BaseMenuWrapper;->mMenuItems:Ljava/util/Map;

    invoke-interface {v1, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_27
    return-object p1

    :cond_28
    return-object p1
.end method

.method final getSubMenuWrapper(Landroid/view/SubMenu;)Landroid/view/SubMenu;
    .registers 4

    instance-of v0, p1, Landroid/support/v4/internal/view/SupportSubMenu;

    if-eqz v0, :cond_27

    check-cast p1, Landroid/support/v4/internal/view/SupportSubMenu;

    iget-object v0, p0, Landroid/support/v7/view/menu/BaseMenuWrapper;->mSubMenus:Ljava/util/Map;

    if-nez v0, :cond_11

    new-instance v0, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/ArrayMap;-><init>()V

    iput-object v0, p0, Landroid/support/v7/view/menu/BaseMenuWrapper;->mSubMenus:Ljava/util/Map;

    :cond_11
    iget-object v0, p0, Landroid/support/v7/view/menu/BaseMenuWrapper;->mSubMenus:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/SubMenu;

    if-nez v0, :cond_26

    iget-object v0, p0, Landroid/support/v7/view/menu/BaseMenuWrapper;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Landroid/support/v7/view/menu/MenuWrapperFactory;->wrapSupportSubMenu(Landroid/content/Context;Landroid/support/v4/internal/view/SupportSubMenu;)Landroid/view/SubMenu;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v7/view/menu/BaseMenuWrapper;->mSubMenus:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_26
    return-object v0

    :cond_27
    return-object p1
.end method

.method final internalClear()V
    .registers 2

    iget-object v0, p0, Landroid/support/v7/view/menu/BaseMenuWrapper;->mMenuItems:Ljava/util/Map;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/view/menu/BaseMenuWrapper;->mMenuItems:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    :cond_9
    iget-object v0, p0, Landroid/support/v7/view/menu/BaseMenuWrapper;->mSubMenus:Ljava/util/Map;

    if-eqz v0, :cond_12

    iget-object v0, p0, Landroid/support/v7/view/menu/BaseMenuWrapper;->mSubMenus:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    :cond_12
    return-void
.end method

.method final internalRemoveGroup(I)V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/view/menu/BaseMenuWrapper;->mMenuItems:Ljava/util/Map;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Landroid/support/v7/view/menu/BaseMenuWrapper;->mMenuItems:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_f
    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_25

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/MenuItem;

    invoke-interface {v1}, Landroid/view/MenuItem;->getGroupId()I

    move-result v1

    if-ne p1, v1, :cond_f

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_f

    :cond_25
    return-void
.end method

.method final internalRemoveItem(I)V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/view/menu/BaseMenuWrapper;->mMenuItems:Ljava/util/Map;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Landroid/support/v7/view/menu/BaseMenuWrapper;->mMenuItems:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_24

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/MenuItem;

    invoke-interface {v1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    if-ne p1, v1, :cond_f

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    :cond_24
    return-void
.end method
