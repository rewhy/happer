.class Landroid/support/v7/graphics/drawable/DrawableContainer$BlockInvalidateCallback;
.super Ljava/lang/Object;
.source "DrawableContainer.java"

# interfaces
.implements Landroid/graphics/drawable/Drawable$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/graphics/drawable/DrawableContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "BlockInvalidateCallback"
.end annotation


# instance fields
.field private mCallback:Landroid/graphics/drawable/Drawable$Callback;


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V
    .registers 6
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Runnable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$BlockInvalidateCallback;->mCallback:Landroid/graphics/drawable/Drawable$Callback;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$BlockInvalidateCallback;->mCallback:Landroid/graphics/drawable/Drawable$Callback;

    invoke-interface {v0, p1, p2, p3, p4}, Landroid/graphics/drawable/Drawable$Callback;->scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V

    :cond_9
    return-void
.end method

.method public unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V
    .registers 4
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Runnable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$BlockInvalidateCallback;->mCallback:Landroid/graphics/drawable/Drawable$Callback;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$BlockInvalidateCallback;->mCallback:Landroid/graphics/drawable/Drawable$Callback;

    invoke-interface {v0, p1, p2}, Landroid/graphics/drawable/Drawable$Callback;->unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V

    :cond_9
    return-void
.end method

.method public unwrap()Landroid/graphics/drawable/Drawable$Callback;
    .registers 3

    iget-object v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$BlockInvalidateCallback;->mCallback:Landroid/graphics/drawable/Drawable$Callback;

    const/4 v1, 0x0

    iput-object v1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$BlockInvalidateCallback;->mCallback:Landroid/graphics/drawable/Drawable$Callback;

    return-object v0
.end method

.method public wrap(Landroid/graphics/drawable/Drawable$Callback;)Landroid/support/v7/graphics/drawable/DrawableContainer$BlockInvalidateCallback;
    .registers 2

    iput-object p1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$BlockInvalidateCallback;->mCallback:Landroid/graphics/drawable/Drawable$Callback;

    return-object p0
.end method
