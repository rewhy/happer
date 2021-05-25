.class public Landroid/support/v7/view/menu/SubMenuBuilder;
.super Landroid/support/v7/view/menu/MenuBuilder;
.source "SubMenuBuilder.java"

# interfaces
.implements Landroid/view/SubMenu;


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation


# instance fields
.field private mItem:Landroid/support/v7/view/menu/MenuItemImpl;

.field private mParentMenu:Landroid/support/v7/view/menu/MenuBuilder;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/support/v7/view/menu/MenuBuilder;Landroid/support/v7/view/menu/MenuItemImpl;)V
    .registers 4

    invoke-direct {p0, p1}, Landroid/support/v7/view/menu/MenuBuilder;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Landroid/support/v7/view/menu/SubMenuBuilder;->mParentMenu:Landroid/support/v7/view/menu/MenuBuilder;

    iput-object p3, p0, Landroid/support/v7/view/menu/SubMenuBuilder;->mItem:Landroid/support/v7/view/menu/MenuItemImpl;

    return-void
.end method


# virtual methods
.method public collapseItemActionView(Landroid/support/v7/view/menu/MenuItemImpl;)Z
    .registers 3

    iget-object v0, p0, Landroid/support/v7/view/menu/SubMenuBuilder;->mParentMenu:Landroid/support/v7/view/menu/MenuBuilder;

    invoke-virtual {v0, p1}, Landroid/support/v7/view/menu/MenuBuilder;->collapseItemActionView(Landroid/support/v7/view/menu/MenuItemImpl;)Z

    move-result p1

    return p1
.end method

.method dispatchMenuItemSelected(Landroid/support/v7/view/menu/MenuBuilder;Landroid/view/MenuItem;)Z
    .registers 4

    invoke-super {p0, p1, p2}, Landroid/support/v7/view/menu/MenuBuilder;->dispatchMenuItemSelected(Landroid/support/v7/view/menu/MenuBuilder;Landroid/view/MenuItem;)Z

    move-result v0

    if-nez v0, :cond_11

    iget-object v0, p0, Landroid/support/v7/view/menu/SubMenuBuilder;->mParentMenu:Landroid/support/v7/view/menu/MenuBuilder;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/view/menu/MenuBuilder;->dispatchMenuItemSelected(Landroid/support/v7/view/menu/MenuBuilder;Landroid/view/MenuItem;)Z

    move-result p1

    if-eqz p1, :cond_f

    goto :goto_11

    :cond_f
    const/4 p1, 0x0

    goto :goto_12

    :cond_11
    :goto_11
    const/4 p1, 0x1

    :goto_12
    return p1
.end method

.method public expandItemActionView(Landroid/support/v7/view/menu/MenuItemImpl;)Z
    .registers 3

    iget-object v0, p0, Landroid/support/v7/view/menu/SubMenuBuilder;->mParentMenu:Landroid/support/v7/view/menu/MenuBuilder;

    invoke-virtual {v0, p1}, Landroid/support/v7/view/menu/MenuBuilder;->expandItemActionView(Landroid/support/v7/view/menu/MenuItemImpl;)Z

    move-result p1

    return p1
.end method

.method public getActionViewStatesKey()Ljava/lang/String;
    .registers 4

    iget-object v0, p0, Landroid/support/v7/view/menu/SubMenuBuilder;->mItem:Landroid/support/v7/view/menu/MenuItemImpl;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/view/menu/SubMenuBuilder;->mItem:Landroid/support/v7/view/menu/MenuItemImpl;

    invoke-virtual {v0}, Landroid/support/v7/view/menu/MenuItemImpl;->getItemId()I

    move-result v0

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    if-nez v0, :cond_10

    const/4 v0, 0x0

    return-object v0

    :cond_10
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Landroid/support/v7/view/menu/MenuBuilder;->getActionViewStatesKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getItem()Landroid/view/MenuItem;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/view/menu/SubMenuBuilder;->mItem:Landroid/support/v7/view/menu/MenuItemImpl;

    return-object v0
.end method

.method public getParentMenu()Landroid/view/Menu;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/view/menu/SubMenuBuilder;->mParentMenu:Landroid/support/v7/view/menu/MenuBuilder;

    return-object v0
.end method

.method public getRootMenu()Landroid/support/v7/view/menu/MenuBuilder;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/view/menu/SubMenuBuilder;->mParentMenu:Landroid/support/v7/view/menu/MenuBuilder;

    invoke-virtual {v0}, Landroid/support/v7/view/menu/MenuBuilder;->getRootMenu()Landroid/support/v7/view/menu/MenuBuilder;

    move-result-object v0

    return-object v0
.end method

.method public isGroupDividerEnabled()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/view/menu/SubMenuBuilder;->mParentMenu:Landroid/support/v7/view/menu/MenuBuilder;

    invoke-virtual {v0}, Landroid/support/v7/view/menu/MenuBuilder;->isGroupDividerEnabled()Z

    move-result v0

    return v0
.end method

.method public isQwertyMode()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/view/menu/SubMenuBuilder;->mParentMenu:Landroid/support/v7/view/menu/MenuBuilder;

    invoke-virtual {v0}, Landroid/support/v7/view/menu/MenuBuilder;->isQwertyMode()Z

    move-result v0

    return v0
.end method

.method public isShortcutsVisible()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/view/menu/SubMenuBuilder;->mParentMenu:Landroid/support/v7/view/menu/MenuBuilder;

    invoke-virtual {v0}, Landroid/support/v7/view/menu/MenuBuilder;->isShortcutsVisible()Z

    move-result v0

    return v0
.end method

.method public setCallback(Landroid/support/v7/view/menu/MenuBuilder$Callback;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/view/menu/SubMenuBuilder;->mParentMenu:Landroid/support/v7/view/menu/MenuBuilder;

    invoke-virtual {v0, p1}, Landroid/support/v7/view/menu/MenuBuilder;->setCallback(Landroid/support/v7/view/menu/MenuBuilder$Callback;)V

    return-void
.end method

.method public setGroupDividerEnabled(Z)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/view/menu/SubMenuBuilder;->mParentMenu:Landroid/support/v7/view/menu/MenuBuilder;

    invoke-virtual {v0, p1}, Landroid/support/v7/view/menu/MenuBuilder;->setGroupDividerEnabled(Z)V

    return-void
.end method

.method public setHeaderIcon(I)Landroid/view/SubMenu;
    .registers 2

    invoke-super {p0, p1}, Landroid/support/v7/view/menu/MenuBuilder;->setHeaderIconInt(I)Landroid/support/v7/view/menu/MenuBuilder;

    move-result-object p1

    check-cast p1, Landroid/view/SubMenu;

    return-object p1
.end method

.method public setHeaderIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/SubMenu;
    .registers 2

    invoke-super {p0, p1}, Landroid/support/v7/view/menu/MenuBuilder;->setHeaderIconInt(Landroid/graphics/drawable/Drawable;)Landroid/support/v7/view/menu/MenuBuilder;

    move-result-object p1

    check-cast p1, Landroid/view/SubMenu;

    return-object p1
.end method

.method public setHeaderTitle(I)Landroid/view/SubMenu;
    .registers 2

    invoke-super {p0, p1}, Landroid/support/v7/view/menu/MenuBuilder;->setHeaderTitleInt(I)Landroid/support/v7/view/menu/MenuBuilder;

    move-result-object p1

    check-cast p1, Landroid/view/SubMenu;

    return-object p1
.end method

.method public setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/SubMenu;
    .registers 2

    invoke-super {p0, p1}, Landroid/support/v7/view/menu/MenuBuilder;->setHeaderTitleInt(Ljava/lang/CharSequence;)Landroid/support/v7/view/menu/MenuBuilder;

    move-result-object p1

    check-cast p1, Landroid/view/SubMenu;

    return-object p1
.end method

.method public setHeaderView(Landroid/view/View;)Landroid/view/SubMenu;
    .registers 2

    invoke-super {p0, p1}, Landroid/support/v7/view/menu/MenuBuilder;->setHeaderViewInt(Landroid/view/View;)Landroid/support/v7/view/menu/MenuBuilder;

    move-result-object p1

    check-cast p1, Landroid/view/SubMenu;

    return-object p1
.end method

.method public setIcon(I)Landroid/view/SubMenu;
    .registers 3

    iget-object v0, p0, Landroid/support/v7/view/menu/SubMenuBuilder;->mItem:Landroid/support/v7/view/menu/MenuItemImpl;

    invoke-virtual {v0, p1}, Landroid/support/v7/view/menu/MenuItemImpl;->setIcon(I)Landroid/view/MenuItem;

    return-object p0
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/SubMenu;
    .registers 3

    iget-object v0, p0, Landroid/support/v7/view/menu/SubMenuBuilder;->mItem:Landroid/support/v7/view/menu/MenuItemImpl;

    invoke-virtual {v0, p1}, Landroid/support/v7/view/menu/MenuItemImpl;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    return-object p0
.end method

.method public setQwertyMode(Z)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/view/menu/SubMenuBuilder;->mParentMenu:Landroid/support/v7/view/menu/MenuBuilder;

    invoke-virtual {v0, p1}, Landroid/support/v7/view/menu/MenuBuilder;->setQwertyMode(Z)V

    return-void
.end method

.method public setShortcutsVisible(Z)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/view/menu/SubMenuBuilder;->mParentMenu:Landroid/support/v7/view/menu/MenuBuilder;

    invoke-virtual {v0, p1}, Landroid/support/v7/view/menu/MenuBuilder;->setShortcutsVisible(Z)V

    return-void
.end method
