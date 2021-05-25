.class public abstract Landroid/arch/core/executor/TaskExecutor;
.super Ljava/lang/Object;
.source "TaskExecutor.java"


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    return-void

    nop

    nop

    nop
.end method


# virtual methods
.method public abstract executeOnDiskIO(Ljava/lang/Runnable;)V
    .param p1    # Ljava/lang/Runnable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public executeOnMainThread(Ljava/lang/Runnable;)V
    .registers 3
    .param p1    # Ljava/lang/Runnable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    return-void

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public abstract isMainThread()Z
.end method

.method public abstract postToMainThread(Ljava/lang/Runnable;)V
    .param p1    # Ljava/lang/Runnable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
