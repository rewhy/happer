.class public Landroid/support/v4/view/NestedScrollingParentHelper;
.super Ljava/lang/Object;
.source "NestedScrollingParentHelper.java"


# instance fields
.field private mNestedScrollAxes:I

.field private final mViewGroup:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .registers 2
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/support/v4/view/NestedScrollingParentHelper;->mViewGroup:Landroid/view/ViewGroup;

    return-void
.end method


# virtual methods
.method public getNestedScrollAxes()I
    .registers 2

    iget v0, p0, Landroid/support/v4/view/NestedScrollingParentHelper;->mNestedScrollAxes:I

    return v0
.end method

.method public onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;I)V
    .registers 5
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Landroid/support/v4/view/NestedScrollingParentHelper;->onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;II)V

    return-void
.end method

.method public onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;II)V
    .registers 5
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iput p3, p0, Landroid/support/v4/view/NestedScrollingParentHelper;->mNestedScrollAxes:I

    return-void
.end method

.method public onStopNestedScroll(Landroid/view/View;)V
    .registers 3
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/support/v4/view/NestedScrollingParentHelper;->onStopNestedScroll(Landroid/view/View;I)V

    return-void
.end method

.method public onStopNestedScroll(Landroid/view/View;I)V
    .registers 3
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 p1, 0x0

    iput p1, p0, Landroid/support/v4/view/NestedScrollingParentHelper;->mNestedScrollAxes:I

    return-void
.end method
