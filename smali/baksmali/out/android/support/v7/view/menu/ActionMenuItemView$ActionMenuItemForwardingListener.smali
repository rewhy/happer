.class Landroid/support/v7/view/menu/ActionMenuItemView$ActionMenuItemForwardingListener;
.super Landroid/support/v7/widget/ForwardingListener;
.source "ActionMenuItemView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/view/menu/ActionMenuItemView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ActionMenuItemForwardingListener"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v7/view/menu/ActionMenuItemView;


# direct methods
.method public constructor <init>(Landroid/support/v7/view/menu/ActionMenuItemView;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v7/view/menu/ActionMenuItemView$ActionMenuItemForwardingListener;->this$0:Landroid/support/v7/view/menu/ActionMenuItemView;

    invoke-direct {p0, p1}, Landroid/support/v7/widget/ForwardingListener;-><init>(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public getPopup()Landroid/support/v7/view/menu/ShowableListMenu;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/view/menu/ActionMenuItemView$ActionMenuItemForwardingListener;->this$0:Landroid/support/v7/view/menu/ActionMenuItemView;

    iget-object v0, v0, Landroid/support/v7/view/menu/ActionMenuItemView;->mPopupCallback:Landroid/support/v7/view/menu/ActionMenuItemView$PopupCallback;

    if-eqz v0, :cond_f

    iget-object v0, p0, Landroid/support/v7/view/menu/ActionMenuItemView$ActionMenuItemForwardingListener;->this$0:Landroid/support/v7/view/menu/ActionMenuItemView;

    iget-object v0, v0, Landroid/support/v7/view/menu/ActionMenuItemView;->mPopupCallback:Landroid/support/v7/view/menu/ActionMenuItemView$PopupCallback;

    invoke-virtual {v0}, Landroid/support/v7/view/menu/ActionMenuItemView$PopupCallback;->getPopup()Landroid/support/v7/view/menu/ShowableListMenu;

    move-result-object v0

    return-object v0

    :cond_f
    const/4 v0, 0x0

    return-object v0
.end method

.method protected onForwardingStarted()Z
    .registers 4

    iget-object v0, p0, Landroid/support/v7/view/menu/ActionMenuItemView$ActionMenuItemForwardingListener;->this$0:Landroid/support/v7/view/menu/ActionMenuItemView;

    iget-object v0, v0, Landroid/support/v7/view/menu/ActionMenuItemView;->mItemInvoker:Landroid/support/v7/view/menu/MenuBuilder$ItemInvoker;

    const/4 v1, 0x0

    if-eqz v0, :cond_23

    iget-object v0, p0, Landroid/support/v7/view/menu/ActionMenuItemView$ActionMenuItemForwardingListener;->this$0:Landroid/support/v7/view/menu/ActionMenuItemView;

    iget-object v0, v0, Landroid/support/v7/view/menu/ActionMenuItemView;->mItemInvoker:Landroid/support/v7/view/menu/MenuBuilder$ItemInvoker;

    iget-object v2, p0, Landroid/support/v7/view/menu/ActionMenuItemView$ActionMenuItemForwardingListener;->this$0:Landroid/support/v7/view/menu/ActionMenuItemView;

    iget-object v2, v2, Landroid/support/v7/view/menu/ActionMenuItemView;->mItemData:Landroid/support/v7/view/menu/MenuItemImpl;

    invoke-interface {v0, v2}, Landroid/support/v7/view/menu/MenuBuilder$ItemInvoker;->invokeItem(Landroid/support/v7/view/menu/MenuItemImpl;)Z

    move-result v0

    if-eqz v0, :cond_23

    invoke-virtual {p0}, Landroid/support/v7/view/menu/ActionMenuItemView$ActionMenuItemForwardingListener;->getPopup()Landroid/support/v7/view/menu/ShowableListMenu;

    move-result-object v0

    if-eqz v0, :cond_22

    invoke-interface {v0}, Landroid/support/v7/view/menu/ShowableListMenu;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_22

    const/4 v1, 0x1

    :cond_22
    return v1

    :cond_23
    return v1
.end method
