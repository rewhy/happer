.class public Landroid/support/v7/widget/ScrollingTabContainerView$VisibilityAnimListener;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ScrollingTabContainerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/ScrollingTabContainerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "VisibilityAnimListener"
.end annotation


# instance fields
.field private mCanceled:Z

.field private mFinalVisibility:I

.field final synthetic this$0:Landroid/support/v7/widget/ScrollingTabContainerView;


# direct methods
.method protected constructor <init>(Landroid/support/v7/widget/ScrollingTabContainerView;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v7/widget/ScrollingTabContainerView$VisibilityAnimListener;->this$0:Landroid/support/v7/widget/ScrollingTabContainerView;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Landroid/support/v7/widget/ScrollingTabContainerView$VisibilityAnimListener;->mCanceled:Z

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .registers 2

    const/4 p1, 0x1

    iput-boolean p1, p0, Landroid/support/v7/widget/ScrollingTabContainerView$VisibilityAnimListener;->mCanceled:Z

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 3

    iget-boolean p1, p0, Landroid/support/v7/widget/ScrollingTabContainerView$VisibilityAnimListener;->mCanceled:Z

    if-eqz p1, :cond_5

    return-void

    :cond_5
    iget-object p1, p0, Landroid/support/v7/widget/ScrollingTabContainerView$VisibilityAnimListener;->this$0:Landroid/support/v7/widget/ScrollingTabContainerView;

    const/4 v0, 0x0

    iput-object v0, p1, Landroid/support/v7/widget/ScrollingTabContainerView;->mVisibilityAnim:Landroid/view/ViewPropertyAnimator;

    iget-object p1, p0, Landroid/support/v7/widget/ScrollingTabContainerView$VisibilityAnimListener;->this$0:Landroid/support/v7/widget/ScrollingTabContainerView;

    iget v0, p0, Landroid/support/v7/widget/ScrollingTabContainerView$VisibilityAnimListener;->mFinalVisibility:I

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/ScrollingTabContainerView;->setVisibility(I)V

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .registers 3

    iget-object p1, p0, Landroid/support/v7/widget/ScrollingTabContainerView$VisibilityAnimListener;->this$0:Landroid/support/v7/widget/ScrollingTabContainerView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/ScrollingTabContainerView;->setVisibility(I)V

    iput-boolean v0, p0, Landroid/support/v7/widget/ScrollingTabContainerView$VisibilityAnimListener;->mCanceled:Z

    return-void
.end method

.method public withFinalVisibility(Landroid/view/ViewPropertyAnimator;I)Landroid/support/v7/widget/ScrollingTabContainerView$VisibilityAnimListener;
    .registers 3

    iput p2, p0, Landroid/support/v7/widget/ScrollingTabContainerView$VisibilityAnimListener;->mFinalVisibility:I

    iget-object p2, p0, Landroid/support/v7/widget/ScrollingTabContainerView$VisibilityAnimListener;->this$0:Landroid/support/v7/widget/ScrollingTabContainerView;

    iput-object p1, p2, Landroid/support/v7/widget/ScrollingTabContainerView;->mVisibilityAnim:Landroid/view/ViewPropertyAnimator;

    return-object p0
.end method
