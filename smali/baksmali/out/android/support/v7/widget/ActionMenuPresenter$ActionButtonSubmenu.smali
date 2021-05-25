.class Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;
.super Landroid/support/v7/view/menu/MenuPopupHelper;
.source "ActionMenuPresenter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/ActionMenuPresenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ActionButtonSubmenu"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v7/widget/ActionMenuPresenter;


# direct methods
.method public constructor <init>(Landroid/support/v7/widget/ActionMenuPresenter;Landroid/content/Context;Landroid/support/v7/view/menu/SubMenuBuilder;Landroid/view/View;)V
    .registers 11

    iput-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;->this$0:Landroid/support/v7/widget/ActionMenuPresenter;

    sget v5, Landroid/support/v7/appcompat/R$attr;->actionOverflowMenuStyle:I

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    invoke-direct/range {v0 .. v5}, Landroid/support/v7/view/menu/MenuPopupHelper;-><init>(Landroid/content/Context;Landroid/support/v7/view/menu/MenuBuilder;Landroid/view/View;ZI)V

    invoke-virtual {p3}, Landroid/support/v7/view/menu/SubMenuBuilder;->getItem()Landroid/view/MenuItem;

    move-result-object p2

    check-cast p2, Landroid/support/v7/view/menu/MenuItemImpl;

    invoke-virtual {p2}, Landroid/support/v7/view/menu/MenuItemImpl;->isActionButton()Z

    move-result p2

    if-nez p2, :cond_28

    iget-object p2, p1, Landroid/support/v7/widget/ActionMenuPresenter;->mOverflowButton:Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;

    if-nez p2, :cond_23

    # getter for: Landroid/support/v7/widget/ActionMenuPresenter;->mMenuView:Landroid/support/v7/view/menu/MenuView;
    invoke-static {p1}, Landroid/support/v7/widget/ActionMenuPresenter;->access$200(Landroid/support/v7/widget/ActionMenuPresenter;)Landroid/support/v7/view/menu/MenuView;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    goto :goto_25

    :cond_23
    iget-object p2, p1, Landroid/support/v7/widget/ActionMenuPresenter;->mOverflowButton:Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;

    :goto_25
    invoke-virtual {p0, p2}, Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;->setAnchorView(Landroid/view/View;)V

    :cond_28
    iget-object p1, p1, Landroid/support/v7/widget/ActionMenuPresenter;->mPopupPresenterCallback:Landroid/support/v7/widget/ActionMenuPresenter$PopupPresenterCallback;

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;->setPresenterCallback(Landroid/support/v7/view/menu/MenuPresenter$Callback;)V

    return-void
.end method


# virtual methods
.method protected onDismiss()V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;->this$0:Landroid/support/v7/widget/ActionMenuPresenter;

    const/4 v1, 0x0

    iput-object v1, v0, Landroid/support/v7/widget/ActionMenuPresenter;->mActionButtonPopup:Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;->this$0:Landroid/support/v7/widget/ActionMenuPresenter;

    const/4 v1, 0x0

    iput v1, v0, Landroid/support/v7/widget/ActionMenuPresenter;->mOpenSubMenuId:I

    invoke-super {p0}, Landroid/support/v7/view/menu/MenuPopupHelper;->onDismiss()V

    return-void
.end method
