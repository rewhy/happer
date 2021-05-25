.class Landroid/support/v7/widget/ListPopupWindow$PopupScrollListener;
.super Ljava/lang/Object;
.source "ListPopupWindow.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/ListPopupWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PopupScrollListener"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v7/widget/ListPopupWindow;


# direct methods
.method constructor <init>(Landroid/support/v7/widget/ListPopupWindow;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v7/widget/ListPopupWindow$PopupScrollListener;->this$0:Landroid/support/v7/widget/ListPopupWindow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .registers 5

    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .registers 3

    const/4 p1, 0x1

    if-ne p2, p1, :cond_27

    iget-object p1, p0, Landroid/support/v7/widget/ListPopupWindow$PopupScrollListener;->this$0:Landroid/support/v7/widget/ListPopupWindow;

    invoke-virtual {p1}, Landroid/support/v7/widget/ListPopupWindow;->isInputMethodNotNeeded()Z

    move-result p1

    if-nez p1, :cond_27

    iget-object p1, p0, Landroid/support/v7/widget/ListPopupWindow$PopupScrollListener;->this$0:Landroid/support/v7/widget/ListPopupWindow;

    iget-object p1, p1, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {p1}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_27

    iget-object p1, p0, Landroid/support/v7/widget/ListPopupWindow$PopupScrollListener;->this$0:Landroid/support/v7/widget/ListPopupWindow;

    iget-object p1, p1, Landroid/support/v7/widget/ListPopupWindow;->mHandler:Landroid/os/Handler;

    iget-object p2, p0, Landroid/support/v7/widget/ListPopupWindow$PopupScrollListener;->this$0:Landroid/support/v7/widget/ListPopupWindow;

    iget-object p2, p2, Landroid/support/v7/widget/ListPopupWindow;->mResizePopupRunnable:Landroid/support/v7/widget/ListPopupWindow$ResizePopupRunnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object p1, p0, Landroid/support/v7/widget/ListPopupWindow$PopupScrollListener;->this$0:Landroid/support/v7/widget/ListPopupWindow;

    iget-object p1, p1, Landroid/support/v7/widget/ListPopupWindow;->mResizePopupRunnable:Landroid/support/v7/widget/ListPopupWindow$ResizePopupRunnable;

    invoke-virtual {p1}, Landroid/support/v7/widget/ListPopupWindow$ResizePopupRunnable;->run()V

    :cond_27
    return-void
.end method
